;redcode
;name Vortex
;author Ilmari Karonen
;strategy get a lot of ties.. (heavy imp/stone)
;strategy  I'm not pushing the deadline quite as much
;strategy  as usual, but I'm tired. Oh well..
;planar boot, imp, bomber, stun, clear, gate
;assert CORESIZE == 8000

;> Just wanted to try out my new imp launch, but writing
;> a good stone to go with it wasn't as easy as I thought.
;> I think I might've been better off with a scanner, but
;> there's no time to change my mind at this point.

istep   equ     1143
psize   equ     8
step    equ     2924
disp    equ     (-214)  ; used as gate
first   equ     (steps+step)
decr    equ     (-1000)
cptr    equ     (stun-3)
saway   equ     2000
paway   equ     3152
istart  equ     1528

pto     dat     #0, #pto+paway+1
sto     dat     #0, #pto+saway+1

pfrom   spl     0, imp+1
        add     #istep, pump    ; hit by dat bomb
pump    jmp     @0, istart-(psize*istep)

imp     mov     0, istep

stun    spl     0, <disp        ; stun
loop    add     steps, kill
kill    mov     <decr, @first   ; miss!
        mov     stun, @kill
steps   jmp     loop, <step     ; stun to enter clear

clear   mov     cbmb, <cptr
        djn     clear, <cptr-2667       ; miss!
cbmb    dat     <2667, <disp-1  ; can use anti-3-point clear

decoy   z for (MAXLENGTH-CURLINE-11)
        spl     0, <100*z
        rof

sfrom   dat     #0, #cbmb+1

start   mov     <pfrom, pto+paway+istart
        mov     <pfrom, <pto
        spl     1, <99
        mov     <pfrom, <pto
        spl     1, <888
        spl     1, <7777
        mov     <sfrom, <sto
        spl     @sto, <666
        spl     @pto, <999
        mov     stun, <pfrom

        end     start
