;redcode-94
;name Sneaky 2d
;author Ilmari Karonen
;strategy Use known copy distances to tune a scanner
;strategy with a P-switcher.
;strategy Oh well, the idea was good but I didn't have
;strategy time to optimize all those constants. Nor the
;strategy switching table. At least it's better than
;strategy just a d-clear. =)
;assert CORESIZE == 8000
;planar pspace, boot, scan, stun, clear, gate

; I really shouldn't leave these things until the last minute.

        org     think

away    equ     (scan-1000)
ptr     equ     (scan-9)
delay   equ     (170)
tail    equ     (kill+1)

PSTATE  equ     765
STATES  equ     20
state   equ     (win_table)

pstep01 equ     (3030-7)        ; Benj's Revenge
pstep02 equ     (2365-7)        ; CC Paper 2 (funny..)
pstep03 equ     (2924-6)        ; Die Hard
pstep04 equ     (3740-6)        ; Head or Tail
pstep05 equ     (1860-10)       ; Marcia Trionfale 1.3
pstep06 equ     (745-5)         ; Night Train
pstep07 equ     (5460-8)        ; Pulp
pstep08 equ     (2381-6)        ; RetroQ
pstep09 equ     (3740-5)        ; TimeScape
pstep10 equ     (3602-6)        ; unrequited love


steps   dat     3789, 1667
scan    add.f   steps, ptr
        sne.f   *ptr, @ptr
        add.f   steps, ptr
        sne.f   *ptr, @ptr
        jmp     scan                    ; .8c scan
        sne.i   @ptr, <ptr
        mov.x   ptr, ptr
check   seq.i   >ptr, @ptr              ; avoid decoys
        slt.ab  #tail+1-ptr, ptr        ; avoid self-scan
        jmp     scan, <ptr

wipe    mov.i   stun, <ptr              ; .66c wipe
        mov.i   >ptr, >ptr
        jmn.f   wipe, >ptr

pstep   add.ab  #0, ptr             ; scan for next copy
        djn.b   check, #delay

stun    spl     0, 0
clear   mov.i   kill, >ptr
        djn.f   clear, >ptr
kill    dat     >5335, tail-ptr

think   ldp.ab  #0, in          ; get input value
load    ldp.a   #PSTATE, state  ; load old state
        mod.a   #STATES, state  ; brainwash protection
        add.a   @in, state      ; select correct state table
store   stp.a   *state, load    ; store new state
        mov.ba  *state, pstep

boot    spl     1, >666
        z for 10
        mov.i   {think, {bptr
        rof
        djn.b   }bptr, #1
bptr    div.f   #away, #0

        z for (MAXLENGTH-CURLINE-43)
        dat     0, 0
        rof

; the tables overlap by half
win_table
        z for 10
        spl     #(z-1), pstep&z
        rof
tie_table
        z for 10
        spl     #(z-1), pstep&z
        rof
loss_table
        z for 10
        spl     #(z+9), pstep&z
        rof

        z for 10
        k for (z>1)
        spl     #(z+9), pstep&z
        rof ; k
        rof ; z
        spl     #10, pstep01

in      dat     loss_table-state, 0
        dat     win_table-state, 0
        dat     tie_table-state, 0

datz    end

