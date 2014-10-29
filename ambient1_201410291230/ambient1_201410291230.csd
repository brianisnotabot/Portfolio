<CsoundSynthesizer>
<CsOptions>
-o /home/brian/storage/portfolio/ambient1_201410291230/ambient1_201410291230.wav -d
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
t 0 70
i"Mixer" 0 30
i 1 0 5 65 0.1
i 1 0.5 5 68 0.1
i 1 1.5 5 77 0.1
i 1 2.5 5 72 0.1
i 1 3 5 65 0.1
i 1 4 5 75 0.1
i 1 5 5 68 0.1
i 1 6 5 72 0.1
i 1 7 5 68 0.1
i 1 8 5 65 0.1
i 1 9 5 75 0.1
i 1 9.5 5 65 0.1
i 1 10 5 75 0.1
i 1 11 5 68 0.1
i 1 12 5 75 0.1
i 1 13 5 72 0.1
i 1 14 5 79 0.1
i 1 14.5 5 75 0.1
i 1 16.5 5 65 0.1
i 1 17 5 75 0.1
i 1 17.5 5 77 0.1
i 1 18 5 75 0.1
i 1 19 5 79 0.1
i 1 21 5 68 0.1
i 1 21.5 5 72 0.1
i 1 23.5 5 75 0.1
i 1 24 5 65 0.1
i 1 26 5 77 0.1
i 1 28 5 65 0.1
i 1 0 5 48 0.2
i 1 3 5 53 0.2
i 1 7 5 48 0.2
i 1 11 5 53 0.2
i 1 15 5 48 0.2
i 1 18 5 53 0.2
i 1 21 5 48 0.2
i 1 25 5 53 0.2
i 1 29 5 48 0.2
</CsScore>
</CsoundSynthesizer>
