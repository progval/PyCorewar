;redcode-94x
;name ivscan6
;author J.Layland

;strategy Try to beat everything I know that Jay has ever written...
;strategy Leprechaun-style bomb/scan
;strategy If scanner finds:
;strategy       MOV #xx, yy  --> spiral stun and clear
;strategy       DAT  xx, yy  --> return to bomb/scan
;strategy       anything else -> assume fang, run anti-vamp paper
;strategy Try to defeat imps, vamps, and (perhaps) non-carpet
;strategy       bombing scanners.
;strategy Lose to bombers, carpet scanners?.
;strategy Probably lose to replicators (although paper would get a lot
;strategy       of ties-- maybe score like 0-10-90?)
;assert CORESIZE==55440

;macro

; Jay has 5 big-hill programs that I have seen:
; 1) Virus-- simple vampire
; 2) Scanalyzer-- scanning vampire
; 3) Variation xx-- stone/spiral (this is big.red from round 1)
; 4) Splash-- stone/spiral with 2-pass clear
; 5) Sissy-- combination of 2 and 3

; This program should easily beat Scanalyzer (bomber beats scanner)
;    although I might lose to a carpet bombing scanner like Rave, which
;    could find the unused anti-imp routines and kill the bomber.
; The imp-scanner can take out a simple stone/spiral like Variation or Splash
; Imp-scanner should also defeat Sissy.  My tests against the posted
;    version won 5 out of 5 battles.  But some were close.
; Anti-vamp paper should beat Virus.

; Hopefully the biggest bugs are gone now...

        org     loop

step    equ     13

scan    equ     27725   ; If I bomb myself, I'm probably dead anyway


impsize mov.i   <loc, #0
stun    mov     split, @loc
        add     impsize, loc
        djn     stun,   #1000

split   spl     #0,     <-59
        mov     gate, <-50
        jmp     -1, <-61


for 30
        dat 0,0
rof

gate    dat     <-60, <-61
imp     mov.i   #0, 0

for 30
        dat 0,0
rof

;bombing routine

kill    mov     b1, @loc
loop    add     #step, target
        mov     b1, @target
target  jmz.f   loop, @224

; scan routine
                ; if target contains "x" we want to look at target+x+scan
loc     equ     target+scan

        mov     target, loc
                ; target+scan points at target+scan+x
;xx break
        sub     @loc,   @loc
        sne     @loc, core      ; ignore incs/decs
        jmp     kill
        sne     @loc,   imp
        jmp     impsize
        jmp     launch          ; assume it's a fang

        dat 0,0
        dat 0,0
core    dat 0,0

for 40
        dat 0,0
rof

launch  spl     1               ; anti-vamp paper
        spl     1
        spl     1

paper   mov     #8, 0
copy    mov     <-1, <ptr       ; make copy
ptr     spl     @0, 6301        ;start new copy
        sub     @avamp,<avamp   ; subtract pointers going backwards
avamp   mov     b1,>100 ; now bomb forward to kill jump
        mov     b1,>avamp
        jmz     paper, paper
b1      dat     <34117, <scan   ; might take out an imp if I'm (very) lucky


