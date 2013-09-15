;redcode
;name Emerald 5
;author P.Kline
;contact pk6811s@acad.drake.edu
;strategy stone with djn stream + anti-vamp + clear/imp-gate
;strategy added new anti-vamp code
;assert 1
spacing  equ 3044
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
         dat #start
hide0n   dat #inc-17+1594+351+33-69-512-128-467-2000
hide0    jmp -1,<7848
hide1    spl 0,<-5
hide2    mov -61+88,<-20-800+100-28+512+128
hide3    mov -61+88-1,<-20-800+100-28+512+128-1
hide4    dat <-2667,<-6
hide     dat #inc-17+1594+351+33-69-512-128-2000
start    mov hide4,inc-17+1643+350-153+6-512-128+88-2000
         mov hide3,<hide
         mov hide2,<hide
         mov hide1,<hide
         mov hide0,@hide0n
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         spl @copyt
         spl @copyt
         spl @hide
         mov #0,start
         mov #0,copyt
         mov #0,hide
         spl 1
         spl 1
         spl 1
         spl 1
         jmp avamp1
emerald  spl 0,<hide3
stone    mov <stone-spacing+2,stone+spacing+2
         add inc,stone
cnt      djn stone,<inc-130
inc      dat #0-spacing,#spacing
copyf    dat #0
copyt    dat #copyf+1020-2000
copyt2   dat #copyf+1020+12

avamp1  sub <pb1+1000-8,pb1 ; find and reverse trap-pointers
        mov pb1,<pb1        ; bomb that trap
avamp2  sub <pb2+2000-8,pb2 ; find and reverse trap-pointers
        mov pb2,<pb2        ; bomb that trap
avamp3  sub <pb3+3000-8,pb3 ; find and reverse trap-pointers
        mov pb3,<pb3        ; bomb that trap
avamp4  sub <pb4+4000-8,pb4 ; find and reverse trap-pointers
        mov pb4,<pb4        ; bomb that trap
avamp5  sub <pb5+5000-8,pb5 ; find and reverse trap-pointers
        mov pb5,<pb5        ; bomb that trap
avamp6  sub <pb6+6000-8,pb6 ; find and reverse trap-pointers
        mov pb6,<pb6        ; bomb that trap
avamp7  sub <pb7+4500-8,pb7 ; find and reverse trap-pointers
        mov pb7,<pb7        ; bomb that trap
pb1     dat #1000
pb2     dat #2000
pb3     dat #3000
pb4     dat #4000
pb5     dat #5000
pb6     dat #6000
pb7     dat #4500
         end start
