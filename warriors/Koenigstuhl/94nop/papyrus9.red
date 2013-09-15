;redcode-94b
;name Papyrus 9
;author Justin Kao
;assert 1

dist0   equ     800
dist1   equ     1250
dist2   equ     3044
bdist1  equ     3215
bdist2  equ     2932
bdist3  equ     -2932
bdist4  equ     3094
bdist5  equ     -3094
bstep2  equ     2932
bstep3  equ     -2932
bstep4  equ     3094
bstep5  equ     -3094

bootdist equ    4000

        mov     papyrus+0,  bootdist+papyrus+0
        mov     papyrus+1,  bootdist+papyrus+1
        mov     papyrus+2,  bootdist+papyrus+2
        mov     papyrus+3,  bootdist+papyrus+3
        mov     papyrus+4,  bootdist+papyrus+4
        mov     papyrus+5,  bootdist+papyrus+5
        mov     papyrus+6,  bootdist+papyrus+6
        mov     papyrus+7,  bootdist+papyrus+7
        mov     papyrus+8,  bootdist+papyrus+8

        spl     1
        spl     1
        spl     1
        spl     1

        spl     bootdist+papyrus

papyrus
copy0   spl     @0,     dist0
        mov     }-1,    >-1
copy1   spl     @0,     dist1
        mov     }-1,    >-1
copy2   spl     @0,     dist2
        mov     }-1,    >-1
        mov     bomb,   <bdist2
        add     #bstep2,  dist2-1
        mov     bomb,   <bdist3
        add     #bstep3,  dist2-1
        mov     bomb,   <bdist4
        add     #bstep4,  dist2-1
        mov     bomb,   <bdist5
        add     #bstep5,  dist2-1
        mov     bomb,   }bdist1
bomb    dat     <2667,  {1

        end
