;redcode-b
;name Weasel (v2)
;author WFB
;strategy P-spacer...combines Diamond in the Rough and
;strategy More Snotty CSnots.
;strategy changes by Ian Oversby:
;strategy Firstly, I boot the stone as otherwise we are easily found and
;strategy destroyed by one-shot scanners.  I changed the first spl line to
;strategy spl #0, #0 for invisibility to f-scans.
;strategy I notice the number of processes for the paper does not match the
;strategy number of lines.  Maybe removing the final launcher would not
;strategy matter too much either.  At the same time I add another mov line
;strategy to the first launcher and use the correct number of processes for
;strategy the number of lines in the paper.
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
str1    jmp     @0,     sboot
        dat     0,      csnots
for 40
        dat }-2667,<2667
rof

sdist   equ     2000
sboot   mov.i   {loc, <sptr
for 4
        mov.i   {loc, <sptr
rof
        mov.ab  #-7,    *sptr
        spl.b   @sptr,  <-700
sptr    div.f   #sdist, #sdist-1
        dat.f   }300,   >200
        
dstart  spl #0, #0
diamond spl #-step,<step
rough   mov >-step,step+1
        add diamond,rough
        djn.f  rough,<diamond-50
loc     dat #0,#0

csnots  spl 1,<-200
        spl 1,<-800
        spl 1,<-800
s1      spl @0,}1100 ;experimenting with values-original is 1100
        mov }-1,>-1
        mov }-2,>-2
s2      spl @0,<2620 ;original is 2620
        mov }-1,>-1
s3      spl @0,{1870 ;original value is 1870
        mov }-1,>-1
        mov snot,<88 ;88
        mov 2,<-4
        jmp -1,<-13
snot    dat <2667,<2667*2

end start

