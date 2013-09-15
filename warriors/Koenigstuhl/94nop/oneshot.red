;redcode-94
;name One Shot
;author Philip Kendall
;strategy one shot -> spl/spl/anti-imp dat
;assert CORESIZE==8000
;show source

;show off
;warrior has been changed since the following
;combinations tried:    12/ 6/(ptr-409): 142.1667
;                       24/12/(ptr-403): 151.5833
;                       24/ 6/(ptr-409): 147.9167
;                       30/15/(ptr-411): 154.0833/156.0000
step    equ     30
sep     equ     15
stream  equ     (ptr-412)
;show on

scan1   equ     (inc+step)
imp     equ     2667
cstart  equ     (last+2-ptr)

ptr     dat.f   bomb1,#0                ; scanned-low
bomb3   dat.f   >imp,>(2*imp)
inc     dat.f   step,step
bomb2   spl.a   #(bomb3-ptr),cstart
loop    add.f   inc,scan
scan    sne.i   scan1,scan1+sep
        djn.f   loop,<stream
        mov.ab  scan,ptr
bomb1   spl.a   #(bomb2-ptr),cstart
clear   mov.i   *ptr,>ptr
        mov.i   *ptr,>ptr
last    djn.f   clear,<stream

        spl.a   #1,1
        spl.a   #1,1
        spl.a   #1,1
        dat.f   (bomb1-ptr),#0          ; scanned-hi

;show off
bdist   equ     3018
;show on

boot
i       for     (last-ptr+1)
        mov.i   (ptr+i-1),>bptr
        rof
        spl.a   *bptr,>-1000
        div.f   bptr,bptr
bptr    dat.f   (scan+bdist),(ptr+bdist) ; scanned-low

        spl.a   #1,1
        spl.b   #1,1
        spl.ab  #1,1
        spl.ba  #1,1
        spl.f   #1,1
        spl.x   #1,1
        spl.i   #1,1
        spl.a   1,#1
        spl.b   1,#1
        spl.ab  1,#1
        spl.ba  1,#1
        spl.f   1,#1
        spl.x   1,#1
        spl.i   1,#1
        dat.f   1,1                     ; scanned-hi

i       for     3
        spl.a   #1,*1
        spl.b   #1,*1
        spl.ab  #1,*1
        spl.ba  #1,*1
        spl.f   #1,*1
        spl.x   #1,*1
        spl.i   #1,*1
        spl.a   *1,#1
        spl.b   *1,#1
        spl.ab  *1,#1
        spl.ba  *1,#1
        spl.f   *1,#1
        spl.x   *1,#1
        spl.i   *1,#1
        for     (i<3)
        spl.a   #1,#1                   ; scanned
        rof
        for     (i==3)
        dat.f   0,0                     ; scanned-low
        rof
        rof

        for     (MAXLENGTH-CURLINE)
        spl.a   #1,1
        rof

        end     boot

