////////////////////////////////////////////////////////////////////////////////
// Macros and consts

@state ods_log1 = -2.30258509; //negative # can't be const literal, so need to use @state instead...

//#define PI 3.1415926535898f //pi
//#define MINUSPI -3.1415926535898f
//#define TWOPI 6.28318530717952646f //twopi
//#define INV_TWOPI 0.1591549430919f
const inv_twopi = 0.1591549430919;

//#define ODS_LOG_LOWER_LIMIT 2e-42
const ods_log_power_limit = 2e-42; //2 * 10^-42
//#define ODS_LOGOF_LOG_LOWER_LIMIT -96.0154267
@state ods_logof_log_lower_limit = -96.0154267;
//#define ODS_ABSINVOF_LOGOF_LOG_LOWER_LIMIT 0.010414993
const ods_absinvof_logof_log_lower_limit = 0.010414993;

//add enable_logging const
//@state enable_logging = 1;

////////////////////////////////////////////////////////////////////////////////
// Constants

//Onsets.kr(chain, threshold: 0.5, odftype: 'rcomplex', relaxtime: 1, floor: 0.1, mingap: 10, medianspan: 11, whtype: 1, rawodf: 0)


//Threshold (of ODF value, after median processing) for detection. typically between 0 and 1, although in rare cases you may find values outside this range useful.
@param({min: 0.0, max: 1.0}) thresh = 0.5;
@state last_thresh = 0.0;


//relaxtime and floor are parameters to the whitening process used, a kind of normalisation of the FFT signal. (Note: in \mkl mode these are not used.)
//relaxtime specifies the time (in seconds) for the normalisation to "forget" about a recent onset. If you find too much re-triggering (e.g. as a note dies away unevenly) then you might wish to increase this value.
@param({min: 0.0, max: 4.0}) relaxtime = 1.0; // Do NOT set this directly. Use onsetsds_setrelax() which will also update relaxcoef.
@state last_relaxtime = 0.0;

//floor is a lower limit, connected to the idea of how quiet the sound is expected to get without becoming indistinguishable from noise. For some cleanly-recorded classical music with wide dynamic variations, I found it helpful to go down as far as 0.000001.
@param({min: 0.0, max: 1.0}) floor = 0.1;
@state last_floor = 0.0;

//mingap specifies a minimum gap (in entire FFT buffer frames / Onsets_next() steps triggered by metro/bang polls of this RNBOscript object) between onset detections, a brute-force way to prevent too many doubled detections. (e.g. if Onset_next() is called every 1ms and mingap = 256, it'll take 256 ms for mingap to be decremented to 0)
@param({min: 0, max: 256}) mingap = 10;
@state last_mingap = 0;

//medianspan specifies the size (in FFT frames) of the median window used for smoothing the detection function before triggering.
@param({min: 0, max: 256}) medspan = 11;
@state last_medspan = 0;


/**
 * Types of incoming FFT data format. OnsetsDS needs to know where the FFT
 * data comes from in order to interpret it correctly.
 */

/*
enum onsetsds_fft_types {
    ODS_FFT_SC3_COMPLEX, ///< SuperCollider, cartesian co-ords ("SCComplexBuf") - NB it's more efficient to provide
                         ///< polar data from SC
    ODS_FFT_SC3_POLAR, ///< SuperCollider, polar co-ords ("SCPolarBuf")
    ODS_FFT_FFTW3_HC, ///< FFTW <a
                      ///< href="http://www.fftw.org/fftw3_doc/The-Halfcomplex_002dformat-DFT.html">"halfcomplex"</a>
                      ///< format
    ODS_FFT_FFTW3_R2C ///< FFTW regular format, typically produced using <a
                      ///< href="http://www.fftw.org/fftw3_doc/One_002dDimensional-DFTs-of-Real-Data.html#One_002dDimensional-DFTs-of-Real-Data">real-to-complex</a>
                      ///< transform
};
*/

//not needed in Max RNBO b/c we're only ever converting to Polar (and original source only ever used this and hard coded the 'polar' setting too)
//@param({ enum: [ "ods_fft_sc3_complex", "ods_fft_sc3_polar", "ods_fft_fftw3_hc", "ods_fft_fftw3_r2c"] }) fftformat = 1; //ods_fft_sc3_polar is only ever used in Onsets.cpp: Onsets_next()->onsetsds_init()

/**
 * Types of onset detection function
 */
/*
enum onsetsds_odf_types {
    ODS_ODF_POWER, ///< Power
    ODS_ODF_MAGSUM, ///< Sum of magnitudes
    ODS_ODF_COMPLEX, ///< Complex-domain deviation
    ODS_ODF_RCOMPLEX, ///< Complex-domain deviation, rectified (only increases counted)
    ODS_ODF_PHASE, ///< Phase deviation
    ODS_ODF_WPHASE, ///< Weighted phase deviation
    ODS_ODF_MKL ///< Modified Kullback-Liebler deviation
};
*/
@param({enum: ["power", "magsum", "complex", "rcomplex", "phase", "wphase", "mkl"] }) odftype = 1;
@state last_odftype = 0;
/**
 * Types of whitening - may not all be implemented yet.
 */
/*
enum onsetsds_wh_types {
    ODS_WH_NONE, ///< No whitening - onsetsds_whiten() becomes a no-op
    ODS_WH_ADAPT_MAX1, ///< Adaptive whitening - tracks recent-peak-magnitude in each bin, normalises that to 1
    ODS_WH_NORMMAX, ///< Simple normalisation - each frame is normalised (independent of others) so largest magnitude
                    ///< becomes 1. Not implemented.
    ODS_WH_NORMMEAN ///< Simple normalisation - each frame is normalised (independent of others) so mean magnitude
                    ///< becomes 1. Not implemented.
};
*/
@param({ enum: ["wh_none", "wh_adapt_max1"] }) whtype = 1; //this isn't ever changed anywhere

