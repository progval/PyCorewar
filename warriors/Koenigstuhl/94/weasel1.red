;redcode-b
;name Weasel (v1)
;author WFB
;strategy the original
;strategy P-spacer...combines Diamond in the Rough and
;strategy More Snotty CSnots.
;assert CORESIZE==8000
_RES    equ     #0
_STR    equ     #1    ;Not that obviously
step    equ 3044
start
res     ldp.ab  _RES,   #0
str     ldp.a   _STR,   str1    ;load strategy in use
        sne.ab  #0,     res     ;check result
lost    add.a   #1,     str1    ;lost change 
        mod.a   #2,     str1    ;secure result
win     stp.ab  str1,   _STR
str1    jmp     @0,     dstart
        dat     0,      csnots

for 69
dat }-2667,<2667
rof

dstart  spl #1234
diamond spl #-step,<step
rough   mov >-step,step+1
        add diamond,rough
        djn.f  rough,<diamond-50
        dat #0,#0
        dat #-7
csnots  spl 1,<-200
        mov -1,0
        spl 1,<-800
        mov -1,0
s1      spl @0,}1100 ;experimenting with values-original is 1100
        mov }-1,>-1
s2      spl @0,<2620 ;original is 2620
        mov }-1,>-1
s3      spl @0,{1870 ;original value is 1870
        mov }-1,>-1
        mov snot,<88 ;88
s4      mov {-3,<1
        spl @0,}-639 ;-639
        mov 2,<-4
        jmp -1,<-13
snot    dat <2667,<2667*2
end start
