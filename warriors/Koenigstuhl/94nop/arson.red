;redcode-94
;name Arson v2.1
;author Brant D. Thomsen
;contact bdthomse@peruvian.cs.utah.edu
;strategy A combination of A & B-field scanner and Incineration Bomber.
;strategy  v2.0 - Moved to the '94 standard.
;strategy  v2.1 - Changed to Torch's MOV-SPL bomb style.
;strategy Submitted: @date@
;macro
;assert 1

step    equ     -76             ; Use small negative value.
init    equ     step+1

move    mov.I   -step+1, >-step+1

bomb    mov.I   move, @point

point   add.AB  #step+1, #init
start   mov.I   split, @point   ; Hit here to finish
        jmz.F   point, <point

        jmn.B   bomb, @-1
        nop.F   <0, <0          ; 0's so ignored by scanner

split   spl.B   -1, <step+1     ; Hit here (will have no effect)
        mov.I   clear, <point
        djn.F   split, >confuse ; Instead of imp-gate, have lots of processes.
                                ; This will result in a tie if over-run by imp.

        dat     0, 0
        dat     0, 0            ; Hit here

for 40
        dat     0, 0
rof

clear   dat     <step, <step+1

for 39
        dat     0, 0
rof

confuse dat     <step-1, 10

        end     start
