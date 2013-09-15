;redcode
;name unheard-of '88
;author Christian Schmidt
;strategy qscanner, silk-dwarf, silk-imps
;assert CORESIZE==8000

;optimax 1234
;optimax work u88-1
;optimax rounds 1 100 200 200
;optimax suite fsh88

;optimax phase2 fsh88/clr/vm5.red
;optimax phase2 110

;optimax phase3 top20
;optimax phase3 clr:scn:cds
;optimax phase3 100

;optimax phase4 top20
;optimax phase4 100%

pStep1 equ 7398
pStep2 equ 1630 
pStep3 equ 5972

length equ 8

step   equ 107
first  equ (-115-1)
hop    equ (6916+1)
gate   equ (hop+m-1)
eImp   equ 1143

;------boot---------------------------------

boot   spl 1            , pap2+length+pStep2
       spl 1            , pap1+length+pStep1
       spl 1            , pap1+length
eMag   spl boot2        , pap2+length

;------paper-stone--------------------------

       mov <-2          , <-3

pap1   spl pStep1       , length+(pStep1*2)
       mov <pap1+length+pStep1, <pap1
stone	 spl 0            , <gate
ptr	 mov bomb         , <first	  
m	 mov bomb         , @ptr
	 sub #step        , ptr
	 djn ptr          , <5226 ;5500
bomb	 dat <1           , #hop

;------paper-imp----------------------------

boot2  mov <eMag        , <boot

pap2   spl pStep2       , length+(pStep2*2)
       mov <pap2+length+pStep2, <pap2
       mov <length      , <1
       spl @0           , pStep3
       spl 0            , <2260 ;0
       add #eImp        , 1
       jmp @0           , -eImp
       mov 0            , eImp

   for 40 
       dat   #0,       #0 
   rof 

qs    equ 322
qd    equ 161

qscan cmp 2*qs+qd       , 2*qs
qt1   jmp qa0           , <3*qs
      cmp qscan+5*qs+qd , qscan+5*qs
qt2   jmp qa1           , <4*qs
      cmp qscan+4*qs+qd , qscan+4*qs
qs1   djn qa1           , #qt1
      cmp qscan+10*qs-2 , qscan+10*qs+qd-2
qs2   djn qa2           , #qt2
      cmp qscan+9*qs+qd , qscan+9*qs
qt3   jmp qa2           , <6*qs
      cmp qscan+6*qs+qd , qscan+6*qs
      jmp qa2           , <qa1
      cmp qscan+8*qs+qd , qscan+8*qs
      jmp qa2           , <qs1
      cmp qscan+11*qs   , qscan+11*qs+qd
      jmp qa3           , <qa2
      cmp qscan+18*qs-8 , qscan+18*qs+qd-8
qs3   djn qa3           , #qt3
      cmp qscan+16*qs-2 , qscan+16*qs+qd-2
      jmp qa3           , <qs2
      cmp qscan+12*qs   , qscan+12*qs+qd
      jmp qa3           , <qa1
      cmp qscan+14*qs   , qscan+14*qs+qd
      jmp qa3           , <qs1
      jmz boot          , qscan+15*qs

qa3   add @qs3          , qp
qa2   add @qs2          , @qa3
qa1   add @qs1          , @qa3
qa0   cmp @qp           , <1234
      cmp @0            , 0
      add #qd           , qp
ql    mov qb            , @qp
qp    mov <2345         , <qscan+2*qs
      sub #9            , @ql
      djn ql            , #6
qb    jmp boot          , <43

      end qscan

