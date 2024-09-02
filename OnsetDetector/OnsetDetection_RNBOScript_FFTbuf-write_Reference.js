//copy fftstream data of current buffer to fftbuf
//and translate it to be compatible with SC FFT format
//dc | nyq | bin1 (r) | bin 1 (i) | bin2 (r) | bin2 (i) ...

@state fftbuf = new buffer("local:fftbuf_1"); //reference to data "fftbuf" object in RNBO patch
//const fftsize : Int = 512;
@param fftsize = 64;
@state last_fftsize = 0;
const write_to_fftbuf : Int = 1; //<---enable/disable output
const enable_test : Int = 0;

var testval : number;

var real = in1;
var imaginary = in2;
var fft_index = intnum(in3);

/*
if (bin_index == 0) {//basic test
    testval *= -1; //oscillate between +/- 1 every fftstream~ block size
}
*/

if (!(last_fftsize == fftsize)) {
    post("in-fftstream --> NEW FFTSIZE = ", fftsize);
    post("in-fftstream --> LAST FFTSIZE = ", last_fftsize);
    last_fftsize = fftsize;
}


if (enable_test) {testval = fft_index;} //for testing

if (fft_index < 1) {//dc
    //post("fft_index == 0");
    if (write_to_fftbuf) {
        if (enable_test) {
            poke(fftbuf, 123456, 0); //test
        }
        else {
            poke(fftbuf, in1, 0); //copy real
        }
    }
}
else if (fft_index >= 1 && fft_index < fftsize/2) {
    //bins 1 through (nyquist - 1)
    //post("fft_index > 0 && fft_index < fftsize/2");
    
    if (write_to_fftbuf) {
        var index_x : Int = fft_index * 2;
        var index_y : Int = index_x + 1;
        
        if (enable_test) {
            var testval2 : number = testval + 0.1;
            poke(fftbuf, testval, index_x); //for testing
            poke(fftbuf, testval2, index_y); //for testing
        }
        else {
            poke(fftbuf, in1, index_x); //copy real
            poke(fftbuf, in2, index_y); //copy imaginary
        }
    }
}
else if (fft_index == fftsize/2) {//nyquist
    //post("fft_index == fftsize/2");
    //copy nyquist to fftbuf index 1 for compatibility w/ SC FFT format
    if (write_to_fftbuf) {
        if (enable_test) {
            poke(fftbuf, testval, 1);
        }
        else {
            poke(fftbuf, in1, 1); //copy real
        }
    }
}
