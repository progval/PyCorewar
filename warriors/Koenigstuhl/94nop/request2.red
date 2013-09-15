;redcode-94 verbose
;name Request v2.0
;author Brant D. Thomsen
;contact bdthomse@peruvian.cs.utah.edu
;strategy '94 Vampire
;strategy The latest program in my "quest"
;strategy to yield less wins to anti-vampiric programs.
;strategy Submitted: @date@
;assert 1

step    equ     2211
init    equ     (vamp+2+step)

gate    equ     (wimp-15)
decoy   equ     (gate+1)

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

start   mov     jump, <dist

        sub     #jump-adder-1, dist

        mov     adder, <dist

        sub     #adder-pit-4, dist

        mov     pit+3, <dist
        mov     pit+2, <dist
        mov     pit+1, <dist
        mov     pit, <dist

        sub     #pit-vamp-4, dist

        mov     vamp+3, <dist
        mov     vamp+2, <dist
        mov     vamp+1, <dist
        mov     vamp, <dist
        spl     @dist, <2000    ; Start the vampire

;       sub     #vamp-help-2, dist

        mov     help+1, <dist
        mov     help, <dist
        spl     @dist, <3000    ; Send 2 processes to "help" so that will
        spl     @dist, <4000    ; execute "MOV" once cycle.

        sub     #help-wimp-1, dist

        mov     wimp, <dist
        spl     @dist, <5000

        sub     #3000, dist     ; Erase record of where boot-strapped.
dist    dat     #6570           ; Then kill the process.


        ; The following is the code for the program.
        ; Spacing (for DATs between segments) is computed automatically.

        ; Wimp is necessary so will still have a process when pit dies.
        ; Runs no risk of starvation since no SPL in it.

wimp    jmp     #0, <gate

        dat     #start*10, #1
        dat     #start*10, #1

pit     mov     @23, <gate-2
        spl     #0, <gate
        spl     -2, <gate
        spl     -2, <gate

        dat     #start*10, #1

adder   dat     <-step, <step

        dat     #start*10, #1

jump    jmp     @decoy-init, init

        dat     #start*10, #1
        dat     #start*10, #1
        dat     #start*10, #1

help    mov     #pit-decoy, decoy
        jmp     help, <gate

vamp    spl     #0, <gate
move    mov     @0, @jump
        add     adder, @move
        djn.F   -2, <-3001

        end     start
