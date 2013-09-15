;redcode-94
;name Imp-Spiral Finder
;author Brant Thomsen
;strategy Launch the smallest possible imp-spiral for any coresize < 90090
;macro
;assert 1
boot    equ     150


imp     mov.I   #0, 0           ; Will copy value here later.

find    mov.B   <d2, #0         ; Get the value to test.
        mul.AB  @d2, find       ; See what the result would be.
        djn.B   find, find      ; If result != 1, then try next value.

launch  mov.B   @d2, imp        ; Put the value in the imp.
        mov.I   imp, imp+boot   ; Move the initial imp-spiral instruction.

        ; Begin to generate processes.

        spl.F   2
for 5
        spl.F   1
rof

        ; Should have 48 processes here.

        spl.F   2               ; Launch an imp-spiral using JMP/ADD method.
        jmp.F   @0, imp+boot    ; Nice since don't need step size in advance.
        add.F   imp, -1


        ; These are the test values to use.
        ; Notice that only prime numbers are used.

        dat.F   17, (d17 * CORESIZE + 1) / 17   ; Needed for size 30030
        dat.F   17, (d17 * CORESIZE + 1) / 17   ; Needed for size 60060
d17
xx for 12
        dat.F   13, (d13 * CORESIZE + 1) / 13
rof
d13
xx for 10
        dat.F   11, (d11 * CORESIZE + 1) / 11
rof
d11
xx for 6
        dat.F   7, (d7 * CORESIZE + 1) / 7
rof
d7
xx for 4
        dat.F   5, (d5 * CORESIZE + 1) / 5
rof
d5
xx for 2
        dat.F   3, (d3 * CORESIZE + 1) / 3
rof
d3      dat.F   2, (d2 * CORESIZE + 1) / 2

d2      end     find            ; This instruction is a DAT.F 0, 0
                                ; It is used at the pointer to the
                                ;  current test value.
