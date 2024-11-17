@param({min: 64, max: 2048}) fftsize = 64;
//@state last_fftsize = 0; //<----not needed unless you want to log fftsize changes

@param({min: 0, max: 1}) needs_init = 1; //<----not sure if this is needed
//@state last_needs_init = 0; //<----not needed unless you want to log needs_init changes

@state numbins : Int = 0; // numbins is the fftsize bin count not including DC/nyq (fftsize / 2 - 1)
@state oneovern = 0.0;

const specFlat_data_array_size : Int = 2048; //max possible value of fftsize (buffer size)...
//@state specFlat_data_array_size : Int = fftsize; //this would be the only ever value, but can't cast @param in this way in RNBO (causes error)
@state specFlat_data_array = new FixedFloatArray(specFlat_data_array_size);


@state fftbuf = new buffer("local:fftbuf_1"); //reference to data "fftbuf" object in RNBO patch

function specFlat_init(this_fftsize) {
    for (var i = 0; i < specFlat_data_array_size; i++) {
        specFlat_data_array[i] = 0.0; //0 out data array
    }
    
    //int numbins = (buf->samples - 2) >> 1; //source FFTAnalyser_GET_BUF
    numbins = (this_fftsize - 2) >> 1; //(fftsize / 2 - 1)
    //oneovern = 0.0; //from SpecFlatness_Ctor
    oneovern = 1.0 / (numbins + 2);
}

//Load the current frame of FFT data into specFlat_data_array
function specFlat_load_frame(this_fftsize) {
    
    if (this_fftsize > specFlat_data_array_size) {
        //safeguard against writing out of bounds of onsetdetector_data_array
        this_fftsize = specFlat_data_array_size;
        post("WARNING!!! fftsize was set to value > specFlat_data_array_size");
        post("fftsize now = specFlat_data_array_size to avoid crash");
    }
    //store all fftbuf data in specFlat_data_array...
    for (var i : Int = 0; i < this_fftsize/2; i++) {
        if (i < 1) {
            //post("===========");
            //no conversion needed for these...
            var dc = peek(fftbuf, 0);
            var nyq = peek(fftbuf, 1);
            specFlat_data_array[0] = dc[0];
            specFlat_data_array[1] = nyq[0];
        }
        else if (i >= 1 && (i < this_fftsize/2)) {
            var index_x : Int = 2 * i;
            var index_y : Int = index_x + 1;
            var real = peek(fftbuf, index_x);
            var imaginary = peek(fftbuf, index_y);
            
            specFlat_data_array[index_x] = real[0];
            specFlat_data_array[index_y] = imaginary[0];
        }
    }
}

function SpecFlatness_next() {
    var outval = 0.0;
    
    if (needs_init) {
        specFlat_init(fftsize);
        needs_init = 0;
    }
    
    
    //FFTAnalyser_GET_BUF //source
    specFlat_load_frame(fftsize);
    
    //if (unit->m_oneovern == 0.) unit->m_oneovern = 1. / (numbins + 2); //source
    //I decided to set oneovern once in specFlat_init() instead b/c it's always going to be the same due to fftsize never changing (fftsize set on construction)

    //SCComplexBuf* p = ToComplexApx(buf); //source (no complex conversion needed b/c fftbuf values are already in complex format...)

    // Spectral Flatness Measure is geometric mean divided by arithmetic mean.
    //
    // In order to calculate geom mean without hitting the precision limit,
    //  we use the trick of converting to log, taking the average, then converting back from log.
    //double geommean = std::log(sc_abs(p->dc)) + std::log(sc_abs(p->nyq)); //source
    var geommean = log(abs(specFlat_data_array[0])) + log(abs(specFlat_data_array[1]));
    
    //double mean = sc_abs(p->dc) + sc_abs(p->nyq); //source
    var mean = abs(specFlat_data_array[0]) + abs(specFlat_data_array[1]);

    for (var i = 0; i < numbins; ++i) {
        var index_bin_real : Int = (2 * i) + 2; //bin real values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'specFlat_data_array'
        var index_bin_imag : Int = (2 * i) + 3; //bin imaginary values are odd indeces starting at 3 (dc, nyq, and real[0] are 0, 1, and 2) in 'specFlat_data_array')
        
        //float rabs = (p->bin[i].real); //source
        var real = specFlat_data_array[index_bin_real];
        
        //float iabs = (p->bin[i].imag); //source
        var imag = specFlat_data_array[index_bin_imag];
        
        //float amp = std::sqrt((rabs * rabs) + (iabs * iabs)); //source
        var amp = safesqrt((real * real) + (imag * imag));
        
        if (amp != 0.0) { // zeroes lead to NaNs
            geommean += log(amp);
            mean += amp;
        }
    }

    //double oneovern = unit->m_oneovern; //source (no need b/c using @state oneovern)
    geommean = exp(geommean * oneovern); // Average and then convert back to linear (source)
    mean *= oneovern; //source

    // Store the val for output in future calls
    //unit->outval = (mean == 0.f ? 0.8f : (geommean / mean)); //source
    outval = (mean == 0.0 ? 0.8 : (geommean / mean));
    // Note: for silence the value is undefined.
    // Here, for silence we instead output an empirical value based on very quiet white noise.

    //ZOUT0(0) = unit->outval; //source
    out1 = outval; //source
}

SpecFlatness_next();