@param({min: 64, max: 2048}) fftsize = 64;
@state last_fftsize = 0;
@state fftbuf_index : Int = 0; //track the last index to read from fftbuf (needed when I/O buffer size and fftbuf > fftsize)
@state last_samplecount : Int = 0; //track last samplecount value to know when we've started a new I/O buffer

@param({min: 0, max: 1}) needs_init = 1; //for use in Onsets_next() - translated from Onsets.cpp
@state last_needs_init = 0;

//max size needed for max fftsize, medspan, and odftypes: 2048 | 256 | complex/rcomplex
const onsetdetector_data_array_size : Int = 6654;
@state onsetdetector_data_array = new FixedFloatArray(onsetdetector_data_array_size);

@state fftbuf = new buffer("local:fftbuf_1"); //reference to data "fftbuf" object in RNBO patch
////////////////////////////////////////////////////////////////////////////////
// Structs

//since this is a struct, doesn't translate directly to Max as a static FixedArray @state var...will have to maintain this expected structure w/in larger 'onsetdetector_data_array' FixedArray where:
    //mag = [n+0] index | phase = [n+1] index
/*
typedef struct OdsPolarBin {
    float mag, phase;
} OdsPolarBin;
*/

//since this is a struct, doesn't translate directly to Max as a static FixedArray @state var...will have to maintain this expected structure w/in larger 'onsetdetector_data_array' FixedArray where:
    //dc = [n+0] | nyq = [n+1] | bin1 mag = [n+2] | bin1 phase = [n+3] | bin2 mag = [n+4] | bin2 phase = [n+5] | etc...
//IMPORTANT NOTE: since in Max RNBO codebox we're only dealing w/ single sample streams of data instead of buffers, I think we'll only ever be dealing w/ 1 single bin of data at a time in the "OdsPolarBuf" struct context and not having to iterate through potentially larger amounts of bins in this struct like done in original SC source...
/*
typedef struct OdsPolarBuf {
    float dc, nyq;
    OdsPolarBin bin[1];
} OdsPolarBuf;
*/


// The main data structure for the onset detection routine
//typedef struct OnsetsDS {} //this is abstracted away via @state and @param vars

// "data" is a pointer to the memory that must be EXTERNALLY allocated.
// Other pointers will point to locations within this memory.
//float *data,
@state odsdata_size : Int = 0; //added in Max RNBO code to track the total size needed (max index) out of the larger onsetdetector_data_array (in lieu of float* odsdata from original SC source) - should always be <= onsetdetector_data_array_size

//*psp,
//expected to be an index in onsetdetector_data_array
@state psp : Int = 0; //< Peak Spectral Profile - size is numbins+2, data is stored in order dc through to nyquist

//*odfvals,
//expected to be an index in onsetdetector_data_array
@state odfvals : Int = 0; //odfvals[0] will be the current val, odfvals[1] prev, etc...

//*sortbuf,
//expected to be an index in onsetdetector_data_array
@state sortbuf : Int = 0; // Used to calculate the median

//*other;
//expected to be an index in onsetdetector_data_array
@state other : Int = 0; // Typically stores data about the previous frame

//is this what odsPolarBuf FixedArray above should be used for??? <----
//OdsPolarBuf* curr; // Current FFT frame, as polar (onsetdetector_data_array[0])

//srate variable not needed I think, can just use samplerate() operator...

@state relaxcoef : number = 0.0; //Relaxation coefficient (memory coefficient). See also onsetsds_setrelax()
@state odfparam : number = 0.0; // A parameter for the ODF. For most this is a magnitude threshold for a single bin to be considered; but for #ODS_ODF_MKL it is the "epsilon" parameter.
@state normfactor : number = 0.0; // Value used internally to scale ODF value according to the FFT frame size. Automatically set by onsetsds_init()
@state odfvalpost : number = 0.0; // ODF val after median processing
@state odfvalpostprev : number = 0.0; // Previous val is needed for threshold-crossing detection

//@state odftype : Int = 1; //Choose from #onsetsds_odf_types (@param above instead)
//@state whtype : Int = 1; //Choose from #onsetsds_wh_types (@param above instead)
//@state fftformat : Int = 1; //Choose from #onsetsds_fft_types (@param above instead)

@state whiten : Int = 1; //Whether to apply whitening - onsetsds_init() decides this on your behalf
@state detected : Int = 0; //Output val - true if onset detected in curr frame
@state med_odd : Int = 0; //Whether median span is odd or not (used internally)
@state gapleft : Int = 0;
//@state fftsize : Int = 0;
@state numbins : Int = 0; // numbins is the count not including DC/nyq


