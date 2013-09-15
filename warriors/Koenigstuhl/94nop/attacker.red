;redcode-94nop
;name Attacker in the Darkness
;author Christian Schmidt
;strategy bomb -> dodge -> clear
;strategy sequential running strategy
;assert 1

sOff1   equ    4208
sOff2   equ    4064
sStep1  equ    3003
sStep2  equ    105

        add.f  sTab,     sScan 
sScan   mov.i  }sOff1,   sOff2 
        jmz.f  -2,       {sScan
	sub.a  #15,      sScan
        mov.i  <sRef,    {sScan
        djn    -1,       #9
        add.a  #5,       sScan
sRef    jmp    *sScan,   switch+1

    for 5
        dat    0,        0
    rof

sTab    dat    #sStep1,  <sStep2

    for 68
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

end sScan

