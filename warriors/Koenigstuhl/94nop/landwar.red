;redcode-94
;name Land War In Asia
;author John K. Wilkinson
;strategy You've fallen prey to one of the two classic blunders!!
;strategy Finally!  Something that kills Impfinity. :-)  I don't
;strategy think it'll do all that well against much else... then
;strategy again, it might.
;strategy scissors, gate
;assert 1

A equ 45
org     split

cgate   dat     #0,     100 ;clear+A*2
        dat     0,      0
split   spl     split2
        spl     clear,  }0
        djn     -1,     #A
        dat     clear,  0
bomb1   dat     <1,     100

clear
i for A
        mov     bomb+(bomb1-bomb)*(i%2==0),   >cgate
        jmp     -1,     <cgate-1
rof

bomb    dat     <1,     100
split2  spl     clear+A,  }0
        djn     -1,     #A


