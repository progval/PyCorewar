;redcode-tiny
;name Evasion
;author Christian Schmidt
;strategy paper dodger
;assert CORESIZE==800

;optimax 1234
;optimax work tinystep4
;optimax rounds 1 200 250 250
;optimax suite fshtiny0.1

;optimax phase2 fshtiny0.1/clr/whitenoise.red
;optimax phase2 170

;optimax phase3 top25
;optimax phase3 clr
;optimax phase3 165

;optimax phase4 top25
;optimax phase4 100%

sOff    equ  371
sStep   equ  164

sGo   add.f  sTab,     sLook
      sne    *sLook,   @sLook
      add.f  sTab,     sLook
sLook sne    sOff+10,  sOff
      djn.f  sGo,      <574
      sub    #21, sLook
      mov    <bptr,    <sLook
      djn    -1,       #5
bptr  spl    @sLook,   bot+1
      mov    <bptr,    <sLook
      mov    <bptr,    <sLook
sTab  dat    #sStep,   <sStep
      dat    0,        0
gate  dat    204,      }24
      dat    >587,     {13
clr   spl    #587,     13
      mov    @3,       >gate
      mov    @2,       >gate
      mov    @1,       >gate
bot   djn.f  -3,       {clr

end sGo+1

