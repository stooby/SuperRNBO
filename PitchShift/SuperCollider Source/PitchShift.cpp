/*
    SuperCollider real time audio synthesis system
    Copyright (c) 2002 James McCartney. All rights reserved.
    http://www.audiosynth.com

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
*/

//PitchShift Ugen source code originally from DelayUGens.cpp SuperCollider source. CC'ed here purely for reference.
//https://github.com/supercollider/supercollider/blob/3b3eca75a1b42ad4a6c1146ad1893568d083d5c5/server/plugins/DelayUGens.cpp#L4573

////////////////////////////////////////////////////////////////////////////////////////////////////////
struct PitchShift : public Unit {
    float* dlybuf;
    float dsamp1, dsamp1_slope, ramp1, ramp1_slope;
    float dsamp2, dsamp2_slope, ramp2, ramp2_slope;
    float dsamp3, dsamp3_slope, ramp3, ramp3_slope;
    float dsamp4, dsamp4_slope, ramp4, ramp4_slope;
    float fdelaylen, slope;
    long iwrphase, idelaylen, mask;
    long counter, stage, numoutput, framesize;
};

void PitchShift_next(PitchShift* unit, int inNumSamples);


void PitchShift_next(PitchShift* unit, int inNumSamples) {
    float *out, *in, *dlybuf;
    float disppchratio, pchratio, pchratio1, value;
    float dsamp1, dsamp1_slope, ramp1, ramp1_slope;
    float dsamp2, dsamp2_slope, ramp2, ramp2_slope;
    float dsamp3, dsamp3_slope, ramp3, ramp3_slope;
    float dsamp4, dsamp4_slope, ramp4, ramp4_slope;
    float fdelaylen, d1, d2, frac, slope, samp_slope, startpos, winsize, pchdisp, timedisp;
    long remain, nsmps, idelaylen, irdphase, irdphaseb, iwrphase, mask, idsamp;
    long counter, stage, framesize;

    RGET

    out = ZOUT(0);
    in = ZIN(0);

    pchratio = ZIN0(2);
    winsize = ZIN0(1);
    pchdisp = ZIN0(3);
    timedisp = ZIN0(4);
    timedisp = sc_clip(timedisp, 0.f, winsize) * SAMPLERATE;

    dlybuf = unit->dlybuf;
    fdelaylen = unit->fdelaylen;
    idelaylen = unit->idelaylen;
    iwrphase = unit->iwrphase;

    counter = unit->counter;
    stage = unit->stage;
    mask = unit->mask;
    framesize = unit->framesize;

    dsamp1 = unit->dsamp1;
    dsamp2 = unit->dsamp2;
    dsamp3 = unit->dsamp3;
    dsamp4 = unit->dsamp4;

    dsamp1_slope = unit->dsamp1_slope;
    dsamp2_slope = unit->dsamp2_slope;
    dsamp3_slope = unit->dsamp3_slope;
    dsamp4_slope = unit->dsamp4_slope;

    ramp1 = unit->ramp1;
    ramp2 = unit->ramp2;
    ramp3 = unit->ramp3;
    ramp4 = unit->ramp4;

    ramp1_slope = unit->ramp1_slope;
    ramp2_slope = unit->ramp2_slope;
    ramp3_slope = unit->ramp3_slope;
    ramp4_slope = unit->ramp4_slope;

    slope = unit->slope;

    remain = inNumSamples;
    while (remain) {
        if (counter <= 0) {
            counter = framesize >> 2;
            unit->stage = stage = (stage + 1) & 3;
            disppchratio = pchratio;
            if (pchdisp != 0.f) {
                disppchratio += (pchdisp * frand2(s1, s2, s3));
            }
            disppchratio = sc_clip(disppchratio, 0.f, 4.f);
            pchratio1 = disppchratio - 1.f;
            samp_slope = -pchratio1;
            startpos = pchratio1 < 0.f ? 2.f : framesize * pchratio1 + 2.f;
            startpos += (timedisp * frand(s1, s2, s3));
            switch (stage) {
            case 0:
                unit->dsamp1_slope = dsamp1_slope = samp_slope;
                dsamp1 = startpos;
                ramp1 = 0.0;
                unit->ramp1_slope = ramp1_slope = slope;
                unit->ramp3_slope = ramp3_slope = -slope;
                break;
            case 1:
                unit->dsamp2_slope = dsamp2_slope = samp_slope;
                dsamp2 = startpos;
                ramp2 = 0.0;
                unit->ramp2_slope = ramp2_slope = slope;
                unit->ramp4_slope = ramp4_slope = -slope;
                break;
            case 2:
                unit->dsamp3_slope = dsamp3_slope = samp_slope;
                dsamp3 = startpos;
                ramp3 = 0.0;
                unit->ramp3_slope = ramp3_slope = slope;
                unit->ramp1_slope = ramp1_slope = -slope;
                break;
            case 3:
                unit->dsamp4_slope = dsamp4_slope = samp_slope;
                dsamp4 = startpos;
                ramp4 = 0.0;
                unit->ramp2_slope = ramp2_slope = -slope;
                unit->ramp4_slope = ramp4_slope = slope;
                break;
            }
            /*Print("%d %d    %g %g %g %g    %g %g %g %g    %g %g %g %g\n",
                counter, stage, dsamp1_slope, dsamp2_slope, dsamp3_slope, dsamp4_slope,
                    dsamp1, dsamp2, dsamp3, dsamp4,
                    ramp1, ramp2, ramp3, ramp4);*/
        }

        nsmps = sc_min(remain, counter);
        remain -= nsmps;
        counter -= nsmps;

        LOOP(nsmps, iwrphase = (iwrphase + 1) & mask;

             dsamp1 += dsamp1_slope;
             idsamp = (long)dsamp1;
             frac = dsamp1 - idsamp;
             irdphase = (iwrphase - idsamp) & mask;
             irdphaseb = (irdphase - 1) & mask;
             d1 = dlybuf[irdphase];
             d2 = dlybuf[irdphaseb];
             value = (d1 + frac * (d2 - d1)) * ramp1;
             ramp1 += ramp1_slope;

             dsamp2 += dsamp2_slope;
             idsamp = (long)dsamp2;
             frac = dsamp2 - idsamp;
             irdphase = (iwrphase - idsamp) & mask;
             irdphaseb = (irdphase - 1) & mask;
             d1 = dlybuf[irdphase];
             d2 = dlybuf[irdphaseb];
             value += (d1 + frac * (d2 - d1)) * ramp2; 
             ramp2 += ramp2_slope;

             dsamp3 += dsamp3_slope; 
             idsamp = (long)dsamp3;
             frac = dsamp3 - idsamp;
             irdphase = (iwrphase - idsamp) & mask;
             irdphaseb = (irdphase - 1) & mask;
             d1 = dlybuf[irdphase];
             d2 = dlybuf[irdphaseb];
             value += (d1 + frac * (d2 - d1)) * ramp3;
             ramp3 += ramp3_slope;

             dsamp4 += dsamp4_slope;
             idsamp = (long)dsamp4;
             frac = dsamp4 - idsamp;
             irdphase = (iwrphase - idsamp) & mask;
             irdphaseb = (irdphase - 1) & mask;
             d1 = dlybuf[irdphase];
             d2 = dlybuf[irdphaseb];
             value += (d1 + frac * (d2 - d1)) * ramp4;
             ramp4 += ramp4_slope;

             dlybuf[iwrphase] = ZXP(in);
             ZXP(out) = value *= 0.5;);
    }

    unit->counter = counter;

    unit->dsamp1 = dsamp1;
    unit->dsamp2 = dsamp2;
    unit->dsamp3 = dsamp3;
    unit->dsamp4 = dsamp4;

    unit->ramp1 = ramp1;
    unit->ramp2 = ramp2;
    unit->ramp3 = ramp3;
    unit->ramp4 = ramp4;

    unit->iwrphase = iwrphase;

    RPUT
}