//===================================
//this can be commented out and is abstracted away by @state and @param values...
/*
typedef struct OnsetsDS {
    /// "data" is a pointer to the memory that must be EXTERNALLY allocated.
    /// Other pointers will point to locations within this memory.
    float *data, //<--- @state TRANSLATED (became odsdata_size)
        *psp, //<--- @state TRANSLATED //< Peak Spectral Profile - size is numbins+2, data is stored in order dc through to nyquist
        *odfvals, //<--- @state TRANSLATED // odfvals[0] will be the current val, odfvals[1] prev, etc
        *sortbuf, //<--- @state TRANSLATED // Used to calculate the median
        *other; //<--- @state TRANSLATED // Typically stores data about the previous frame
    OdsPolarBuf* curr; // <--- translated (Current FFT frame, as polar)
    
    float srate, ///< The sampling rate of the input audio. Set by onsetsds_init()
                 // Adaptive whitening params
        relaxtime, //@param <---TRANSLATED ///< Do NOT set this directly. Use onsetsds_setrelax() which will also update relaxcoef.
        relaxcoef, //@state <---TRANSLATED ///< Relaxation coefficient (memory coefficient). See also onsetsds_setrelax()
        floor, //@param <---TRANSLATED ///< floor - the lowest value that a PSP magnitude can take.
        /// A parameter for the ODF. For most this is a magnitude threshold for a single bin to be considered;
        /// but for #ODS_ODF_MKL it is the "epsilon" parameter.
        odfparam, //@state <---TRANSLATED
        /// Value used internally to scale ODF value according to the FFT frame size. Automatically set by
        /// onsetsds_init()
        normfactor, //@state <---TRANSLATED
        // ODF val after median processing
        odfvalpost, //@state <---TRANSLATED
        // Previous val is needed for threshold-crossing detection
        odfvalpostprev, //@state <---TRANSLATED
        /// Threshold (of ODF value, after median processing) for detection.
        /// Values between 0 and 1 are expected, but outside this range may
        /// sometimes be appropriate too.
        thresh; //@param <---TRANSLATED

    int odftype, //@parameter <---TRANSLATED ///< Choose from #onsetsds_odf_types
        whtype, //@parameter <---TRANSLATED ///< Choose from #onsetsds_wh_types
        fftformat; //@parameter <---TRANSLATED ///< Choose from #onsetsds_fft_types
    bool whiten, //@state <---TRANSLATED ///< Whether to apply whitening - onsetsds_init() decides this on your behalf
        detected, //@state <---TRANSLATED ///< Output val - true if onset detected in curr frame
        /**
        NOT YET USED: Whether to convert magnitudes to log domain before processing. This is done as follows:
        Magnitudes below a log-lower-limit threshold (ODS_LOG_LOWER_LIMIT) are pushed up to that threshold (to avoid
        log(0) infinity problems), then the log is taken. The values are re-scaled to a similar range as the
        linear-domain values (assumed to lie between zero and approximately one) by subtracting log(ODS_LOG_LOWER_LIMIT)
        and then dividing by abs(log(ODS_LOG_LOWER_LIMIT)).
        */
/*
        logmags, //not used/tested <---NOT TRANSLATED
        med_odd; //@state <---TRANSLATED ///< Whether median span is odd or not (used internally)

    unsigned int
        /// Number of frames used in median calculation
        medspan, //@param <---TRANSLATED
        /// Size of enforced gap between detections, measured in FFT frames.
        mingap, //@param <---TRANSLATED
        gapleft; //@state <---TRANSLATED
    size_t fftsize, numbins; //@param / @state <---TRANSLATED // numbins is the count not including DC/nyq
} OnsetsDS;
*/
//===================================

// I think this compensates for SC's ToPolarApx() function returning phase values in less conventional  range of [-pi/4, 7pi/4] - so I don't think I'll have to translate these SC ToPolarApx() functions into RNBO and can just use RNBO's catopol~ conversion as is...
        //=====> BUT IF OnsetDetection DOESN'T WORK AS EXPECTED, MIGHT NEED TO TRANSLATE ToPolarApx() functions AFTER ALL TO ENSURE FULL 1:1 TRANSLATION OF SC TO RNBO CODE... <========
    //see 'static inline SCPolarBuf* ToPolarApx(buf)' in "FFT_Ugens.h"
    //and 'Polar Complex::ToPolarApx()' in "SC_Complex.h"
//wraps phase values to be within -PI - +PI range
function onsetsds_phase_rewrap(phase) {
    return ((phase > (-1 * PI)) && (phase < PI)) ? phase : phase + TWOPI * (1.0 + floor(((-1 * PI) - phase) * inv_twopi));
}



/**
 * Determine how many bytes of memory must be allocated (e.g. using malloc) to
 * accompany the OnsetsDS struct, operating using the specified settings (used to
 * store part-processed FFT data etc). The user must
 * call this, and then allocate the memory, BEFORE calling onsetsds_init().
 * @param odftype Which onset detection function (ODF) you'll be using, chosen from #onsetsds_odf_types
 * @param fftsize Size of FFT: 512 is recommended.
 * @param medspan The number of past frames that will be used for median calculation during triggering
*/
function onsetsds_memneeded(odftype, fftsize, medspan) {
    //medspan (medianspan) default = 11
    /*
    Need memory for:
    - median calculation (2 * medspan floats)
    - storing old values (whether as OdsPolarBuf or as weirder float lists)
    - storing the OdsPolarBuf (size is NOT sizeof(OdsPolarBuf) but is fftsize)
    - storing the PSP (numbins + 2 values)
    All these are floats.
    */
    var numbins : Int = (fftsize >> 1) - 1; // # of bins, not counting DC/nyq
    
    switch (odftype) {
        case 0: //power
        case 1: //magsum
            // No old FFT frames needed, easy:
            post("odftype = power/magsum ---");
            return (medspan + medspan + fftsize + numbins + 2);
        case 2: //complex
        case 3: //rcomplex
            post("odftype = complex/rcomplex ---");
            //these types always require largest memsize <---!!!
            // For each bin (NOT dc/nyq) we store mag, phase and d_phase
            return (medspan + medspan + fftsize + numbins + 2 + numbins + numbins + numbins);
        case 4: //phase
        case 5: //wphase
            post("odftype = phase/wphase ---");
            // For each bin (NOT dc/nyq) we store phase and d_phase
            return (medspan + medspan + fftsize + numbins + 2 + numbins + numbins);
        case 6: //mkl
            //For each bin (NOT dc/nyq) we store mag
            post("odftype = mkl ---");
            return (medspan + medspan + fftsize + numbins + 2 + numbins);
        default:
            post("odftype = INVALID!!! allocating max memory ---");
            return (medspan + medspan + fftsize + numbins + 2 + numbins + numbins + numbins);
    }
}

/**
 * Set the "memory coefficient" indirectly via the time for the
 * memory to decay by 60 dB.
 * @param ods The OnsetsDS
 * @param time The time in seconds
 * @param hopsize The FFT frame hopsize (typically this will be half the FFT frame size)
 */
function onsetsds_setrelax(set_relaxtime, hopsize) {
    relaxtime = set_relaxtime;
    relaxcoef = (set_relaxtime == 0.0) ? 0.0 : exp((ods_log1 * hopsize) / (set_relaxtime * samplerate()));
}

