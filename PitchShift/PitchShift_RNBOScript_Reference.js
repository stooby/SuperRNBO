//https://github.com/supercollider/supercollider/blob/develop/server/plugins/DelayUGens.cpp#L4573
//A time domain granular pitch shifter.
//Grains have a triangular amplitude envelope and an overlap of 4:1, and use linear interpolation of the buffer.

//The ratio of the pitch shift. Must be from 0 to 4.
@param({min: 0.0, max: 4.0}) pchratio = 2.0;

//winsize: The size of the grain window in seconds. This value cannot be modulated when IO's active
//The minimum value is 3 sample periods.
//If you supply a smaller value, it will be rounded up to the minimum.
@param({min: 0.01, max: 0.5}) winsize = 0.1; //SC default was 0.1
    
//The maximum random deviation of the pitch from the pitch ratio
@param({min: 0.0, max: 4.0}) pchdisp = 0.0;
    
//A random offset of from zero to timeDispersion seconds is added to the delay of each grain.
//Use of some dispersion can alleviate a hard comb filter effect due to uniform grain placement.
//It can also be an effect in itself. timeDispersion can be no larger than windowSize
@param({min: 0.0, max: 4.0}) timedisp = 0.006; //SC recursive conv default was 0.006


const delaybuf_array_size : Int = 131072; //max size needed for 0.5 sec winsize @ 48k (0.25s winsize @ 96k, etc.)
@state delaybuf_array = new FixedSampleArray(delaybuf_array_size);

@state delaybufsize_calculated : Int = 0;
@state slope_z : number = 0.0;

@state write_index : Int = 0;
@state mask_z : Int = 0;

@state counter_z : Int = 0;
@state stage_z : Int = 0;
@state framesize_z : Int = 0;
@state numoutput_z : Int = 0;

@state dsamp1_z : number = 0.0;
@state dsamp2_z : number = 0.0;
@state dsamp3_z : number = 0.0;
@state dsamp4_z : number = 0.0;
@state dsamp1_slope_z : number = 0.0;
@state dsamp2_slope_z : number = 0.0;
@state dsamp3_slope_z : number = 0.0;
@state dsamp4_slope_z : number = 0.0;

@state ramp1_z : number = 0.0;
@state ramp2_z : number = 0.0;
@state ramp3_z : number = 0.0;
@state ramp4_z : number = 0.0;
@state ramp1_slope_z : number = 0.0;
@state ramp2_slope_z : number = 0.0;
@state ramp3_slope_z : number = 0.0;
@state ramp4_slope_z : number = 0.0;



////////

const logs_enabled = 0;
const num_log_prints = 64;
@state log_process_count;
const num_counter_cycles = 4;
@state counter_count;

