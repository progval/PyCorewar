;redcode
;name Stasis
;author David Moore
;strategy b-field scanner version 3
;assert CORESIZE==8000

ival equ 652
gate equ -15

cc     dat       < gate,      < gate
jb     jmn           -1,          #0
scan   mov         stun, < (targ+ival+1)
main   add    #(ival+1),       @safe
start  jmz         main,       <scan
safe   mov           jb,       @scan
targ   jmz         scan,       @scan
stun   spl            0, < (clear+gate)
clear  mov           cc,       <targ
       djn        clear,       <3970

end start
