;redcode-tiny
;name Sidestep
;author Christian Schmidt
;strategy dodger
;assert CORESIZE==800

sOff    equ  737
sStep   equ  770

burger  equ  (bptr+1)

sGo   add.f  sTab,     sLook
      sne    *sLook,   @sLook
      add.f  sTab,     sLook
sLook sne    sOff+10,  sOff
      djn.f  sGo,      <194
      sub    #19,      sLook
      mov    <burger,  <sLook
      mov    <burger,  <sLook
      mov    <burger,  <sLook
      mov    <burger,  <sLook
      spl    @sLook,   <129
      mov    <burger,  <sLook
      mov    <burger,  <sLook

sTab  dat    #sStep,   <sStep

ptr   dat    0,        7
      dat    1,        11
sbmb  spl    #762,     13
wipe  mov    @bptr,    >ptr
      mov    @bptr,    >ptr
bptr  djn.f  wipe,     {sbmb

end sGo+1

