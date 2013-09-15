;redcode-94
;name Stimpy v2.0
;author Brant D. Thomsen
;strategy SPL/JMP A/B field scanner w/ SPL/DAT core-clear.
;strategy Submitted: @date@
;macro
;assert 1

step    equ     2365
init    equ     1 + step

        dat.A   #1, #1
        dat.A   #1, <1
        dat.A   #1, @1
        dat.A   #1, <1
        dat.A   #1, >1
        dat.A   #1, *1
        dat.A   #1, {1
        dat.A   #1, }1
        dat.A   1, #1
        dat.A   1, 1
        dat.A   1, @1
        dat.A   1, <1
        dat.A   1, >1
        dat.A   1, *1
        dat.A   1, {1
        dat.A   1, }1
        dat.A   @1, #1
        dat.A   @1, 1
        dat.A   @1, @1
        dat.A   @1, <1
        dat.A   @1, >1
        dat.A   @1, *1
        dat.A   @1, {1
        dat.A   @1, }1
        dat.A   <1, #1
        dat.A   <1, 1
        dat.A   <1, @1
        dat.A   <1, <1
        dat.A   <1, >1
        dat.A   <1, *1
        dat.A   <1, {1
        dat.A   <1, }1
        dat.A   >1, #1
        dat.A   >1, 1
        dat.A   >1, @1
        dat.A   >1, <1
        dat.A   >1, >1
        dat.A   >1, *1
        dat.A   >1, {1
        dat.A   >1, }1
        dat.A   *1, #1
        dat.A   *1, 1
        dat.A   *1, @1
        dat.A   *1, <1
        dat.A   *1, >1
        dat.A   *1, *1
        dat.A   *1, {1
        dat.A   *1, }1
        dat.A   {1, #1
        dat.A   {1, 1
        dat.A   {1, @1
        dat.A   {1, <1
        dat.A   {1, >1
        dat.A   {1, *1
        dat.A   {1, {1
        dat.A   {1, }1
        dat.A   }1, #1
        dat.A   }1, 1
        dat.A   }1, @1
        dat.A   }1, <1
        dat.A   }1, >1
        dat.B   <1, #1
        dat.B   <1, 1
        dat.B   <1, @1
        dat.B   <1, <1
        dat.B   <1, >1
        dat.B   <1, *1
        dat.B   <1, {1
        dat.B   <1, }1
        dat.B   >1, #1
        dat.I   @1, 1
        dat.I   @1, >1
        dat.I   1, 1

start   mov.I   db, db - point - step - 1
                        ; The bootstrapping distance is chosen
                        ; such that this instruction is overwritten
                        ; by the first bomb.
                        ; (In case of tracing.)

        add     #ptr - db, start
        mov.I   ptr, @start
        sub     #ptr - jump - 1, start
    for 8
        mov.I   <jump + 1, <start
    rof
        jmp     @start, <4000

db      dat.F   <split - ptr - 1, #0    ; DAT for SPL/DAT core-clear

        dat.F   #1, #1                  ; Gap for bomb
        dat.F   #1, <1

top     mov     jump, @point
        add     #step - 1, point
begin   mov.I   split, >point
point   jmz.F   -2, init                ; Hit here to end
        jmn.A   top, -1

split   spl     #0, <-ptr
        mov.I   @begin, <ptr
jump    jmp     -1, <split - ptr + split

        dat.F   #1, @0                  ; Gap for bomb
        dat.F   #1, 1

ptr     dat.F   0, <db - 5              ; Pointer for SPL/DAT core-clear

        end     start
