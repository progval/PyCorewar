;redcode-94nop
;name Leap in the Dark
;author Christian Schmidt
;strategy my first attempt to rediscover
;strategy a forgotten strategy for 94nop
;assert 1
;optimax clr

sOff    equ  3507
sStep   equ  1605

sGo     add.f  sTab,     sLook
        sne    *sLook,   @sLook
        add.f  sTab,     sLook
sLook   sne    sOff+10,  sOff
        djn.f  sGo,      <6431
	add.ab #-15,     sLook
        mov    <burger,  <sLook
        mov    <burger,  <sLook
        mov    <burger,  <sLook
        djn    -3,       #3
        add.ab #5,       sLook
        spl    @sLook
        mov    burger+1, sLook
sTab    dat    #sStep,   <sStep

    for 50
        dat    0,        0
    rof

gate    dat    4009,     18
jumper  jmp    4009,     18
        dat    0,        0
        dat    0,        0
        jmp    -400,     <2667
clear   spl    #4600,    18
        mov    @switch,  >gate
        mov    jumper,   }gate
switch  djn    clear+1,  {clear

burger  dat    0,        0

end

