//copy fftstream data of current buffer to fftbuf
//and translate it to be compatible with SC FFT format
//dc | nyq | bin1 (r) | bin 1 (i) | bin2 (r) | bin2 (i) ...

@param fftsize = 64;
@state last_fftsize = 0;
@state fftbuf = new buffer("local:fftbuf_1"); //reference to data "fftbuf" object in RNBO patch

@state write_index : Int = 0; //from 0 to (vectorsize() - 1)
@state index_offset : Int = 0; //increments by fftsize each time fft_index wraps around back to 0
@state reset_write_index : Int = 0;

const enable_test : Int = 0;
const enable_logs : Int = 0;
const max_log_posts : Int = 256;
@state log_counter : Int = 0;

var real = in1;
var imaginary = in2;
var fft_index = intnum(in3);
var write_to_fftbuf = intnum(in4);

var testval : number;


function dspsetup() {
    bufferclear(fftbuf);
    write_index = 0;
    index_offset = 0;
}


if (!(last_fftsize == fftsize)) {
	if (enable_logs) {
		post("[fftstream-converter~] --> NEW FFTSIZE = ", fftsize);
    	post("[fftstream-converter~] --> LAST FFTSIZE = ", last_fftsize);
	}
    last_fftsize = fftsize;
    reset_write_index = 1;
}


if (write_to_fftbuf) {
    //if write_to_fftbuf is enabled and then disabled, reset write_index to 0
    if (reset_write_index) {
        reset_write_index = 0;
        write_index = 0;
        index_offset = 0;
        log_counter = 0;
        if (enable_logs) {
            post("[fft-convert~] write_index reset to 0 ------");
            post("[fft-convert~] log_counter reset to 0 ------");
        }
    }
    
    //fft_index isn't guaranteed to always start at 0 (like when I/O buffer size < fftsize), so handle this case and align write_index w/ current fft_index
    if (write_index == 0 && fft_index != 0) {
    	if (enable_logs && log_counter < max_log_posts) {
    		post("[fft-convert~] fft_index out of sync w/ write_index! | write_index = 0 | fft_index = ", fft_index);
    	}
        continue; //skip samples until write_index becomes in sync w/ fft_index again (since this I/O cycle started in the middle of fftstream processing and we've missed some samples/freq bins)
    }
    
    if (enable_test) {testval = fft_index;} //test
    
    if (fft_index < 1) {//dc
        if (enable_test) {
            testval = 123456;
            poke(fftbuf, testval, write_index); //test
        }
        else {
            poke(fftbuf, in1, write_index); //copy real
        }
        
        if (vectorsize() > fftsize) {//if I/O buffersize > fftsize
            index_offset = write_index; //increment index_offset each fft_index wrap around (0, 64, 128, 192, 256, etc.)
        }
    }
    else if (fft_index >= 1 && fft_index < fftsize/2) {
        var index_x : Int = (fft_index * 2) + index_offset;
		var index_y : Int = index_x + 1;
		
		if (enable_test) {
			var testval2 : number = testval + 0.1;
			poke(fftbuf, testval, index_x); //test
			poke(fftbuf, testval2, index_y); //test
		}
		else {
			poke(fftbuf, in1, index_x); //copy real
			poke(fftbuf, in2, index_y); //copy imaginary
		}
    }
    else if (fft_index == fftsize/2) {//nyquist
        if (enable_test) {
			poke(fftbuf, testval, (index_offset + 1)); //test
		}
		else {
			poke(fftbuf, in1, (index_offset + 1)); //copy real (put in SC's fft format's expected bin: 0-index + 1)
		}
    }
    
    if (enable_logs) {
        if (log_counter < max_log_posts) {
            if (log_counter == 0) {
                post("[fft-convert~] write_index | fft_index | index_offset | log_counter");
            }
        	post("[fft-convert~] ", write_index, fft_index, index_offset, log_counter);
            log_counter++;
        }
    }
    
    //increment write_index each sample
    write_index++;
    
    if (vectorsize() >= fftsize) {
    	// reset write_index to 0 at the start of each new I/O buffer (when I/O buffer >= fftsize)
    	if (write_index >= vectorsize()) {
        	write_index = 0;
    	}
    }
    else {
    	//if I/O buffer size < fftsize, reset write_index to 0 if it's >= fftsize
    	if (write_index >= fftsize) {
        	write_index = 0;
    	}
    }
}
else {//write_to_fftbuf disabled 
    if (reset_write_index == 0) {
        reset_write_index = 1; //ensure we reset the write_index to 0 the next time write_to_fftbuf is enabled
    }
}
