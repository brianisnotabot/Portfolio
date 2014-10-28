<CsoundSynthesizer>
<CsOptions>
-d -o /home/brian/storage/portfolio/Speak/Speak_20141028_0030/Speak_20141028_0030.wav
-B 4096
</CsOptions>
<CsInstruments>

sr	=	44100
ksmps	=	10
nchnls	=	2
0dbfs	=	1

gaInput init 0
gaRev init 0
gadel init 0
maxalloc 2, 5
instr 1	
ifftsize    =       4096
;ifftsize    =       1024
ioverlap    =       ifftsize / 4
iwinsize    =       ifftsize
iwinshape   =       1; von-Hann window
Sfile = "/home/brian/storage/res/samples/speech/the_oracle.wav"
p3 = filelen(Sfile)
a1 diskin2 Sfile, 1
fftin1 pvsanal a1, ifftsize, ioverlap, iwinsize, iwinshape
fftin2 pvsanal gaInput, ifftsize, ioverlap, iwinsize, iwinshape
fcross pvsvoc fftin1, fftin2, 1, 1
aout pvsynth fcross
aout = aout * linsegr(0.5, 8, 0)
aL = aout 
aR = aL
outs aL, aR
gadel = gadel + aout * 0.2
gaRev = gaRev + aout * 0.8
gaInput = 0
endin

instr 2
iscale = 0.8
gaInput = gaInput + 
(vco2(p5 * iscale, cpsmidinn(p4), 2, 0.25) + 
vco2(p5 * iscale, cpsmidinn(p4 - 12), 2, 0.25)) * 
linsegr(0, 1, 1, 3, 0)

event_i "i", 5, 0, p3, p4, p5 * 0.5
;aout = vco2(p5 * 0.5, cpsmidinn(p4), 2, 0.25) * linsegr(0, 1, 1, 3, 0)
;outs aout, aout
endin


alwayson 3
instr 3
aL, aR reverbsc gaRev, gaRev, 0.94, 5000
outs aL, aR
clear gaRev
endin
alwayson 4
instr 4
adelL init 0
adelL delay gadel + adelL * 0.5, 1
adelL butlp adelL, 2000
adelR init 0
adelR delay gadel + adelR * 0.5, 1.01
adelR butlp adelR, 2000
outs adelL, adelR
clear gadel
endin

instr 5
isine ftgenonce 0, 0, 4096, 10, 1
iamp = p5
kcps_1 = cpsmidinn(p4 + jitter(0.1, 0.1, 5)) 
kcps_2 = cpsmidinn(p4 + 0.01 + jitter(0.1, 0.1, 5))
kcps_3 = cpsmidinn(p4 - 0.2 + jitter(0.1, 0.1, 5))
asub oscili iamp * linseg(0, 8, 0.3), cpsmidinn(p4) * 3, isine
a1 gbuzz iamp, kcps_1, 20, 1, linseg(0, 3, 0.4), isine
a2 gbuzz iamp, kcps_2, 20, 1, linseg(0, 3, 0.4), isine
a3 gbuzz iamp, kcps_3, 20, 1, linseg(0, 3, 0.4), isine
a2L, a2R pan2 a2, 0.5 + lfo(0.3, 0.1)
a3L, a3R pan2 a3, 0.2 - lfo(0.3, 0.09)
aL = sum(a1, a2L, a3L, asub) * 0.3 * linsegr(0, 1, 1, 3, 0)
aR = sum(a1, a2R, a3R, asub) * 0.3 * linsegr(0, 1, 1, 3, 0)
gaInput = gaInput + aL
endin

</CsInstruments>
<CsScore>

i1 0 1
i2 0 43.6277 46 0.3
i2 0 5 58 0.3
i2 14 5 58 0.3
i2 28 5 58 0.3
i2 42 5 58 0.3
i2 2 5 65 0.3
i2 12 5 65 0.3
i2 22 5 65 0.3
i2 32 5 65 0.3
i2 42 5 65 0.3
i2 4 5 70 0.3
i2 17 5 70 0.3
i2 30 5 70 0.3
i2 43 5 70 0.3
i2 6 5 72 0.3
i2 20 5 72 0.3
i2 34 5 72 0.3
i2 8 5 77 0.3
i2 22 5 77 0.3
i2 36 5 77 0.3
i2 10 5 81 0.3
i2 24 5 81 0.3
i2 38 5 81 0.3
i2 12 5 82 0.3
i2 26 5 82 0.3
i2 40 5 82 0.3


</CsScore>
</CsoundSynthesizer>

