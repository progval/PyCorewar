;redcode
;name '88 test IV
;author John Metcalf
;strategy oneshot / decoy
;strategy .5c scan .25c bomb -> clear
;assert CORESIZE==8000

st    equ  -11
fi    equ  (175*11-3993)
boot  equ  (go-fi-100)

kill    dat <2667,    <-11

clear   spl 0,        <kill-sptr-8
cloop   mov @sloop,   <sptr
        mov @sloop,   <sptr
bomb    djn cloop,    <kill-5

steps   dat <st*3,    <st*3+1

sloop   add steps,    @cloop
        mov kill,     <sptr
sptr    cmp fi+st*2,  @fi+1
        jmp <sloop
e       jmp sloop

go      mov e, boot+10
a       for 10
        mov kill+10-a,<go
        rof
        jmp boot+7

        dd for MAXLENGTH-CURLINE
        dat <go*47*((dd-1)%11),<1
        rof

        end go