void PitchShift_next_z(PitchShift* unit, int inNumSamples);


void PitchShift_next_z(PitchShift* unit, int inNumSamples) {
    float *out, *in, *dlybuf;
    float disppchratio, pchratio, pchratio1, value;
    float dsamp1, dsamp1_slope, ramp1, ramp1_slope;
    float dsamp2, dsamp2_slope, ramp2, ramp2_slope;
    float dsamp3, dsamp3_slope, ramp3, ramp3_slope;
    float dsamp4, dsamp4_slope, ramp4, ramp4_slope;
    float fdelaylen, d1, d2, frac, slope, samp_slope, startpos, winsize, pchdisp, timedisp;
    long remain, nsmps, idelaylen, irdphase, irdphaseb, iwrphase;
    long mask, idsamp;
    long counter, stage, framesize, numoutput;

    RGET

    out = ZOUT(0);
    in = ZIN(0);
    pchratio = ZIN0(2);
    winsize = ZIN0(1);
    pchdisp = ZIN0(3);
    timedisp = ZIN0(4);
    timedisp = sc_clip(timedisp, 0.f, winsize) * SAMPLERATE;

    dlybuf = unit->dlybuf;
    fdelaylen = unit->fdelaylen;
    idelaylen = unit->idelaylen;
    iwrphase = unit->iwrphase;
    numoutput = unit->numoutput;

    counter = unit->counter;
    stage = unit->stage;
    mask = unit->mask;
    framesize = unit->framesize;

    dsamp1 = unit->dsamp1; 
    dsamp2 = unit->dsamp2;
    dsamp3 = unit->dsamp3;
    dsamp4 = unit->dsamp4;

    dsamp1_slope = unit->dsamp1_slope;
    dsamp2_slope = unit->dsamp2_slope;
    dsamp3_slope = unit->dsamp3_slope;
    dsamp4_slope = unit->dsamp4_slope;

    ramp1 = unit->ramp1;
    ramp2 = unit->ramp2;
    ramp3 = unit->ramp3;
    ramp4 = unit->ramp4;

    ramp1_slope = unit->ramp1_slope;
    ramp2_slope = unit->ramp2_slope;
    ramp3_slope = unit->ramp3_slope;
    ramp4_slope = unit->ramp4_slope;

    slope = unit->slope;

    remain = inNumSamples;
    while (remain) {
        if (counter <= 0) {
            counter = framesize >> 2;
            unit->stage = stage = (stage + 1) & 3;
            disppchratio = pchratio;
            if (pchdisp != 0.f) {
                disppchratio += (pchdisp * frand2(s1, s2, s3));
            }
            disppchratio = sc_clip(disppchratio, 0.f, 4.f);
            pchratio1 = disppchratio - 1.f;
            samp_slope = -pchratio1;
            startpos = pchratio1 < 0.f ? 2.f : framesize * pchratio1 + 2.f;
            startpos += (timedisp * frand(s1, s2, s3));
            switch (stage) {
            case 0:
                unit->dsamp1_slope = dsamp1_slope = samp_slope;
                dsamp1 = startpos;
                ramp1 = 0.0;
                unit->ramp1_slope = ramp1_slope = slope;
                unit->ramp3_slope = ramp3_slope = -slope;
                break;
            case 1:
                unit->dsamp2_slope = dsamp2_slope = samp_slope;
                dsamp2 = startpos;
                ramp2 = 0.0;
                unit->ramp2_slope = ramp2_slope = slope;
                unit->ramp4_slope = ramp4_slope = -slope;
                break;
            case 2:
                unit->dsamp3_slope = dsamp3_slope = samp_slope;
                dsamp3 = startpos;
                ramp3 = 0.0;
                unit->ramp3_slope = ramp3_slope = slope;
                unit->ramp1_slope = ramp1_slope = -slope;
                break;
            case 3:
                unit->dsamp4_slope = dsamp4_slope = samp_slope;
                dsamp4 = startpos;
                ramp4 = 0.0;
                unit->ramp2_slope = ramp2_slope = -slope;
                unit->ramp4_slope = ramp4_slope = slope;
                break;
            }
            /*Print("z %d %d    %g %g %g %g    %g %g %g %g    %g %g %g %g\n",
                counter, stage, dsamp1_slope, dsamp2_slope, dsamp3_slope, dsamp4_slope,
                    dsamp1, dsamp2, dsamp3, dsamp4,
                    ramp1, ramp2, ramp3, ramp4);*/
        }
        nsmps = sc_min(remain, counter);
        remain -= nsmps;
        counter -= nsmps;

        while (nsmps--) {
            numoutput++;
            iwrphase = (iwrphase + 1) & mask;

            dsamp1 += dsamp1_slope;
            idsamp = (long)dsamp1;
            frac = dsamp1 - idsamp;
            irdphase = (iwrphase - idsamp) & mask;
            irdphaseb = (irdphase - 1) & mask;
            if (numoutput < idelaylen) {
                if (irdphase > iwrphase) {
                    value = 0.f;
                } else if (irdphaseb > iwrphase) {
                    d1 = dlybuf[irdphase];
                    value = (d1 - frac * d1) * ramp1;
                } else {
                    d1 = dlybuf[irdphase];
                    d2 = dlybuf[irdphaseb];
                    value = (d1 + frac * (d2 - d1)) * ramp1;
                }
            } else {
                d1 = dlybuf[irdphase];
                d2 = dlybuf[irdphaseb];
                value = (d1 + frac * (d2 - d1)) * ramp1;
            }
            ramp1 += ramp1_slope;

            dsamp2 += dsamp2_slope;
            idsamp = (long)dsamp2;
            frac = dsamp2 - idsamp;
            irdphase = (iwrphase - idsamp) & mask;
            irdphaseb = (irdphase - 1) & mask;
            if (numoutput < idelaylen) {
                if (irdphase > iwrphase) {
                    // value += 0.f;
                } else if (irdphaseb > iwrphase) {
                    d1 = dlybuf[irdphase];
                    value += (d1 - frac * d1) * ramp2;
                } else {
                    d1 = dlybuf[irdphase];
                    d2 = dlybuf[irdphaseb];
                    value += (d1 + frac * (d2 - d1)) * ramp2;
                }
            } else {
                d1 = dlybuf[irdphase];
                d2 = dlybuf[irdphaseb];
                value += (d1 + frac * (d2 - d1)) * ramp2;
            }
            ramp2 += ramp2_slope;

            dsamp3 += dsamp3_slope;
            idsamp = (long)dsamp3;
            frac = dsamp3 - idsamp;
            irdphase = (iwrphase - idsamp) & mask;
            irdphaseb = (irdphase - 1) & mask;
            if (numoutput < idelaylen) {
                if (irdphase > iwrphase) {
                    // value += 0.f;
                } else if (irdphaseb > iwrphase) {
                    d1 = dlybuf[irdphase];
                    value += (d1 - frac * d1) * ramp3;
                } else {
                    d1 = dlybuf[irdphase];
                    d2 = dlybuf[irdphaseb];
                    value += (d1 + frac * (d2 - d1)) * ramp3;
                }
            } else {
                d1 = dlybuf[irdphase];
                d2 = dlybuf[irdphaseb];
                value += (d1 + frac * (d2 - d1)) * ramp3;
            }
            ramp3 += ramp3_slope;

            dsamp4 += dsamp4_slope;
            idsamp = (long)dsamp4;
            frac = dsamp4 - idsamp;
            irdphase = (iwrphase - idsamp) & mask;
            irdphaseb = (irdphase - 1) & mask;

            if (numoutput < idelaylen) {
                if (irdphase > iwrphase) {
                    // value += 0.f;
                } else if (irdphaseb > iwrphase) {
                    d1 = dlybuf[irdphase];
                    value += (d1 - frac * d1) * ramp4;
                } else {
                    d1 = dlybuf[irdphase];
                    d2 = dlybuf[irdphaseb];
                    value += (d1 + frac * (d2 - d1)) * ramp4;
                }
            } else {
                d1 = dlybuf[irdphase];
                d2 = dlybuf[irdphaseb];
                value += (d1 + frac * (d2 - d1)) * ramp4;
            }
            ramp4 += ramp4_slope;

            dlybuf[iwrphase] = ZXP(in);
            ZXP(out) = value *= 0.5;
        }
    }

    unit->counter = counter;
    unit->stage = stage;
    unit->mask = mask;

    unit->dsamp1 = dsamp1;
    unit->dsamp2 = dsamp2;
    unit->dsamp3 = dsamp3;
    unit->dsamp4 = dsamp4;

    unit->ramp1 = ramp1;
    unit->ramp2 = ramp2;
    unit->ramp3 = ramp3;
    unit->ramp4 = ramp4;

    unit->numoutput = numoutput;
    unit->iwrphase = iwrphase;

    if (numoutput >= idelaylen) {
        SETCALC(PitchShift_next);
    }

    RPUT
}


