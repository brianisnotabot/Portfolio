<CsoundSynthesizer>
<CsOptions>
-d -o /home/brian/storage/portfolio/Mince/Mince_20141027_1928/Mince_20141027_1928.wav
-B 4096
</CsOptions>
<CsInstruments>

sr	=	44100
ksmps	=	10
nchnls	=	2
0dbfs	=	1


seed 30761
gitempo = 140
instr 1	
Sname = p5
iwav ftgentmp 0, 0, 0, 1, Sname, 0, 0, 1
ilen = nsamp(iwav)/ftsr(iwav)
irand ftgentmp 0, 0, -20, -41, 1, 0.6, 2, 0.305, 4, 0.05
print ilen
;atime = linseg(0, p3, ilen * 0.5)
;ispeed = ftsr(iwav)
;atime =  randomh(0, ilen, 1/(p6 * (60/gitempo))) + phasor(1/ilen) * ilen * 0.5 
idur = p6 * (60 / gitempo)
istart = random(0, ilen - idur * 2)
kclock metro 1/idur
krnd duserrnd irand
;krnd = urd(irand)
kdiv samphold krnd, kclock
kdur = idur / kdiv
isr = ftsr(iwav)
;ilen = nsamp(iwav)/isr
klen = kdur
atime = istart * isr + phasor(1/klen) * kdur * isr
a1 tablei atime, iwav 
a1 *= randomh(0.1, 1, 1/klen)
aL, aR pan2 a1, randomh(0.3, 0.7, 1/klen)
;a1 lposcil 0.5, 1, istart * isr ,istart * isr + idur * isr, iwav
;a1 mincer atime, p4, ispeed, iwav, 0
outs aL, aR
endin

</CsInstruments>
<CsScore>

t 0 140
i1 0 16 0.2 "/home/brian/storage/res/samples/kitchensink/angel_scream.wav" 0.5
i1 0 16 0.2 "/home/brian/storage/res/samples/kitchensink/angel_scream.wav" 0.5
i1 0 16 0.2 "/home/brian/storage/res/samples/kitchensink/5thdimension_rainmaker1.wav" 2
i1 0 16 0.2 "/home/brian/storage/res/samples/kitchensink/5thdimension_rainmaker1.wav" 0.25


</CsScore>
</CsoundSynthesizer>