/**
 * Initialise the OnsetsDS struct and its associated memory, ready to detect
 * onsets using the specified settings. Must be called before any call to
 * onsetsds_process().
 *
 * Note: you can change the onset detection function type in mid-operation
 * by calling onsetsds_init() again, but because memory will be reset this
 * will behave as if starting from scratch (rather than being aware of the past
 * few frames of sound). Do not attempt to change the
 * onset detection function in a more hacky way (e.g. fiddling with the struct)
 * because memory is set up differently for each of the different ODFs.
 * @param ods An instance of the OnsetsDS struct
 * @param odsdata A pointer to the memory allocated, size given by onsetsds_memneeded().
 * @param fftformat Which format of FFT data is to be expected, chosen from #onsetsds_fft_types
 * @param odftype Which onset detection function (ODF) you'll be using, chosen from #onsetsds_odf_types
 * @param fftsize Size of FFT: 512 or 1024 is recommended.
 * @param medspan The number of past frames that will be used for median calculation during triggering
 */
//void onsetsds_init(OnsetsDS* ods, float* odsdata, int fftformat, int odftype, size_t fftsize, unsigned int medspan, float srate);
function onsetsds_init(odftype, fftsize, medspan) {
    var realnumbins : Int = 0;
    
    // The main pointer to the processing area - other pointers will indicate areas within this
    //ods->data = odsdata;
    //in Max, we just need to be aware how far into onsetdetector_data_array we're writing into, represented by ods_data_size
    odsdata_size = onsetsds_memneeded(odftype, fftsize, medspan); //791 (magsum / fft = 512 / medspan = 11)
    if (odsdata_size > onsetdetector_data_array_size) {
        //safeguard against writing out of bounds of onsetdetector_data_array
        odsdata_size = onsetdetector_data_array_size;
        post("WARNING!!! odsdata_size was > onsetdetector_data_array_size");
        post("odsdata_size now = onsetdetector_data_array_size");
    }
    
    // Set all vals in processing area to zero
    //memset(odsdata, 0, onsetsds_memneeded(odftype, fftsize, medspan));
    for (var i = 0; i < odsdata_size; i++) {
        onsetdetector_data_array[i] = 0.0; //0 out data array
    }
    
    //ods->srate = srate; //not necessary in Max
    
    numbins = (fftsize >> 1) - 1; // No of bins, not counting DC/nyq (255 for 512 fftsize)
    realnumbins = numbins + 2; //257
    
    // Also point the other pointers to the right places (in Max, these translate to array index values where odsdata = 0 index of onsetdetector_data_array)
    //ods->curr = (OdsPolarBuf*)odsdata; //point curr (OdsPolarBuf*) to same address as odsdata, which in Max is onsetdetector_data_array[0] <----
    
    //ods->psp = odsdata + fftsize;
    psp = fftsize; //512
    //ods->odfvals = odsdata + fftsize + realnumbins;
    odfvals = fftsize + realnumbins; //769
    //ods->sortbuf = odsdata + fftsize + realnumbins + medspan;
    sortbuf = fftsize + realnumbins + medspan; //780 (default medspan = 11)
    //ods->other = odsdata + fftsize + realnumbins + medspan + medspan;
    other = fftsize + realnumbins + medspan + medspan; //791
    
    // Default settings for Adaptive Whitening, user can set own values after init
    //onsetsds_setrelax(ods, 1.f, fftsize >> 1);
    //onsetsds_setrelax(1.0, fftsize >> 1); //<----doesn't seem necessary to set to 1.0 b/c this is always set to 'relaxtime' after onsetsds_init is called w/in Onsets_next()
    //floor = 0.1; //<----don't think I should do this here... (CAUSES A BUG WHEN UNCOMMENTED ON RESET)
    
    switch (odftype) {
    case 0: //POWER
        odfparam = 0.01; // "powthresh" in SC code
        normfactor = 2560.0 / (realnumbins * fftsize);
        break;
    case 1: //MAGSUM
        odfparam = 0.01; // "powthresh" in SC code
        normfactor = 113.137085 / (realnumbins * safesqrt(fftsize));
        break;
    case 2: //COMPLEX
        odfparam = 0.01;
        normfactor = 231.70475 / pow(fftsize, 1.5);
        break;
    case 3: //RCOMPLEX
        odfparam = 0.01;
        normfactor = 231.70475 / pow(fftsize, 1.5);
        break;
    case 4: //PHASE
        odfparam = 0.01;
        normfactor = 5.12 / fftsize;
        break;
    case 5: //WPHASE
        odfparam = 0.0001; // "powthresh" in SC code. For WPHASE it's kind of superfluous.
        normfactor = 115.852375 / pow(fftsize, 1.5);
        break;
    case 6: //MKL
        odfparam = 0.01; // EPSILON parameter. Brossier recommends 1e-6 but I (ICMC 2007) found larger vals (e.g
                              // 0.01) to work better
        normfactor = 7.68 * 0.25 / fftsize;
        break;
    default:
        post("onsetsds_init ERROR: odftype is not a valid value");
    }
    
    odfvalpost = 0.0;
    odfvalpostprev = 0.0;
    //thresh = 0.5; //<---- don't reset thresh to 0.5 here (CAUSES A BUG WHEN UNCOMMENTED ON RESET)
    //ods->logmags = false; //not used

    //ods->odftype = odftype;
    //whtype = 1; //<----don't think this is necessary b/c this is never set anywhere else and inits to 1
    //ods->fftformat = fftformat;

    whiten = (odftype != 6); // Deactivate whitening for MKL by default
    detected = 0;
    med_odd = (medspan & 1) != 0;

    //ods->medspan = medspan;

    //mingap = 0; //<----don't think I should do this here... (CAUSES A BUG WHEN UNCOMMENTED ON RESET)
    gapleft = 0; //orig source set this to 0, but consider >= 1 to avoid false positive on reset

    //ods->fftsize = fftsize;
    //ods->numbins = numbins;
}

