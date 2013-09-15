;redcode-94x
;contact bdthomse@peruvian.cs.utah.edu
;name Request-55440
;author Brant D. Thomsen
;strategy '94 Vampire
;strategy The latest program in my "quest"
;strategy to yield less wins to anti-vampiric programs.
;strategy Submitted: @date@
;assert CORESIZE==55440
;macro

step    equ     9719
init    equ     (pit+1+step)

gate    equ     (jump-12)
decoy   equ     (gate-1+step)

FOR 132
        dat     #start*10, #1   ; Provide a large decoy.
ROF

start   mov     jump, <dist

        sub     #jump-adder-1, dist

        mov     adder, <dist

        sub     #adder-pit-5, dist

        mov     pit+4, <dist
        mov     pit+3, <dist
        mov     pit+2, <dist
        mov     pit+1, <dist
        mov     pit, <dist

        sub     #pit-vamp-4, dist

        mov     vamp+3, <dist
        mov     vamp+2, <dist
        mov     vamp+1, <dist
        mov     vamp, <dist
        spl     @dist, <10000   ; Start the vampire

        sub     #vamp-help-2, dist

        mov     help+1, <dist
        mov     help, <dist
        spl     @dist, <20000   ; Send 2 processes to "help" so that will
        spl     @dist, <30000   ; execute "MOV" once cycle.

        sub     #help-wimp-1, dist

        mov     wimp, <dist
        spl     @dist, <40000

        sub     #10000, dist    ; Erase record of where boot-strapped.
dist    dat     #15501          ; Then kill the process.


        ; The following is the code for the program.
        ; Spacing (for DATs between segments) is computed automatically.

jump    jmp     @decoy-init, init

FOR 8
        dat     #start*10, #1
ROF

        ; Wimp is necessary so will still have a process when pit dies.
        ; Runs no risk of starvation since no SPL in it.

wimp    jmp     #0, <gate

FOR 3
        dat     #start*10, #1
ROF

pit     mov     @8, <gate-1
        spl     #0, <gate
        spl     -2, <gate
        spl     -2, <gate
        djn.F   pit, >adder-2

FOR 9
        dat     #start*10, #1
ROF

help    mov     #pit-decoy, decoy
        jmp     help, <gate

FOR 6
        dat     #start*10, #1
ROF

adder   dat     <-step, <step

FOR 3
        dat     #start*10, #1
ROF

vamp    spl     #0, <gate
move    mov     @0, @jump
        add     adder, @move
        djn.F   -2, <-step

        end     start
