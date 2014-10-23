<CsoundSynthesizer>
<CsOptions>
-o ../../portfolio/ambient1_201410230012/ambient1_201410230012.wav -d
-B 4096
-b 4096
-3

</CsOptions>
<CsInstruments>
sr = 96000
ksmps = 1
nchnls = 2
0dbfs = 1

gisine ftgen 0, 0, 4096, 10, 1

gaL, gaR init 0
alwayson "reverb"

instr 1
icps = cpsmidinn(p4)
iamp = p5
a1 foscili iamp, icps, 1, 1, 1, gisine
aL = a1 * linsegr(0,0.001, 1, 2, 0, 0.05, 0)
aR = aL
outs aL, aR
gaL = aL
gaR = aR
endin

instr reverb
aL, aR reverbsc gaL, gaR, 0.93, 10000
outs aL, aR
clear gaL, gaR
endin

</CsInstruments>
<CsScore>
i 1 0 10 60 0.1
i 1 0.1 10 63 0.1
i 1 0.2 10 67 0.1
i 1 0.3 10 70 0.1
</CsScore>
</CsoundSynthesizer>
