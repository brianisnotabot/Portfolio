<CsoundSynthesizer>
<CsOptions>
-o /home/brian/storage/portfolio/ambient1_201410251230/ambient1_201410251230.wav -d
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
iamp = p5
icps_1 = cpsmidinn(p4) * 0.5
a1 pluck iamp, icps_1, icps_1, 0, 6
a1 = butlp(a1, 2000)

icps_2 = cpsmidinn(p4 + 0.01) * 0.5
a2 pluck iamp, icps_2, icps_2, 0, 6
a2 = butlp(a2, 3000)

icps_3 = cpsmidinn(p4 - 0.01) * 0.5
a3 pluck iamp, icps_3, icps_3, 0, 6
a3 = butlp(a3, 4000)

aout sum a1, a2, a3
aL = aout * linsegr(0.8, 1, 0) * linseg(0, 0.015, 1)
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
;an FM instrument adapted from "Xanadu" by Joeseph T. Kung
isin ftgenonce 0, 0, 4096, 10, 1      
icos ftgenonce 0, 0, 4096, 11, 1
ipal ftgenonce 0, 0, 4096, -12, 20
ishift      =           .00666667               
ipch        =           cpsmidinn(p4)          
ioct        =           octmidinn(p4)         
iamp        =           p5 * 0.3
aadsr       linsegr     0, p3/3, 1.0, p3/3, 1.0, p3/3, 0 
amodi       linseg      0, p3/3, 5, p3/3, 3, p3/3, 0 
amodr       linseg      1.7, p3, 0.5             
a1          =           amodi*(amodr-1/amodr)/2
a1ndx       =           abs(a1*2/20)            
a2          =           amodi*(amodr+1/amodr)/2
a3          tablei      a1ndx, ipal, isin      
ao1         oscili      a1, ipch, icos        
a4          =           exp(-0.5*a3+ao1)
ao2         oscili      a2*ipch, ipch, icos  
aL          oscili      iamp * aadsr*a4, ao2+cpsoct(ioct+ishift), isin 
aR          oscili      iamp * aadsr*a4, ao2+cpsoct(ioct-ishift), isin
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
t 0 79
i"Mixer" 0 30
i 1 0 5 65 0.1
i 1 1 5 75 0.1
i 1 3 5 72 0.1
i 1 3.5 5 65 0.1
i 1 4 5 72 0.1
i 1 6 5 68 0.1
i 1 6.5 5 75 0.1
i 1 7.5 5 77 0.1
i 1 8.5 5 72 0.1
i 1 9 5 79 0.1
i 1 10 5 65 0.1
i 1 12 5 79 0.1
i 1 12.5 5 77 0.1
i 1 13 5 68 0.1
i 1 13.5 5 65 0.1
i 1 14.5 5 72 0.1
i 1 15 5 77 0.1
i 1 16 5 75 0.1
i 1 16.5 5 68 0.1
i 1 17 5 75 0.1
i 1 18 5 65 0.1
i 1 19 5 75 0.1
i 1 21 5 68 0.1
i 1 21.5 5 72 0.1
i 1 22.5 5 77 0.1
i 1 23 5 79 0.1
i 1 23.5 5 65 0.1
i 1 24.5 5 68 0.1
i 1 25.5 5 79 0.1
i 1 26 5 68 0.1
i 1 26.5 5 72 0.1
i 1 27.5 5 77 0.1
i 1 29.5 5 79 0.1
i 1 0 5 48 0.2
i 1 4 5 43 0.2
i 1 7 5 48 0.2
i 1 10 5 53 0.2
i 1 14 5 48 0.2
i 1 17 5 43 0.2
i 1 21 5 53 0.2
i 1 24 5 48 0.2
i 1 28 5 53 0.2
</CsScore>
</CsoundSynthesizer>
