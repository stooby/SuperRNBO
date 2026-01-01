@param({min: 64, max: 2048}) fftsize = 64;
//@state last_fftsize = 0; //<----not needed unless you want to log fftsize changes
@state fftbuf_index : Int = 0; //track the last index to read from fftbuf (needed when I/O buffer size and fftbuf > fftsize)
@state last_samplecount : Int = 0; //track last samplecount value to know when we've started a new I/O buffer

@param({min: 0, max: 1}) needs_init = 1; //only needed if fftsize changes after construction, but that's not likely to ever happen
//@state last_needs_init = 0; //<----not needed unless you want to log needs_init changes

@state numbins : Int = 0; // numbins is the fftsize bin count not including DC/nyq (fftsize / 2 - 1)
@state bintofreq = 0.0;

const specCentroid_data_array_size : Int = 2048; //max possible value of fftsize (buffer size)...
//@state specCentroid_data_array_size : Int = fftsize; //this would be the only ever value, but can't cast @param in this way in RNBO (causes error)
@state specCentroid_data_array = new FixedFloatArray(specCentroid_data_array_size);


@state fftbuf = new buffer("local:fftbuf_1"); //reference to data "fftbuf" object in RNBO patch

function specCentroid_init(this_fftsize) {
    for (var i = 0; i < specCentroid_data_array_size; i++) {
        specCentroid_data_array[i] = 0.0; //0 out data array
    }
    
    //int numbins = (buf->samples - 2) >> 1; //source FFTAnalyser_GET_BUF
    numbins = (this_fftsize - 2) >> 1; //(fftsize / 2 - 1)
    //post("[specCentroid_init] numbins:");
    //post(numbins);
    
    var samplerate = samplerate();
    bintofreq = samplerate / this_fftsize; //from GET_BINTOFREQ
    //post("[specCentroid_init] samplerate:");
    //post(samplerate);
    //post("[specCentroid_init] bintofreq =");
    //post(bintofreq);
}

//Load the current frame of FFT data into specCentroid_data_array
function specCentroid_load_frame(this_fftsize, startIndex) {
    if (this_fftsize > specCentroid_data_array_size) {
        //safeguard against writing out of bounds of specCentroid_data_array
        this_fftsize = specCentroid_data_array_size;
        post("WARNING!!! fftsize was set to value > specCentroid_data_array_size");
        post("fftsize now = specCentroid_data_array_size to avoid crash");
    }
    
    //store all fftbuf data in specCentroid_data_array in SC's native FFT buffer format: [dc, nyq, bin1 mag, bin1 phase, bin2 mag, bin2 phase, etc]...
    for (var i : Int = 0; i < this_fftsize/2; i++) {
        if (i < 1) {
            //post("===========");
            //no conversion needed for these...
            var dc = peek(fftbuf, startIndex);
            var nyq = peek(fftbuf, startIndex + 1);
            specCentroid_data_array[0] = dc[0];
            specCentroid_data_array[1] = nyq[0];
        }
        else if (i >= 1 && (i < this_fftsize/2)) {
        	//using sda_index_x and sda_index_y to decouple specFlat_data_array write positions from fftbuf read positions via startIndex
            var sda_index_x : Int = 2 * i;
            var sda_index_y : Int = sda_index_x + 1;
            var read_index_x : Int = sda_index_x + startIndex;
            var read_index_y : Int = read_index_x + 1;
            var real = peek(fftbuf, read_index_x);
            var imaginary = peek(fftbuf, read_index_y);
            
            var polar = cartopol(real[0], imaginary[0]); //convert to polar
            specCentroid_data_array[sda_index_x] = polar[0]; //mag
            specCentroid_data_array[sda_index_y] = polar[1]; //phase
        }
    }
}

function SpecCentroid_next() {
    var outval = 0.0;
    
    if (needs_init) {
        specCentroid_init(fftsize);
        needs_init = 0;
    }
    
    var samplecount : Int = samplecount(); //total # of samples elapsed since RNBO code was loaded, at the start of this audio buffer
    //if we've started a new audio buffer, or we've incremented past the I/O buffer size, reset fftbuf_index (read index) to 0
    if (samplecount != last_samplecount || fftbuf_index >= vectorsize()) {
		fftbuf_index = 0;
		last_samplecount = samplecount;
	}
    
    //FFTAnalyser_GET_BUF //source
    specCentroid_load_frame(fftsize, fftbuf_index);
    fftbuf_index += fftsize; //increment fftbuf_index by fftsize (to handle cases when fftsize != I/O vector size)
    
    //SCPolarBuf* p = ToPolarApx(buf); //source (in specCentroid_load_frame() )

    //GET_BINTOFREQ //source (in specCentroid_init() )
    
    //double num = sc_abs(p->nyq) * (numbins + 1); //source
    var num = abs(specCentroid_data_array[1]) * (numbins + 1);
    
    //double denom = sc_abs(p->nyq); //source
    var denom = abs(specCentroid_data_array[1]);

    for (var i = 0; i < numbins; ++i) {
        var index_bin_mag : Int = (2 * i) + 2; //bin mag values are even indeces starting at 2 (dc and nyq are 0 and 1) in 'specCentroid_data_array'
        
        //num += sc_abs(p->bin[i].mag) * (i + 1); //source
        num += abs(specCentroid_data_array[index_bin_mag]) * (i + 1);
        
        //denom += sc_abs(p->bin[i].mag); //source
        denom += abs(specCentroid_data_array[index_bin_mag]);
    }

    //ZOUT0(0) = unit->outval = denom == 0.0 ? 0.f : (float)(bintofreq * num / denom); //source
    outval = denom == 0.0 ? 0.0 : (bintofreq * num / denom);
    out1 = outval;
}

SpecCentroid_next();
