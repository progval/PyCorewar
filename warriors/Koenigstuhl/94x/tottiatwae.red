;redcode-94
;name TottiatwaE
;author John K W
;assert CORESIZE == 55440
;strategy "The only thing that is able to win against Evolve4X"
;strategy (but can't win against much else. :)
;strategy Basically I made a sort of two-pass coreclear which scans
;strategy for imps, finds their stepsize, then finds their tail, and
;strategy then proceeds to completely wipe them, no matter their
;strategy length or step.  Then I added hescans on to the front for
;strategy a quick pre-stun.
;strategy As far as I can tell, it's completely impossible for
;strategy an imp to survive this program, if it remains intact for
;strategy the length of the battle.  Unfortunately, it's big so it
;strategy dies a lot against everything.
;strategy Oh, and you may be wondering if this kills mirrored imps?
;strategy Well it does, and it's a little strange to see how.  Even
;strategy 200+ process mirrored imps die, because when every other
;strategy instruction gets destroyed, half the mirror is gone, and
;strategy so half the imp dies.  Then the other half isn't an imp
;strategy anymore.

org tScan+1

impsize equ cPtr+3

tPtr    dat     100 ,55440/2+100-4             ; widely-spaced pointers
        dat     0,0
        dat     0,0
        dat     0,0
cPtr    dat     1,100   ; the a-field needs to be non-zero so we can start 
;                         clear from (scans+1)
        dat     0,0
        dat     0,0
        dat     0,0
        dat     0,0
tWipe   mov    tSpl     ,<tPtr         ; positive wipe of opponent
        mov    >tPtr    ,>tPtr
        jmn.f  tWipe    ,>tPtr
tScan   sub.f  #-12,     tPtr          ; increment and look
        sne    *tPtr,    @tPtr
        sub.f  tScan,    @tScan        ; increment and look
        jmn.f  tSelf,    @tPtr
        jmz.f  tScan,    *tPtr
pScan   mov.x  @tScan,   @tScan        ; swap pointers for attack
tSelf   slt.b  @tScan,   #tEnd+4-tPtr  ; self-check
        djn    tWipe,    @tScan        ;   go to attack
        djn    *pScan,   #9          ; after 9 self-scans

test    mov.f   @cPtr, impsize  ; copy the imp in so we can test it's stepsize
        jmn.b   bombimp, impsize ; if b-field is 0, stepsize is in a-field
        mov.x   impsize, impsize
bombimp mov     cPtr,   cPtr+1  ; backup our scan point position so we can
restore it later
        sub.b   impsize, cPtr+1
        jmn.f   -1,     @cPtr+1 ; find tail
stun    mov     tSpl,   @cPtr+1
        add.b   impsize, cPtr+1
        jmn.f   stun,   @cPtr+1 ; destroy imp until we get to head

        mov     tSpl,   >cPtr
scans   jmz.f   -1,     @cPtr   ; main scan loop
        jmn     test,   cPtr
        mov     clr,    >cPtr   ; once we've hit cptr, start dat clear
        jmp     -1,     {cPtr
tSpl    spl     #0,0
clr     dat     0,1-tPtr
tEnd    dat     0,0
last:   dat     0,0

for 61
        dat     0,0
      rof
          
end
