;redcode-tiny
;name Purple Paper
;author Christian Schmidt
;strategy qscanner -> paper
;assert 1

;optimax 123
;optimax work t-moore
;optimax rounds 1 200 200 200
;optimax suite fshtiny0.1

;optimax phase2 fshtiny0.1/clr/whitenoise.red
;optimax phase2 80%

;optimax phase3 top25
;optimax phase3 clr:pap

pStep1  equ   51
pStep2  equ   361
pAwa    equ   423

     qa equ 240
     qb equ 421
     qf equ qta

     sne   qf-2*(qa-1)*(qb),qf+(qa-1)*(qb)
     seq   qf-2*(qa)*(qb),  }qta
     jmp   qta,             {qta
     jmz.f pGo,             <qta

qta: mul.x #qa,      #qb
     sne   >507,    @qta ;-242
     mul.f #-2,      qta

qlo: mov   >245,     }qta
     mov   }qlo,     <qta
     djn   qlo,      #15

pGo   spl   0,        }0
      spl   1,        }707
      mov.i <1,       {1
      jmp   pGo+pAwa, pDat+1

pNext spl   pStep1,   {pThis
      mov   }pThis,   }pNext
      mov   pDat,     >pStep2
pThis mov   pNext+6,  }pNext
      jmz.f pNext,    *pThis
pDat  dat   >1,       <1