//The PitchShift_next function processes each sample and updates the pitch-shifted output.
function PitchShift_process(i0) {
    /* //SC orig...
    float *out, *in, *dlybuf;
    float disppchratio, pchratio, pchratio1, value;
    float dsamp1, dsamp1_slope, ramp1, ramp1_slope;
    float dsamp2, dsamp2_slope, ramp2, ramp2_slope;
    float dsamp3, dsamp3_slope, ramp3, ramp3_slope;
    float dsamp4, dsamp4_slope, ramp4, ramp4_slope;
    float d1, d2, frac, slope, samp_slope, startpos, winsize, pchdisp, timedisp;
    long remain, nsmps, irdphase, irdphaseb, iwrphase, mask, idsamp;
    long counter, stage, framesize;
    */
    var disppchratio : number = 0.0;
    var pchratio1 : number = 0.0;
    
    var value : number = 0.0;
    var d1 : number = 0.0;
    var d2 : number = 0.0;
    
    var frac : number = 0.0;
    var samp_slope : number = 0.0;
    var startpos : number = 0.0;
    var idsamp : Int = 0;
    
    var read_index_a : Int = 0; //irdphase
    var read_index_b : Int = 0; //irdphaseb
    
    var input : number = i0; //store input sample data
    var output : number = 0.0;
    
    var this_timedisp : number = 0.0;
    
    this_timedisp = clamp(timedisp, 0, winsize) * samplerate(); //144 (timedisp = 0.003 @ 48k SR)
    
    var in_first_cycles : Int = 0;
    var in_wrapping_around_cycles : Int = 0;
    var in_wrapping_around_counter_reset : Int = 0;

    if (logs_enabled) {
        //in_first_cycles = (log_process_count < num_log_prints);
        //in_first_cycles = 0; //uncomment to turn these logs off
        //in_wrapping_around_cycles = ((log_process_count > (mask_z - (num_log_prints*0.5))) && (log_process_count <= (mask_z + (num_log_prints*0.5))));
        //in_wrapping_around_cycles = 0; //uncomment to turn these logs off
        
        //some kind of Max console log buffer overflow prevents all of these in_wrapping_around_counter_reset logs
            //from printing if the above log sets are also enabled (last 16 get dropped in this case)
        //in_wrapping_around_counter_reset = ((log_process_count > (1199 - (num_log_prints*0.5))) && (log_process_count <= (1199 + (num_log_prints*0.5))));
        in_wrapping_around_counter_reset = ((log_process_count >= 1167) && (log_process_count <= 1231)); //this number range can be modified to probe other intervals
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("==============================================");
            //post("log_count:");
            //post(log_count);
            if (in_first_cycles) {post(">>>IN FIRST CYCLES<<<");}
            else if (in_wrapping_around_cycles) {post(">>>WRAPPING AROUND CYCLES<<<");}
            else if (in_wrapping_around_counter_reset) {post(">>>WRAPPING AROUND COUNTER RESET<<<");}
            post("log_process_count:");
            post(log_process_count);
            post("------");
            post("^^^^^^^^|counter (pre-de/increment)|^^^^^^^^");
            post(counter);
            post("^^^^^^^^|write_index (pre-de/increment)|^^^^^^^^");
            post(write_index);
        }
    }
    
    //remain = inNumSamples; //SC orig
    //while (remain) { //SC orig
    if (counter_z <= 0) {
        counter_z = framesize_z >> 2; //reset counter to max (1200)
        stage_z = (stage_z + 1) & 3; //set to 0 if > 3
        disppchratio = pchratio;
        
        if (pchdisp != 0) {
            disppchratio += (pchdisp * random(-1.0, 0.999)); //sub random for frand2() from SC, rand float from -1.0 - 0.999
        }
        
        disppchratio = clamp(disppchratio, 0.0, 4.0);
        pchratio1 = disppchratio - 1.0; //1.0 (if pchratio = 2 and pchdisp = 0)
        samp_slope = -1 * pchratio1; //-1.0 (if pchratio = 2 and pchdisp = 0)
        startpos = pchratio1 < 0.0 ? 2.0 : framesize_z * pchratio1 + 2.0; //4802 (if pchratio = 2 and pchdisp = 0)
        startpos += (this_timedisp * random(0.0, 0.999)); //sub random for frand() from SC, rand float from 0.0 - 0.999
        
        if (logs_enabled) {
            if (counter_count < num_counter_cycles) {
                counter_count++;
                post("^^^^------------ counter_z <= 0 RESET COUNTER ------------^^^^");
                post("--> counter cycle count <--");
                post(counter_count);
                post("counter_z is now:");
                post(counter_z);
                post("stage_z is now:");
                post(stage_z);
                post("--startpos--");
                post(startpos);
                post("vvvv------------ counter_z <= 0 RESET COUNTER ------------vvvv");
            }
        }
        
        switch (stage_z) {
            case 0:
                dsamp1_slope_z = samp_slope;
                dsamp1_z = startpos;
                ramp1_z = 0.0;
                ramp1_slope_z = slope_z;
                ramp3_slope_z = -1 * slope_z;
                break;
            case 1:
                dsamp2_slope_z = samp_slope;
                dsamp2_z = startpos;
                ramp2_z = 0.0;
                ramp2_slope_z = slope_z;
                ramp4_slope_z = -1 * slope_z;
                break;
            case 2:
                dsamp3_slope_z = samp_slope;
                dsamp3_z = startpos;
                ramp3_z = 0.0;
                ramp3_slope_z = slope_z;
                ramp1_slope_z = -1 * slope_z;
                break;
            case 3:
                dsamp4_slope_z = samp_slope;
                dsamp4_z = startpos;
                ramp4_z = 0.0;
                ramp2_slope_z = -1 * slope_z;
                ramp4_slope_z = slope_z;
                break;
        }
    }
    //while} //SC orig
    //nsmps = sc_min(remain, counter); //SC orig
    //remain -= nsmps; //SC orig
    //counter -= nsmps; //SC orig

    counter_z -= 1; //counter inits to 1200 (@48k SR winsize = 0.1)
    //if (counter_z == 0) {post("counter_z == 0");}
    //0 - increment iwrphase + 1 and loop back to 0 when > mask (16383)
    write_index = (write_index + 1) & mask_z; //<---!! orig position - moved below after writing input to delay buffer, otherwise we skip 0 index

    if (logs_enabled) {
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("vvvvvvvv|counter_z|vvvvvvvv");
            post(counter_z);
            post("vvvvvvvv|write_index|vvvvvvvv|");
            post(write_index);
        }
    }

    dsamp1_z += dsamp1_slope_z; //cycle 1: dsamp1 = 3 (2 + 1)
    //idsamp = (long)dsamp1; //SC orig
    idsamp = trunc(dsamp1_z); //cycle 1: 3
    frac = dsamp1_z - idsamp; //cycle 1: 0
    read_index_a = (write_index - idsamp) & mask_z; //cycle 1: 16381
    read_index_b = (read_index_a - 1) & mask_z; //cycle 1: 16380
    //d1 = dlybuf[irdphase]; //SC orig
    d1 = delaybuf_array[read_index_a]; //cycle 1: 0
    //d2 = dlybuf[irdphaseb]; //SC orig
    d2 = delaybuf_array[read_index_b]; //cycle 1: 0
    value = (d1 + frac * (d2 - d1)) * ramp1_z; //cycle 1: 0
    ramp1_z += ramp1_slope_z;
    
    if (logs_enabled) {
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("-------> dsamp1_z <-------");
            post(dsamp1_z);
            post("idsamp:");
            post(idsamp);
            post("frac:");
            post(frac);
            post("read_index_a:");
            post(read_index_a);
            post("read_index_b:");
            post(read_index_b);
            post("......samples......");
            post("d1<delaybuf_array[read_index_a]>:");
            post(d1);
            post("d2<delaybuf_array[read_index_b]>:");
            post(d2);
            post("value:");
            post(value);
            post("ramp1_z:");
            post(ramp1_z);
        }
    }

    dsamp2_z += dsamp2_slope_z; //cycle 1: 3
    idsamp = trunc(dsamp2_z); //3
    frac = dsamp2_z - idsamp; //0
    read_index_a = (write_index - idsamp) & mask_z; //cycle 1: 16381
    read_index_b = (read_index_a - 1) & mask_z; //cycle 1: 16380
    //d1 = dlybuf[irdphase]; //SC orig
    d1 = delaybuf_array[read_index_a]; //cycle 1: 0
    //d2 = dlybuf[irdphaseb]; //SC orig
    d2 = delaybuf_array[read_index_b]; //cycle 1: 0
    value += (d1 + frac * (d2 - d1)) * ramp2_z; //cycle 1: 0
    ramp2_z += ramp2_slope_z;
    
    if (logs_enabled) {
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("-------> dsamp2_z <-------");
            post(dsamp2_z);
            post("idsamp:");
            post(idsamp);
            post("frac:");
            post(frac);
            post("read_index_a:");
            post(read_index_a);
            post("read_index_b:");
            post(read_index_b);
            post("......samples......");
            post("d1<delaybuf_array[read_index_a]>:");
            post(d1);
            post("d2<delaybuf_array[read_index_b]>:");
            post(d2);
            post("value:");
            post(value);
            post("ramp2_z:");
            post(ramp2_z);
        }
    }

    dsamp3_z += dsamp3_slope_z;
    idsamp = trunc(dsamp3_z);
    frac = dsamp3_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;
    //d1 = dlybuf[irdphase]; //SC orig
    d1 = delaybuf_array[read_index_a];
    //d2 = dlybuf[irdphaseb]; //SC orig
    d2 = delaybuf_array[read_index_b];
    value += (d1 + frac * (d2 - d1)) * ramp3_z;
    ramp3_z += ramp3_slope_z;
    
    if (logs_enabled) {
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("-------> dsamp3_z <-------");
            post(dsamp3_z);
            post("idsamp:");
            post(idsamp);
            post("frac:");
            post(frac);
            post("read_index_a:");
            post(read_index_a);
            post("read_index_b:");
            post(read_index_b);
            post("......samples......");
            post("d1<delaybuf_array[read_index_a]>:");
            post(d1);
            post("d2<delaybuf_array[read_index_b]>:");
            post(d2);
            post("value:");
            post(value);
            post("ramp3_z:");
            post(ramp3_z);
        }
    }

    dsamp4_z += dsamp4_slope_z;
    idsamp = trunc(dsamp4_z);
    frac = dsamp4_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;
    //d1 = dlybuf[irdphase]; //SC orig
    d1 = delaybuf_array[read_index_a];
    //d2 = dlybuf[irdphaseb]; //SC orig
    d2 = delaybuf_array[read_index_b];
    value += (d1 + frac * (d2 - d1)) * ramp4_z;
    ramp4_z += ramp4_slope_z;
    
    if (logs_enabled) {
        if (in_first_cycles || in_wrapping_around_cycles || in_wrapping_around_counter_reset) {
            post("-------> dsamp4_z <-------");
            post(dsamp4_z);
            post("idsamp:");
            post(idsamp);
            post("frac:");
            post(frac);
            post("read_index_a:");
            post(read_index_a);
            post("read_index_b:");
            post(read_index_b);
            post("......samples......");
            post("d1<delaybuf_array[read_index_a]>:");
            post(d1);
            post("d2<delaybuf_array[read_index_b]>:");
            post(d2);
            post("value:");
            post(value);
            post("ramp4_z:");
            post(ramp4_z);
        }
    }

    //dlybuf[iwrphase] = ZXP(in); //SC orig...<---get in buffer data and write to dlybuf
    delaybuf_array[write_index] = input;
    //ZXP(out) = value *= 0.5;); //SC orig...<--- write processed value to out buffer data...
    output = value *= 0.5; //cycle 1: 0
    
    //0 - increment iwrphase + 1 and loop back to 0 when > mask (16383)
    //write_index = (write_index + 1) & mask_z; //<---!!! MOVED from above to avoid skipping index 0 on first cycle...
    
    
    if (logs_enabled) {
        if (in_first_cycles) {
            if (log_process_count == (num_log_prints - 1)) {
                post("[=== first 'num_log_prints' delaybuf values ===]");
                for (var i = 0; i < num_log_prints; ++i) {
                    post(delaybuf_array[i]);
                }
                post("[======]");
            }
        }
        log_process_count++;
    }
    
    return output;
}

