;redcode-94x
;name Digital Swarm
;author John Metcalf
;strategy TinyQ^4 -> Paper
;strategy 11 scans, shorter decoder, intelligent attack
;assert CORESIZE==800

; [ QSCAN ]

     sne.x qf+592,   qf+656 ; scan
     seq.x qf+176,   qf+752
     djn.f @qlo+1,   @qlo+1
     sne.x qf+500,   qf+475
     seq.x qf+700,   }qf
     jmp   @qlo+1,   {qf
     sne.x qf+550,   qf+125
     jmz.f pgo,      <qf

qf:  mul.x #300,     #625   ; decode
     jmz.f @qlo+1,   >qf

qlo: mov   {519,     >qf    ; attack
     mov   }qlo,     {qf
     seq   {qf,      >qf
     djn.f qlo,      >qf

; [ PAPER ]

     s1 equ 104
     s2 equ 60

pgo: spl   1,        {0     ; these two lines become
     spl   *2,       {0     ; invisible to f-scans

pap1:spl   @0,       <s1
     mov   }pap1,    >pap1
     mov   {pap1,    <pap2
pap2:djn.f *s2-3,    >s2

     end
