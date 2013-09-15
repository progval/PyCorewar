;redcode-b verbose
;name Cannon Fodder
;version 0.1
;author Ilmari Karonen
;strategy Aggressive paper with crappy constants. :(
;comments Use as many kinds of bombs as possible.
;comments Idea from Toxin..
;history 0.1 - works?
;date June 19, 1996
;planar paper
;assert CORESIZE == 8000

step1   equ     -1718
step2   equ     2524
step3   equ     2841

hit1    equ     (bomb1+4024)
hit2    equ     (2667)
hit3    equ     (-2666)
hit4    equ     (bomb2+1)
hit5    equ     (-501)

        org     start

start   spl     1, {500         ; \.
        spl     1, {1500        ; -\ create 16
        spl     1, {2000        ; -/ inline processes
        spl     1, {2500        ; /

split1  spl     @0, <step1
        mov.i   }split1, >split1
split2  spl     @0, <step2
        mov.i   }split2, >split2
split3  spl     @0, <step3
        mov.i   }split3, >split3
        mov.i   #1, }hit2
        mov.i   bomb2, }hit3
foo1    mov.i   {hit4, <hit5
        mov.i   bomb2, <(-10*step3)+split1
        mov.i   bomb1, {hit1
        mov.i   bomb1, {hit1+2667
        mov.i   bomb1, {hit1+(2*2667)
        mov.i   bomb2, }foo1
bomb1   dat     <2667, <2*2667
bomb2   dat     1, 1

dc      for     (MAXLENGTH-CURLINE)/7
        dat     #1, *1
        dat     $1, #1
        dat     @1, $1
        dat     *1, @1
        dat     #1, *1
        dat     $1, #1
        dat     @1, $1
        rof
dc      for     (MAXLENGTH-CURLINE)
        dat     1, 1
        rof

        end