//basically same as PitchShift_process(), but accounts for DSP prior to delaybuffer being filled w/ some extra checks
//but introduces some unwanted frequency dependent attenuation for some reason compared to PitchShift_process()
function PitchShift_process_z(i0) { //<---!!!
    var disppchratio : number = 0;
    var pchratio1 : number = 0;
    var value : number = 0;
    var d1 : number = 0;
    var d2 : number = 0;
    var frac : number = 0;
    var samp_slope : number = 0;
    var startpos : number = 0;
    var idsamp : number = 0;
    
    var read_index_a : Int = 0; //irdphase
    var read_index_b : Int = 0; //irdphaseb
    
    var input : number = i0;
    var output : number = 0.0;
    
    var this_timedisp : number = 0;
    
    this_timedisp = clamp(timedisp, 0, winsize) * samplerate();

    if (counter_z <= 0) {
        counter_z = framesize_z >> 2; //reset counter to max
        stage_z = (stage_z + 1) & 3; //increment sstage
        disppchratio = pchratio;
        
        if (pchdisp != 0.0) {
            disppchratio += (pchdisp * random(-1.0, 0.999));
        }

        disppchratio = clamp(disppchratio, 0.0, 4.0);
        pchratio1 = disppchratio - 1.0;
        samp_slope = -1 * pchratio1;
        startpos = pchratio1 < 0 ? 2 : framesize_z * pchratio1 + 2;
        startpos += (timedisp * random(0.0, 0.999));
        
        switch (stage_z) {
            case 0:
                dsamp1_slope_z = samp_slope;
                dsamp1_z = startpos;
                ramp1_z = 0.0;
                ramp1_slope_z = slope_z;
                ramp3_slope_z = -1 * slope_z;
                break;
            case 1:
                dsamp2_slope_z = samp_slope;
                dsamp2_z = startpos;
                ramp2_z = 0.0;
                ramp2_slope_z = slope_z;
                ramp4_slope_z = -1 * slope_z;
                break;
            case 2:
                dsamp3_slope_z = samp_slope;
                dsamp3_z = startpos;
                ramp3_z = 0.0;
                ramp3_slope_z = slope_z;
                ramp1_slope_z = -1 * slope_z;
                break;
            case 3:
                dsamp4_slope_z = samp_slope;
                dsamp4_z = startpos;
                ramp4_z = 0.0;
                ramp2_slope_z = -1 * slope_z;
                ramp4_slope_z = slope_z;
                break;
        }
    }
    //nsmps = minimum(remain, counter);
    //remain -= nsmps;
    counter_z -= 1;

    numoutput_z++;
    write_index = (write_index + 1) & mask_z;

    dsamp1_z += dsamp1_slope_z;
    idsamp = trunc(dsamp1_z);
    frac = dsamp1_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;
    if (numoutput_z < delaybufsize_calculated) {//processing < 1st cycle through delaybuf
        if (read_index_a > write_index) {
            value = 0.0;
        } else if (read_index_b > write_index) {
            d1 = delaybuf_array[read_index_a];
            value = (d1 - frac * d1) * ramp1_z;
        } else {
            d1 = delaybuf_array[read_index_a];
            d2 = delaybuf_array[read_index_b];
            value = (d1 + frac * (d2 - d1)) * ramp1_z;
        }
    } else {//processing after 1st cycle through delaybuf
        d1 = delaybuf_array[read_index_a];
        d2 = delaybuf_array[read_index_b];
        value = (d1 + frac * (d2 - d1)) * ramp1_z;
    }
    ramp1_z += ramp1_slope_z;

    dsamp2_z += dsamp2_slope_z;
    idsamp = trunc(dsamp2_z);
    frac = dsamp2_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;
    if (numoutput_z < delaybufsize_calculated) {
        if (read_index_a > write_index) {
            // value += 0.f;
        } else if (read_index_b > write_index) {
            d1 = delaybuf_array[read_index_a];
            value += (d1 - frac * d1) * ramp2_z;
        } else {
            d1 = delaybuf_array[read_index_a];
            d2 = delaybuf_array[read_index_b];
            value += (d1 + frac * (d2 - d1)) * ramp2_z;
        }
    } else {
        d1 = delaybuf_array[read_index_a];
        d2 = delaybuf_array[read_index_b];
        value += (d1 + frac * (d2 - d1)) * ramp2_z;
    }
    ramp2_z += ramp2_slope_z;

    dsamp3_z += dsamp3_slope_z;
    idsamp = trunc(dsamp3_z);
    frac = dsamp3_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;
    if (numoutput_z < delaybufsize_calculated) {
        if (read_index_a > write_index) {
            // value += 0.f;
        } else if (read_index_b > write_index) {
            d1 = delaybuf_array[read_index_a];
            value += (d1 - frac * d1) * ramp3_z;
        } else {
            d1 = delaybuf_array[read_index_a];
            d2 = delaybuf_array[read_index_b];
            value += (d1 + frac * (d2 - d1)) * ramp3_z;
        }
    } else {
        d1 = delaybuf_array[read_index_a];
        d2 = delaybuf_array[read_index_b];
        value += (d1 + frac * (d2 - d1)) * ramp3_z;
    }
    ramp3_z += ramp3_slope_z;

    dsamp4_z += dsamp4_slope_z;
    idsamp = trunc(dsamp4_z);
    frac = dsamp4_z - idsamp;
    read_index_a = (write_index - idsamp) & mask_z;
    read_index_b = (read_index_a - 1) & mask_z;

    if (numoutput_z < delaybufsize_calculated) {
        if (read_index_a > write_index) {
            // value += 0.f;
        } else if (read_index_b > write_index) {
            d1 = delaybuf_array[read_index_a];
            value += (d1 - frac * d1) * ramp4_z;
        } else {
            d1 = delaybuf_array[read_index_a];
            d2 = delaybuf_array[read_index_b];
            value += (d1 + frac * (d2 - d1)) * ramp4_z;
        }
    } else {
        d1 = delaybuf_array[read_index_a];
        d2 = delaybuf_array[read_index_b];
        value += (d1 + frac * (d2 - d1)) * ramp4_z;
    }
    ramp4_z += ramp4_slope_z;

    delaybuf_array[write_index] = input; //get in buffer data and write into dlybuf <---
    output = value *= 0.5; //write processed value to output buffer <---
    
    //if (numoutput_z >= delaybufsize_calculated) { //I don't think this is necessary in Max
    //    PitchShift_next(); //I don't think this is necessary in Max
    //}
    return output;
}

