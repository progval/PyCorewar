;redcode-b
;name Weasel (v3)
;author WFB
;strategy P-spacer...combines Diamond in the Rough and More Snotty 
;strategy CSnots.
;strategy more changes by Ian Oversby:
;strategy To kill scanners, we should run the stone more often but
;strategy then we are vulnerable to papers.  How about adding an imp to
;strategy the stone.  As it has a double spl we aren't slowed too much
;strategy and now we have resistance to papers and other stones.  In
;strategy addition, maybe the other scanners do not have much imp
;strategy resistance and we can improve our score against them.
;strategy I took the imp out of Juliet Storm and tacked it on the end.
;strategy I also changed the decoy to dat 1,1 to slow djn streams and
;strategy moved our own djn stream a little further back to decoy the
;strategy enemy one-shots better.  I run the imp/stone twice as often
;strategy as the paper although subsequent tests showed this was not as
;strategy much improvement as I expected.
;assert CORESIZE==8000

_RES    equ     #0
_STR    equ     #121    ;Not that obviously
step    equ 3044
start
res     ldp.ab  _RES,   #0
str     ldp.a   _STR,   str1    ;load strategy in use
        sne.ab  #0,     res     ;check result
lost    add.a   #1,     str1    ;lost change 
        mod.a   #2,     str1    ;secure result
win     stp.ab  str1,   _STR
str1    jmp     @0,     sboot
        dat     0,      sboot
        dat     0,      csnots

for 17
        dat.f   #1,     @1
        dat.f   #1,     *1
        dat.f   #1,     #1
rof
        dat.f   #1,     @1

sdist   equ     4620
sboot   mov.i   {loc, <sptr
for 4
        mov.i   {loc, <sptr
rof
        mov.ab  #-7,    *sptr
        spl.b   impboot,        <-707
        spl.b   @sptr,  <-700
sptr    div.f   #sdist, #sdist-1
        dat.f   }300,   >200
        
dstart  spl #0, #0
diamond spl #-step,<step
rough   mov >-step,step+1
        add diamond,rough
        djn.f  rough,<diamond-1051
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

imp_sz  equ     2667

impboot spl     1      ,<-450
        spl     1      ,<-458
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #imp_sz, *0

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp

end start