//apply adaptive whitening to the FFT data
function onsetsds_whiten() {
    var val : number = 0.0;
    var oldval : number = 0.0;
    var pspp1 : Int = psp + 1;
    
    if (whtype == 0) {//if whtype == wh_none
        //skip whitening when no whitening applied (e.g. MKL mode)
        return 0;
    }
    
    // Update the peak value of each bin
    
    //val = fabs(curr->dc); // Grab current magnitude (orig source)
    val = fabs(onsetdetector_data_array[0]); //dc = 0-index of this array
    
    //oldval = psp[0]; //source
    oldval = onsetdetector_data_array[psp];
    
    // If new amplitude > stored amp, that becomes new amp
    // otherwise new amp is decayed version of old one
    if (val < oldval) {
        val = val + (oldval - val) * relaxcoef;
    }
    
    //psp[0] = val; // Store the amplitude trace back
    onsetdetector_data_array[psp] = val;
    
    //val = fabs(curr->nyq);
    val = fabs(onsetdetector_data_array[1]); //nyq = index 1 in this array
    
    //oldval = pspp1[numbins];
    oldval = onsetdetector_data_array[pspp1 + numbins];
    if (val < oldval) {
        val = val + (oldval - val) * relaxcoef;
    }
    //pspp1[numbins] = val;
    onsetdetector_data_array[pspp1 + numbins] = val;
    
    for (var i = 0; i < numbins; ++i) {
        var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
        //i = 0 | onsetdetector_data_array[2] (bin[0] mag)
        //i = 1 | onsetdetector_data_array[4] (bin[1] mag)
        //i = 2 | onsetdetector_data_array[6] (bin[2] mag)

        //val = fabs(curr->bin[i].mag); //source
        val = fabs(onsetdetector_data_array[index_bin_mag]);
        
        //oldval = pspp1[i]; //source
        oldval = onsetdetector_data_array[pspp1 + i];
        
        if (val < oldval) {
            val = val + (oldval - val) * relaxcoef;
        }

        //pspp1[i] = val; //source
        onsetdetector_data_array[pspp1 + i] = val;
    }
    
    // Rescale the current magnitude of each bin
    //curr->dc /= ods_max(floor, psp[0]); //source
    onsetdetector_data_array[0] /= maximum(floor, onsetdetector_data_array[psp]);
    
    //curr->nyq /= ods_max(floor, pspp1[numbins]); //source
    onsetdetector_data_array[1] /= maximum(floor, onsetdetector_data_array[pspp1 + numbins]);
    
    for (var i = 0; i < numbins; ++i) {
        var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
        
        //curr->bin[i].mag /= ods_max(floor, pspp1[i]); //source
        onsetdetector_data_array[index_bin_mag] /= maximum(floor, onsetdetector_data_array[pspp1 + i]);
    }
    return 0;
}