function next_power_of_two(n)
{
    var n1, n2, n3, n4, n5;
    --n;
    
    n1 = n >> 1;
    n = n | n1;
    
    n2 = n >> 2;
    n = n | n2;

    n3 = n >> 4;
    n = n | n3;
    
    n4 = n >> 8;
    n = n | n4;
    
    n5 = n >> 16;
    n = n | n5;

    return n + 1;
}

//from PitchShift_Constructor()
function init_pitchshift_z() {
    
    if (logs_enabled) {
        post("init_pitchshift_z() START --------------");
        log_count = 0;
        log_process_count = 0;
        counter_count = 0;
    }
    
    //float minimum_winsize = 3.f * SAMPLEDUR;
    var minimum_winsize : number = 0.0;
    minimum_winsize = 3 * safediv(1, samplerate());
    if (winsize < minimum_winsize) {
        winsize = minimum_winsize; //0.0000625 @ 48k SR
    }

    for (var i = 0; i < delaybuf_array_size; ++i) {
        delaybuf_array[i] = 0.0; //0 out "delay line" array
    }

    delaybufsize_calculated = trunc(ceil((winsize * samplerate() * 3) + 3)); //14403 (for 48k SR if winsize = 0.1)
    
    //delaybufsize = delaybufsize + BUFLENGTH;
    delaybufsize_calculated = delaybufsize_calculated + vectorsize(); //14659 (if 256 buffer size)
    
    
    //I could output this delaybufsize value from the codeblox and use it as the size arg for an external buffer~ rnbo object
    delaybufsize_calculated = next_power_of_two(delaybufsize_calculated); // 16384 (for 48k / 256 buffer if winsize = 0.1)
	if (delaybufsize_calculated > delaybuf_array_size) {delaybufsize_calculated = delaybuf_array_size;} //to safeguard against writing/reading beyond bounds of FixedSampleArray...

    write_index = 0;
    //unit->mask = last = (delaybufsize - 1); //updating last not necessary in Max (see above)...
    mask_z = delaybufsize_calculated - 1; // 16383

    //unit->framesize = framesize = ((long)(winsize * SAMPLERATE) + 2) & ~3; //SC
    framesize_z = (trunc(winsize * samplerate()) + 2) & ~3; //4800 (@ 48k SR w/ 0.1 winsize)
    
    //unit->slope = slope = 2.f / framesize; //SC
    slope_z = 2.0 / framesize_z; //0.000416666666667

    stage_z = 3;
    counter_z = framesize_z >> 2; //1200 (= 4800 >> 2)

    ramp1_z = 0.5;
    ramp2_z = 1.0;
    ramp3_z = 0.5;
    ramp4_z = 0.0;

    ramp1_slope_z = -1 * slope_z; //-0.000416666666667
    ramp2_slope_z = -1 * slope_z; //-0.000416666666667
    ramp3_slope_z = slope_z; //0.000416666666667
    ramp4_slope_z = slope_z; //0.000416666666667

    numoutput_z = 0;

    // start all read heads 2 samples behind the write head
    //unit->dsamp1 = unit->dsamp2 = unit->dsamp3 = unit->dsamp4 = 2.f;
    dsamp1_z = dsamp2_z = dsamp3_z = dsamp4_z = 2.0;
    // pch ratio is initially zero for the read heads
    //unit->dsamp1_slope = unit->dsamp2_slope = unit->dsamp3_slope = unit->dsamp4_slope = 1.f;
    dsamp1_slope_z = dsamp2_slope_z = dsamp3_slope_z = dsamp4_slope_z = 1.0;
    
    if (logs_enabled) {
		post("winsize:");
        post(winsize);
        post("delaybufsize_calculated:");
        post(delaybufsize_calculated);
        post("mask_z:");
        post(mask_z);
        post("framesize_z:");
        post(framesize_z);
        post("slope_z:");
        post(slope_z);
        post("counter_z:");
        post(counter_z);
        post("init_pitchshift_z() -------------- END");
    }
    
}

function dspsetup() {
    init_pitchshift_z();
}

//out1 = PitchShift_process_z(in1);
out1 = PitchShift_process(in1);
