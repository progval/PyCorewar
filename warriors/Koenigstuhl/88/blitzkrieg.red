;redcode
;name Blitzkrieg
;author Mike Nonemacher
;strategy Quick-CMP -> stone -> SPL/DAT coreclear -> gate
;strategy Just fixed a really stupid bug that made me hit myself...
;assert CORESIZE==8000
 
;Blitzkrieg is loosely based on W. Mintardjo's Fire Storm.  The main element
;is a 3-line bomber.  It bombs & decrements at mod-4 (decrement, 3 untouched,
;bomb, 3 untouched...), at 66% of c.  After a short bombing session, just
;enough to bomb or decrement every 4 locations, it turns itself into a two
;pass coreclear.  I also added a Quick-CMP similar to QuickFreeze, but it
;bombs with SPL/JMPs.  This helps to stall slow-booting imp-spirals, like
;Imprimis 7 (Nimbus-style launch for the 7-point spiral), but against quick-
;booting imp-spirals, like Night Crawler, expect 60-70% losses.  Also, Fire 
;Storm spent a little too much time bombing before the coreclear, so it lost 
;a few more to replicators before it started the coreclear.  As an interesting
;note, Blitzkrieg does very well against Winter Werewolf 3, because of a
;sort-of 'reverse mirror'.  Blitzkrieg's quick-scan CMPs x with x+4000, and
;if they're different, makes note of where it was.  But it doesn't know if
;there was anything at x or x+4000, so it bombs both with SPL/JMPs.  Against
;WW3, I find the decoy, and bomb the decoy and the decoy+4000.  Since WW3
;bootstraps itself exactly 4000 away, I often stun it before there's any
;chance of being bombed by it.
 
BOOT    EQU     3415                    ;Just picked this one at random
C       EQU     168                     ;bombing increment - small, mod-8
GVAL    EQU     -18                     ;decrement for gate
INCR    EQU     20                      ;offset of inc from stone
CMP1    EQU     ((start-2)*50+CMPST)
CMP2    EQU     (CMP1+4000)
MOV1    EQU     ((start-1)*50+CMPST-BPTR+67)
BPTR    EQU     bptr1
CMPST   EQU     (start+31)              ;mis-aligns SPL 0s & stone's bombs
 
start   cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;5
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;10
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;15
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;20
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;25
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;30
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;35
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR
        cmp     CMP1,   CMP2
        mov     #MOV1,  BPTR    ;39
bptr1   jmz     top,    #0
        mov     jump,   <bptr1
        mov     split,  <bptr1
        sub     #4002,  @-1
        djn     -3,     #35
top     mov     stone+4,        BOOT    ;bootstrap
        mov     stone+3,        <top
        mov     stone+2,        <top
        mov     stone+1,        <top
        mov     stone,  <top
        mov     inc,    top+BOOT-4+INCR
        mov     gate,   top+BOOT-4+1+GVAL
        mov     split,  top+BOOT-4-19
        spl     @top,   #0
        mov     inc,    <-1
        djn     -1,     #9
inc     dat     #C,     #-C
split   spl     0,      <GVAL
stone   sub     stone+INCR,     1
        mov     <-19,   1
        jmp     -2,     <-2000
        mov     @-2,    <stone+INCR
jump    jmp     -1,     <GVAL-2
gate    dat     <GVAL-1,        #0
END     start
