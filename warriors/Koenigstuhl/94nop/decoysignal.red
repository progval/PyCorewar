;redcode-94nop
;name Decoy Signal
;author Ben Ford
;strategy q^4 -> silk, imps
;assert (CORESIZE==8000)

; ----- paper -----
pimp equ (2667)
plen equ (   8)
pend equ (pap1+plen)
pgo0 equ (4868+pend) ;  240 4868
pgo1 equ (1100)      ; 1880 1100
pgo2 equ (1373)      ; 2050 1373

boot  spl     $   1,  >  qC
qtb2  spl     $   1,  >  qD
      spl     $   1,  >  qE
      mov     <   1,  {   1
pap0  spl      pgo0,   pend

pap1  spl      pgo1,  $   0
      mov     >pap1,  }pap1
pap2  spl      pgo2,  $   0
      mov     >pap2,  }pap2
pap3  spl     @   0,  <pimp+1
      mov     }pap3,  >pap3
      mov.i   #pgo1*2,}-pgo1
      mov.i   #pgo2,   pimp

; ----- filler -----
for 59
     dat    $   0, $   0
rof

qbmb dat    {qoff, $  qF

; ----- q-scan decoder -----
qdec mul.b  *   2,  qptr
     sne    {qtb1, @qptr
     add.b   qtb2,  qptr

; ----- q-scan bomber -----
qinc equ (   7)
qclk equ (  13)
qoff equ (  60)

qloo mov     qbmb, @qptr
qptr mov     qbmb, }  qX
     sub    #qinc, @qloo
     djn     qloo, #qclk
     djn.f   boot, #   0

; ----- q-scan scan -----
qX   equ (6012)
qI   equ (7091) ; (qX-1)*qI == 1 mod 8000
qA   equ (((qX-1+(qtb1-1-qptr))*qI)%CORESIZE)
qB   equ (((qX-1+(qtb1-0-qptr))*qI)%CORESIZE)
qC   equ (((qX-1+(qtb2-1-qptr))*qI)%CORESIZE)
qD   equ (((qX-1+(qtb2-0-qptr))*qI)%CORESIZE)
qE   equ (((qX-1+(qtb2+1-qptr))*qI)%CORESIZE)
qF   equ (((qX-1+(qbmb-0-qptr))*qI)%CORESIZE)

qscn sne     qptr+qX*qE ,  qptr+qX*qE+qE
     seq    <qtb2+1     ,  qptr+qX*(qE-1)+(qE-1)
     jmp     qdec, }qdec+2
     sne     qptr+qX*qF ,  qptr+qX*qF+qD
     seq    <qbmb       ,  qptr+qX*(qF-1)+qD
     jmp     qdec, }qdec
     sne     qptr+qX*qA ,  qptr+qX*qA+qD
     seq    <qtb1-1     ,  qptr+qX*(qA-1)+qD
     djn.a   qdec, {qdec
     sne     qptr+qX*qB ,  qptr+qX*qB+qD
     seq    <qtb1       ,  qptr+qX*(qB-1)+qD
     jmp     qdec, {qdec
     sne     qptr+qX*qC ,  qptr+qX*qC+qC
     seq    <qtb2-1     ,  qptr+qX*(qC-1)+(qC-1)
     jmp     qdec, {qdec+2
     sne     qptr+qX*qD ,  qptr+qX*qD+qD
     seq    <qtb2       ,  qptr+qX*(qD-1)+(qD-1)
     jmp     qdec,    qA
qtb1 djn.f   boot, #  qB

end qscn

