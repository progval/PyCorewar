;redcode-b
;name clearance .4
;author Charles
;strategy Bombs core every 2 addreses then enters core clear.
;assert CORESIZE==8000

org dwarf
        spl 0, <2667  ;slow enemy processes down
dwarf   add #2, 3
        mov -2, @2
        djn -2, #3973  ;used as counter to keep from bombing self
clear   jmp a1, #12     ;falls through to core clear
ptr1    dat a1, c+100
a4      dat 0,  c+2+1
a3      dat 1, c+2+2
a2      spl #2, c+2+3         ; spl #X, <-Y acts like a split 0.
a1      spl #3, c+2+4         ; you can use x and Y as step values
        mov *ptr1, >ptr1        ; and use the decrement in the b-field
        mov *ptr1, >ptr1        ; as part of an imp gate.
        mov *ptr1, >ptr1        ; > (post-increment) keeps adding 1 to
c       djn.f -3, <4000         ; the b-field of ptr1 to move the bomb
                             ; through core.
        end