//calculate the Onset Detection Function (includes scaling ODF outputs to similar range)
function onsetsds_odf() {
    //OdsPolarBuf* curr = ods->curr; //source (onsetdetector_data_array[0])
    //float* val = ods->odfvals; //source (val = odfvals)
    var i : Int = 0;
    var tbpointer : Int = 0;
    
    var deviation : number = 0.0;
    var diff : number = 0.0;
    var curmag : number = 0.0;
    var totdev : number = 0.0;
    
    var predmag : number = 0.0;
    var predphase : number = 0.0;
    var yesterphase : number = 0.0;
    var yesterphasediff : number = 0.0;
    var yestermag : number = 0.0;
    
    var rectify : Int = 1;
    
    //shunt the "old" ODF values down one place
    //memcpy(val + 1, val, (ods->medspan - 1) * sizeof(float)); //source
    for (var i : Int = (medspan - 1); i > 0; i--) {
        //unit tested in Max and works as expected shunting all values down +1 index after odfvals w/out stomping on 'sortbuf' beyond odfvals + medspan
        onsetdetector_data_array[odfvals + i] = onsetdetector_data_array[odfvals + i - 1];
        //post("---i = ");
        //post(i);
    }
    
    // Now calculate a new value and store in ods->odfvals[0]
    switch (odftype) {
        case 0: //power
            //*val = (curr->nyq * curr->nyq) + (curr->dc * curr->dc); //source
            onsetdetector_data_array[odfvals] = (onsetdetector_data_array[1] * onsetdetector_data_array[1]) + (onsetdetector_data_array[0] * onsetdetector_data_array[0]);
            
            for (i = 0; i < numbins; i++) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                //*val += curr->bin[i].mag * curr->bin[i].mag; //source
                onsetdetector_data_array[odfvals] += onsetdetector_data_array[index_bin_mag] * onsetdetector_data_array[index_bin_mag];
            }
            break;
            
        case 1: //magsum
            //*val = ods_abs(curr->nyq) + ods_abs(curr->dc); //source
            onsetdetector_data_array[odfvals] = onsetdetector_data_array[1] + onsetdetector_data_array[0];

            for (i = 0; i < numbins; i++) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                
                //*val += ods_abs(curr->bin[i].mag); //source
                onsetdetector_data_array[odfvals] += abs(onsetdetector_data_array[index_bin_mag]);
            }
            break;
            
        case 2: //complex
            rectify = 0;
            // ...and then drop through to:
            
        case 3: //rcomplex
            // Note: "other" buf is stored in this format: mag[0],phase[0],d_phase[0],mag[1],phase[1],d_phase[1], ...

            // Iterate through, calculating the deviation from expected value.
            totdev = 0.0;
            tbpointer = 0;
            for (i = 0; i < numbins; ++i) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                
                //curmag = ods_abs(curr->bin[i].mag); //source
                curmag = abs(onsetdetector_data_array[index_bin_mag]);
                
                // Predict mag as yestermag
                //predmag = ods->other[tbpointer++]; //source
                predmag = onsetdetector_data_array[other + (tbpointer++)];
                //yesterphase = ods->other[tbpointer++]; //source
                yesterphase = onsetdetector_data_array[other + (tbpointer++)];
                //yesterphasediff = ods->other[tbpointer++]; //source
                yesterphasediff = onsetdetector_data_array[other + (tbpointer++)];
                
                // Thresholding as Brossier did - discard (ignore) bin's deviation if bin's power is minimal
                if (curmag > odfparam) {
                    // If rectifying, ignore decreasing bins
                    if ((!rectify) || !(curmag < predmag)) {
                        var index_bin_phase : Int = (2 * i) + 3; //bin phase values are odd indeces starting at 3 (dc, nyq, and mag[0] are 0, 1, and 2) in 'onsetdetector_data_array')
                        //i = 0 | onsetdetector_data_array[3] (bin[0] phase)
                        //i = 1 | onsetdetector_data_array[5] (bin[1] phase)
                        //i = 2 | onsetdetector_data_array[7] (bin[2] phase)
                        //i = 3 | onsetdetector_data_array[9] (bin[3] phase)
                        
                        
                        // Predict phase as yesterval + yesterfirstdiff
                        predphase = yesterphase + yesterphasediff;

                        // Here temporarily using the "deviation" var to store the phase difference
                        //  so that the rewrap macro can use it more efficiently
                        //deviation = predphase - curr->bin[i].phase; //source
                        deviation = predphase - onsetdetector_data_array[index_bin_phase];

                        // Deviation is Euclidean distance between predicted and actual.
                        // In polar coords: sqrt(r1^2 +  r2^2 - r1r2 cos (theta1 - theta2))
                        deviation = safesqrt(predmag * predmag + curmag * curmag
                                          - predmag * curmag * cos(onsetsds_phase_rewrap(deviation)));

                        totdev += deviation;
                    }
                }
            }
            
            // totdev will be the output, but first we need to fill tempbuf with today's values, ready for tomorrow.
            tbpointer = 0;
            for (i = 0; i < numbins; ++i) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                var index_bin_phase : Int = (2 * i) + 3; //bin phase values are odd indeces starting at 3 (dc, nyq, and mag[0] are 0, 1, and 2) in 'onsetdetector_data_array')
                
                //ods->other[tbpointer++] = ods_abs(curr->bin[i].mag); // Storing mag (source)
                onsetdetector_data_array[other + (tbpointer++)] = abs(onsetdetector_data_array[index_bin_mag]); // Storing mag
                
                //diff = curr->bin[i].phase - ods->other[tbpointer]; // Retrieving yesterphase from buf (source)
                diff = onsetdetector_data_array[index_bin_phase] - onsetdetector_data_array[other + tbpointer]; // Retrieving yesterphase from buf
                
                //ods->other[tbpointer++] = curr->bin[i].phase; // Storing phase (source)
                onsetdetector_data_array[other + (tbpointer++)] = onsetdetector_data_array[index_bin_phase]; // Storing phase
                
                // Wrap onto +-PI range
                diff = onsetsds_phase_rewrap(diff);

                //ods->other[tbpointer++] = diff; // Storing first diff to buf (source)
                onsetdetector_data_array[other + (tbpointer++)] = diff; // Storing first diff to buf
            }
            
            //*val = (float)totdev; //source
            onsetdetector_data_array[odfvals] = totdev;
            break;
            
        case 4: //phase
            rectify = 0; //means 'use weighting' here
            // then drop to:
            
        case 5: //wphase
            // Note: "other" buf is stored in this format: phase[0],d_phase[0],phase[1],d_phase[1], ...

            // Iterate through, calculating the deviation from expected value.
            totdev = 0.0;
            tbpointer = 0;
            
            for (i = 0; i < numbins; ++i) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                
                // Thresholding as Brossier did - discard (ignore) bin's phase deviation if bin's power is low
                //if (ods_abs(curr->bin[i].mag) > ods->odfparam) {//source
                if (abs(onsetdetector_data_array[index_bin_mag]) > odfparam) {
                    // Deviation is the *second difference* of the phase, which is calc'ed as curval - yesterval -
                    // yesterfirstdiff
                    var index_bin_phase : Int = (2 * i) + 3; //bin phase values are odd indeces starting at 3 (dc, nyq, and mag[0] are 0, 1, and 2) in 'onsetdetector_data_array')
                    //deviation = curr->bin[i].phase - ods->other[tbpointer] - ods->other[tbpointer + 1]; //source
                    deviation = onsetdetector_data_array[index_bin_phase] - onsetdetector_data_array[other + tbpointer] - onsetdetector_data_array[other + tbpointer + 1];
                    tbpointer += 2;
                    // Wrap onto +-PI range
                    deviation = onsetsds_phase_rewrap(deviation);

                    if (rectify) { // "rectify" meaning "useweighting"...
                        //totdev += fabs(deviation * ods_abs(curr->bin[i].mag)); //source
                        totdev += fabs(deviation * abs(onsetdetector_data_array[index_bin_mag]));
                    } else {
                        totdev += fabs(deviation);
                    }
                }
            }
            
            // totdev will be the output, but first we need to fill tempbuf with today's values, ready for tomorrow.
            tbpointer = 0;
            for (i = 0; i < numbins; ++i) {
                var index_bin_phase : Int = (2 * i) + 3; //bin phase values are odd indeces starting at 3 (dc, nyq, and mag[0] are 0, 1, and 2) in 'onsetdetector_data_array')
                //diff = curr->bin[i].phase - ods->other[tbpointer]; // Retrieving yesterphase from buf (source)
                diff = onsetdetector_data_array[index_bin_phase] - onsetdetector_data_array[other + tbpointer]; // Retrieving yesterphase from buf
                //ods->other[tbpointer++] = curr->bin[i].phase; // Storing phase (source)
                onsetdetector_data_array[other + tbpointer++] = onsetdetector_data_array[index_bin_phase]; // Storing phase
                // Wrap onto +-PI range
                diff = onsetsds_phase_rewrap(diff);

                //ods->other[tbpointer++] = diff; // Storing first diff to buf (source)
                onsetdetector_data_array[other + tbpointer++] = diff; // Storing first diff to buf
            }
            //*val = (float)totdev; //<---- source (double cast to float)
            onsetdetector_data_array[odfvals] = totdev; //pretty sure nothing needed to translate (float) casting here b/c totdev already declared as (double) 'number'
            break;
            
        case 6: //mkl
            // Iterate through, calculating the Modified Kullback-Liebler distance
            totdev = 0.0;
            tbpointer = 0;
            
            for (i = 0; i < numbins; ++i) {
                var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'onsetdetector_data_array'
                //curmag = ods_abs(curr->bin[i].mag); //source
                curmag = abs(onsetdetector_data_array[index_bin_mag]);
                
                //yestermag = ods->other[tbpointer]; //source
                yestermag = onsetdetector_data_array[other + tbpointer];

                // Here's the main implementation of Brossier's MKL eq'n (eqn 2.9 from his thesis):
                //deviation = ods_abs(curmag) / (ods_abs(yestermag) + ods->odfparam); //source
                deviation = abs(curmag) / (abs(yestermag) + odfparam);
                
                totdev += log(1.0 + deviation);

                // Store the mag as yestermag
                //ods->other[tbpointer++] = curmag; //source
                onsetdetector_data_array[other + tbpointer++] = curmag;
            }
            //*val = (float)totdev; //source (double cast to float)
            onsetdetector_data_array[odfvals] = totdev; //pretty sure nothing needed to translate (float) casting here b/c totdev already declared as (double) 'number'
            break;
    }
    
    //ods->odfvals[0] *= ods->normfactor; //source
    onsetdetector_data_array[odfvals] *= normfactor;
}

