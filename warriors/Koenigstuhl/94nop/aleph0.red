;redcode-94
;name Aleph 0
;author Jay Han
;macro
;assert 1

                org     entry

; These are the parameters for the quick-scan.  The quick-scan scans
; every q locations by groups of 4 (SNE/SEQ).  With this setup, q is
; 86.

j               equ     6
n               equ     22
s               equ     (((CORESIZE-(2*MINDISTANCE)-MAXLENGTH)*4)/((4*n)+1))
q               equ     (s/4)
h               equ     (q/2)
a               equ     (head-MINDISTANCE)
l               equ     ((2*q)+MAXLENGTH)
k               equ     (l/j+1)
d               equ     1000

head

; Here's the code for testing where in the group of four locations
; the enemy lies.

test            seq.i   @-1,            @0
                add.ab  #2*q,           @-1
                add.b   test,           bite
                add.b   @test,          bite
; At this point, bite.B points to the start of the bombing zone.
; First, transport the pit there
                mov.i   pit,            >bite
                mov.i   mega,           >bite
; Then vampirize, moving backward
stun            mov.i   bite,           @bite
                add.f   vamp,           bite
                djn.b   stun,           #k

; Now copy the core-clear to the end of the bombing zone
copy            mov.i   >ptr1,          <bite
                djn.b   copy,           #4
ptr1            jmp.b   @bite,          bomb

; This is a suicidal core-clear (for the enemy)
pit             spl.b   #s2,            s1
mega            mov.i   2,              >-1

; This is for the imp-launch
adder           add.a   #step,          jumper

; This is my own core-clear/gate, reversed for technical reasons
; (namely, have the DAT to kill off imp-launch processes above)
bomb            dat.f   <-j-2,          <-j-1
                jmp.b   -1,             <-j-2
                mov.i   2,              <-j+1
vamp            spl.b   #j,             <-j

; This is the fang
bite            jmp.b   -2,             #test

; Stone, if nothing is found, this is activated.
; It's a self-destructing stone
p2              equ     -73+(972*s2)
s2              equ     -74
p1              equ     75+(972*s1)
s1              equ     74

cast            mov.i   <p1,            p2
stone           spl.b   cast,           <pit
                add.x   pit,            cast
                djn.f   stone,          <test

imp             mov.i   0,              step

; Here's the quickscan
entry
m for 22
                sne.i   a-(m*s),        a-(m*s)+(2*q)
                seq.i   a-(m*s)+q,      a-(m*s)+(3*q)
                sub.x   #test+2,        @test
rof

; If something is found, go to test (and bombing)
; If not, then start stone
                jmn.b   test,           test
                spl.b   stone

; The usual imp-launcher
step            equ     2667
launch
                spl     1
                spl     1
                mov.i   -1,             0
                spl     adder
jumper          jmp     imp

                end
