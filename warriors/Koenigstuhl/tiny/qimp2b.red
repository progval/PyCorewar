;redcode-94x
;name qimp2b
;author David Houston
;strategy Bleh, I couldn't put it on the hill.
;assert CORESIZE==800
; [ QSCAN ]

     sne.x qf+592,   qf+656 ; scan
     seq.x qf+176,   qf+752
     djn.f @qlo+1,   @qlo+1
     sne.x qf+500,   qf+475
     seq.x qf+700,   }qf
     jmp   @qlo+1,   {qf
     sne.x qf+550,   qf+125
     jmz.f igo,      <qf

qf:  mul.x #300,     #625   ; decode
     jmz.f @qlo+1,   >qf

qlo: mov   {519,     >qf    ; attack
     mov   }qlo,     {qf
     seq   {qf,      >qf
     djn.f qlo,      >qf

igo: mov imp, *2
mov imp, *2
spl 200
jmp 600
imp: mov.i #1, 1