//sorts 'sortbuf' + 'medspan' values in onset_detector_data_array from lowest to highest values (unit tested)
// Algo is simply based on http://en.wikibooks.org/wiki/Algorithm_implementation/Sorting/Selection_sort
//void SelectionSort(float* array, int length) {
function sort_selection(length) {
    var maximum : Int;
    var i : Int;
    var temp : number = 0.0;
    while (length > 0) {
        //WARNING!!! there are no guard rails here to avoid writing out of bounds of onsetdetector_data_array, so if unexpected crashes occur check this function and add safety checks to avoid this <----
        maximum = 0;
        for (i = 1; i < length; i++) {
            //if (array[i] > array[max]) //source
                //max = i; //source
            if (onsetdetector_data_array[sortbuf + i] > onsetdetector_data_array[sortbuf + maximum])
            {maximum = i;}
        }
        //temp = array[length - 1]; //source
        temp = onsetdetector_data_array[sortbuf + length - 1];
        
        //array[length - 1] = array[max]; //source
        onsetdetector_data_array[sortbuf + length - 1] = onsetdetector_data_array[sortbuf + maximum];
        
        //array[max] = temp; //source
        onsetdetector_data_array[sortbuf + maximum] = temp;
        length--;
    }
}

/**
 * Detects salient peaks in Onset Detection Function by removing the median,
 * then thresholding. Afterwards, the member ods.detected will indicate whether
 * or not an onset was detected.
 *
 * Not typically called directly by users since onsetsds_process() calls this.
 */
function onsetsds_detect() {
    
    // Update last value of odfvalpost
    odfvalpostprev = odfvalpost;
    
    // MEDIAN REMOVAL //
    
    // Copy odfvals to sortbuf
    //memcpy(sortbuf, ods->odfvals, medspan * sizeof(float)); //source
    for (var i : Int = 0; i < medspan; i++) {
        var write_index: Int = sortbuf + i;
        if (write_index >= onsetdetector_data_array_size) {
            write_index = onsetdetector_data_array_size - 1;
            post("WARNING!!! sortbuf + i write index >= onsetdetector_data_array_size");
            post("sortbuf + i write index now = onsetdetector_data_array_size - 1 to avoid crash, but onset detection will probably fail...");
        }
        //unit tested in Max
        onsetdetector_data_array[sortbuf + i] = onsetdetector_data_array[odfvals + i];
    }
    
    // Sort sortbuf
    //SelectionSort(sortbuf, medspan); //source
    sort_selection(medspan);
    
    // Subtract the middlest value === the median
    if (med_odd) {
        //ods->odfvalpost = ods->odfvals[0] - sortbuf[(medspan - 1) >> 1]; //source
        var sortbuf_i : Int = (medspan - 1) >> 1;
        odfvalpost = onsetdetector_data_array[odfvals] - onsetdetector_data_array[sortbuf + sortbuf_i];
    } else {
        var sortbuf_i : Int = medspan >> 1;
        //ods->odfvalpost = ods->odfvals[0] - ((sortbuf[medspan >> 1] + sortbuf[(medspan >> 1) - 1]) * 0.5f); //source
        odfvalpost = onsetdetector_data_array[odfvals] - ((onsetdetector_data_array[sortbuf + sortbuf_i] + onsetdetector_data_array[sortbuf + sortbuf_i - 1]) * 0.5);
    }
    
    // Detection not allowed if we're too close to a previous detection.
    if (gapleft != 0) {
        gapleft--;
        detected = 0;
    } else {
        // Now do the detection.
        detected = (odfvalpost > thresh) && (odfvalpostprev <= thresh);
        if (detected) {
            gapleft = mingap;
        }
    }
}

