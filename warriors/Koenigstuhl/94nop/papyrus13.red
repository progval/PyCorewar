;redcode-94b test
;name Papyrus 13
;author Justin Kao
;strategy Paper of course...
;assert 1

dist0   equ     800
dist1   equ     1240
dist2   equ     3044
dist3   equ     50
bdist1  equ     230
bdist2  equ     3230
bdist3  equ     150

bootdist equ    4000

        mov     copy0+0,  bootdist+copy0+0
        mov     copy0+1,  bootdist+copy0+1
        mov     copy0+2,  bootdist+copy0+2
        mov     copy0+3,  bootdist+copy0+3
        mov     copy0+4,  bootdist+copy0+4
        mov     copy0+5,  bootdist+copy0+5
        mov     copy0+6,  bootdist+copy0+6
        mov     copy0+7,  bootdist+copy0+7
        mov     copy0+8,  bootdist+copy0+8
        mov     copy0+9,  bootdist+copy0+9
        mov     copy0+10,  bootdist+copy0+10
        mov     copy0+11,  bootdist+copy0+11

        spl     1
        spl     1
        spl     1
        spl     1

        spl     bootdist+copy0

copy0   spl     @0,     dist0   ;spl to copy
        mov     }-1,    >-1     ;copy
copy1   spl     @0,     dist1   ;spl to copy
        mov     }-1,    >-1     ;copy
copy2   spl     @0,     dist2   ;spl to copy
        mov     }-1,    >-1     ;copy
        mov     bomb1,  <bdist3 ;bombing
        mov     bomb1,  {bdist1 ;bombing
        mov     bomb1,  <bdist2 ;bombing
        mov.i   {copy2, <copy3  ;copy
copy3   jmp     @0,     >dist3  ;jmp new copy 
bomb1   dat     <2667,  {1
