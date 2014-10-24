<CsoundSynthesizer>
<CsOptions>
-o /home/brian/storage/portfolio/ambient1_201410242022/ambient1_201410242022.wav -d
-B 4096
-b 4096 -3
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

gisine ftgen 0, 0, 4096, 10, 1

gaL, gaR init 0
gaMasterL init 0
gaMasterR init 0
alwayson "reverb"

instr 1
icps = cpsmidinn(p4)
iamp = p5
a1 foscili iamp, icps, 1, 1, 1, gisine
aL = a1 * linsegr(0,0.001, 1, 2, 0, 0.05, 0)
aR = aL
gaMasterL = gaMasterL + aL
gaMasterR = gaMasterR + aR
gaL = gaL + aL * 0.1
gaR = gaR + aR * 0.1
if(p4 > 48) then
event_i "i", 2, 2, p3 * 1.5, p4, p5 * 0.4
endif
endin

instr 2
icps = cpsmidinn(p4)
iamp = p5
;a1 foscili iamp, icps, 2, 3, 1, gisine
a1 = moogvcf(vco2(iamp, icps, 2, 0.5 + lfo(0.2, 0.1)), linseg(300, 4, 1000), 0.1)
aL = a1 * linsegr(0, 0.5, 1, 3, 0)
aR = aL
gaMasterL = gaMasterL + aL
gaMasterR = gaMasterR + aR
gaL = gaL + aL * 0.3
gaR = gaR + aR * 0.3
endin

instr reverb
aL, aR reverbsc gaL, gaR, 0.93, 10000
gaMasterL = gaMasterL + aL
gaMasterR = gaMasterR + aR
clear gaL, gaR
endin

instr Mixer
aL = gaMasterL
aR = gaMasterR
afade linsegr 1, 10, 0
outs aL * afade, aR * afade
clear gaMasterL, gaMasterR 
endin

</CsInstruments>
<CsScore>
t 0 66
i"Mixer" 0 30
i 1 0 5 79 0.1
i 1 0.5 5 70 0.1
i 1 1.5 5 79 0.1
i 1 3.5 5 68 0.1
i 1 4 5 75 0.1
i 1 4.5 5 70 0.1
i 1 5 5 75 0.1
i 1 5.5 5 79 0.1
i 1 6 5 70 0.1
i 1 8 5 79 0.1
i 1 8.5 5 68 0.1
i 1 10.5 5 80 0.1
i 1 11.5 5 68 0.1
i 1 12.5 5 80 0.1
i 1 14.5 5 68 0.1
i 1 15 5 80 0.1
i 1 16 5 68 0.1
i 1 18 5 80 0.1
i 1 18.5 5 68 0.1
i 1 19.5 5 79 0.1
i 1 20 5 68 0.1
i 1 21 5 70 0.1
i 1 22 5 80 0.1
i 1 24 5 68 0.1
i 1 26 5 80 0.1
i 1 26.5 5 75 0.1
i 1 27.5 5 80 0.1
i 1 28.5 5 79 0.1
i 1 0 5 56 0.2
i 1 4 5 51 0.2
i 1 8 5 56 0.2
i 1 11 5 51 0.2
i 1 14 5 56 0.2
i 1 18 5 44 0.2
i 1 22 5 51 0.2
i 1 25 5 56 0.2
i 1 29 5 51 0.2
</CsScore>
</CsoundSynthesizer>