//Load one buffer of FFT data from startIndex in fftbuf into onsetdetector_data_array (handling cases where fftsize != I/O buffer size)
function onsetsds_loadframe(this_fftsize, startIndex) {
    //store all fftbuf data in onsetdetector_data_array and convert to polar...
    for (var i : Int = 0; i < this_fftsize/2; i++) {
        if (i < 1) {
            //post("===========");
            //no polar conversion needed for these...
            var dc = peek(fftbuf, startIndex);
            var nyq = peek(fftbuf, startIndex + 1);
            onsetdetector_data_array[0] = dc[0];
            onsetdetector_data_array[1] = nyq[0];
        }
        else if (i >= 1 && (i < this_fftsize/2)) {
        	//using od_index_x and od_index_y to decouple onsetdetector_data_array write positions from fftbuf read positions via startIndex
        	var od_index_x : Int = 2 * i;
        	var od_index_y : Int = od_index_x + 1;
            var read_index_x : Int = od_index_x + startIndex;
            var read_index_y : Int = read_index_x + 1;
            var real = peek(fftbuf, read_index_x);
            var imaginary = peek(fftbuf, read_index_y);
            
            var polar = cartopol(real[0], imaginary[0]);
            onsetdetector_data_array[od_index_x] = polar[0]; //mag
            onsetdetector_data_array[od_index_y] = polar[1]; //phase
        }
    }
}

/**
 * Process a single FFT data frame in the audio signal. Note that processing
 * assumes that each call to onsetsds_process() is on a subsequent frame in
 * the same audio stream - to handle multiple streams you must use separate
 * OnsetsDS structs and memory!
 *
 * This function's main purpose is to call some of the library's other functions,
 * in the expected sequence.
 */
//bool onsetsds_process(OnsetsDS* ods, float* fftbuf) {//source
function onsetsds_process() {
	var samplecount : Int = samplecount(); //total # of samples elapsed since RNBO code was loaded, at the start of this audio buffer
	//if we've started a new audio buffer, or we've incremented past the I/O buffer size, reset fftbuf_index (read index) to 0
	if (samplecount != last_samplecount || fftbuf_index >= vectorsize()) {
		fftbuf_index = 0;
		last_samplecount = samplecount;
	}
    onsetsds_loadframe(fftsize, fftbuf_index);
    onsetsds_whiten();               
    onsetsds_odf();
    onsetsds_detect();
    fftbuf_index += fftsize; //increment fftbuf_index by fftsize (to handle cases when fftsize != I/O vector size)
}


function Onsets_next() {
    var outval : Int = 0; //maybe not needed if use final output line instead
    //source --- vvvv --- vvvv ---------------
    //Onsets_GET_BUF //source <---handled in other 'fftbuf_write' codebox
    //SCPolarBuf* p = ToPolarApx(buf); buf comes from Onsets_GET_BUF macro <---TRANSLATED INTO onsetsds_loadframe()
    //OnsetsDS* ods = unit->m_ods;
    //int odftype = (int)ZIN0(2);
    //float relaxtime = ZIN0(3);
    //int medspan = (int)ZIN0(6);
    //source --- ^^^^ --- ^^^^ ---------------
    
    if (needs_init) {
        
        // Init happens here because we need to be sure about FFT size (buf->samples)
        //unit->m_odsdata = (float*)RTAlloc(unit->mWorld, onsetsds_memneeded(odftype, buf->samples, medspan)); //calculate data size and allocate memory for odsdata <---TRANSLATED THIS INTO onsetsds_init()
        //ClearUnitIfMemFailed(unit->m_odsdata);

        //onsetsds_init(ods, unit->m_odsdata, ODS_FFT_SC3_POLAR, odftype, buf->samples, medspan, FULLRATE); //init ods struct w/ correct data size, pointer addresses, and parameters
        onsetsds_init(odftype, fftsize, medspan);
        
        //onsetsds_setrelax(ods, relaxtime, buf->samples >> 1);
        onsetsds_setrelax(relaxtime, fftsize >> 1);

        //unit->m_needsinit = false;
        needs_init = 0;
    }

    //source --- vvvv --- vvvv ---------------
    // Here is the best place to set parameters - after init is ensured
    // These are "painless" to set:
    //ods->thresh = ZIN0(1);
    //ods->floor = ZIN0(4);
    //ods->mingap = (int)ZIN0(5);
    //ods->whtype = (int)ZIN0(7);
    //source --- ^^^^ --- ^^^^ ---------------
    
    // Now to process
    //unit->outval = onsetsds_process(ods, (float*)p);
    //outval = onsetsds_process();
    onsetsds_process();
    
    if (detected > 0) {post("ONSET DETECTED");}
    //ZOUT0(0) = unit->outval;
    out1 = detected;
}

//===============================
//===============================
//=== TOP of odf()===

if (!(last_thresh == thresh)) {
    post("in-odf --> NEW thresh = ", thresh);
    post("in-odf --> LAST thresh = ", last_thresh);
    last_thresh = thresh;
}

if (!(last_relaxtime == relaxtime)) {
    post("in-odf --> NEW relaxtime = ", relaxtime);
    post("in-odf --> LAST relaxtime = ", last_relaxtime);
    last_relaxtime = relaxtime;
}

if (!(last_floor == floor)) {
    post("in-odf --> NEW floor = ", floor);
    post("in-odf --> LAST floor = ", last_floor);
    last_floor = floor;
}

if (!(last_mingap == mingap)) {
    post("in-odf --> NEW mingap = ", mingap);
    post("in-odf --> LAST mingap = ", last_mingap);
    last_mingap = mingap;
}

if (!(last_medspan == medspan)) {
    post("in-odf --> NEW medspan = ", medspan);
    post("in-odf --> LAST medspan = ", last_medspan);
    last_medspan = medspan;
}

if (!(last_odftype == odftype)) {
    post("in-odf --> NEW odftype = ", odftype);
    post("in-odf --> LAST odftype = ", last_odftype);
    last_odftype = odftype;
}

if (!(last_fftsize == fftsize)) {
    post("in-odf --> NEW fftsize = ", fftsize);
    post("in-odf --> LAST fftsize = ", last_fftsize);
    last_fftsize = fftsize;
}

if (!(last_needs_init == needs_init)) {
    post("in-odf --> NEW needs_init = ", needs_init);
    post("in-odf --> LAST needs_init = ", last_needs_init);
    last_needs_init = needs_init;
}

Onsets_next();