void PitchShift_Ctor(PitchShift* unit);


void PitchShift_Ctor(PitchShift* unit) {
    long delaybufsize;
    float *out, *in, *dlybuf;
    float winsize, pchratio;
    float fdelaylen, slope;
    long framesize, last;

    out = ZOUT(0);
    in = ZIN(0);
    pchratio = ZIN0(2);
    winsize = ZIN0(1);

    // TODO: why does scsynth freeze if the window size is <= 2 samples?

    // Nobody needs windows that small for pitch shifting anyway, so we will
    // simply clamp the window size to 3.
    float minimum_winsize = 3.f * SAMPLEDUR;
    if (winsize < minimum_winsize) {
        winsize = minimum_winsize;
    }

    delaybufsize = (long)ceil(winsize * SAMPLERATE * 3.f + 3.f);
    fdelaylen = delaybufsize - 3; //not used anywhere

    delaybufsize = delaybufsize + BUFLENGTH;
    delaybufsize = NEXTPOWEROFTWO(delaybufsize);
    unit->dlybuf = nullptr;
    dlybuf = (float*)RTAlloc(unit->mWorld, delaybufsize * sizeof(float));
    ClearUnitIfMemFailed(dlybuf);

    SETCALC(PitchShift_next_z); 

    *dlybuf = ZIN0(0);
    ZOUT0(0) = 0.f;

	
    unit->dlybuf = dlybuf;
    unit->idelaylen = delaybufsize;
    unit->fdelaylen = fdelaylen;
    unit->iwrphase = 0;
    unit->numoutput = 0;
    unit->mask = last = (delaybufsize - 1);

    unit->framesize = framesize = ((long)(winsize * SAMPLERATE) + 2) & ~3;
    unit->slope = slope = 2.f / framesize;
    unit->stage = 3;
    unit->counter = framesize >> 2;
    unit->ramp1 = 0.5;
    unit->ramp2 = 1.0;
    unit->ramp3 = 0.5;
    unit->ramp4 = 0.0;

    unit->ramp1_slope = -slope;
    unit->ramp2_slope = -slope;
    unit->ramp3_slope = slope;
    unit->ramp4_slope = slope;

    dlybuf[last] = 0.f; // put a few zeroes where we start the read heads
    dlybuf[last - 1] = 0.f;
    dlybuf[last - 2] = 0.f;

    unit->numoutput = 0;

    // start all read heads 2 samples behind the write head
    unit->dsamp1 = unit->dsamp2 = unit->dsamp3 = unit->dsamp4 = 2.f;
    // pch ratio is initially zero for the read heads
    unit->dsamp1_slope = unit->dsamp2_slope = unit->dsamp3_slope = unit->dsamp4_slope = 1.f;
}


void PitchShift_Dtor(PitchShift* unit) { RTFree(unit->mWorld, unit->dlybuf); }