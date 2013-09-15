;redcode
;name LaterAtNight
;author Robert Macrae
;strategy Nightfall + QS
;assert CORESIZE==8000

; ---------------------------------------------------- 

; QS from Kitchen Sink

; Adjusts QS parameters

qint equ (-120)
dist equ (1388-400)
incr equ -1001
time equ 920
front equ (found4-2)
qbs  equ 7
qbn  equ 7

found4  add # qint*4, qptr
found2  add # qint*2, @-1
found1  add # qint*1, @-2
found0

qbite   cmp @qptr, front
         add #4100, qptr
        add #3900, qptr                  

qmain   mov db,    @qptr
qptr    mov db,    @(qscan + 2*qint)
        sub #qbs,  qptr
        djn qmain, #qbn
qpit    jmp boot, 15

db      dat <1,    <qbs*qbn - (qbs/2)

; ---------------------------------------------------- 

qscan   cmp qscan +  2*qint, 3900 + qscan +  2*qint
         jmp  found0, 0
        cmp qscan +  3*qint, 3900 + qscan +  3*qint
         jmp  found1, 0
        cmp qscan +  4*qint, 3900 + qscan +  4*qint
         jmp  found2, <found1
        cmp qscan +  5*qint, 3900 + qscan +  5*qint
         jmp  found2, 0
        cmp qscan +  7*qint, 3900 + qscan +  7*qint
         jmp  found4, <found2
        cmp qscan +  8*qint, 3900 + qscan +  8*qint
         jmp  found4, <found1
        cmp qscan +  9*qint, 3900 + qscan +  9*qint
         jmp  found4, 0

        mov #(qscan + 10*qint) -qptr, qptr

        cmp qscan +  10*qint, 3900 + qscan +  10*qint
         jmp  found0, 0
        cmp qscan +  11*qint, 3900 + qscan +  11*qint
         jmp  found1, 0
        cmp qscan +  12*qint, 3900 + qscan +  12*qint
         jmp  found2, <found1
        cmp qscan +  13*qint, 3900 + qscan +  13*qint
         jmp  found2, 0
        cmp qscan +  15*qint, 3900 + qscan +  15*qint
         jmp  found4, <found2
        cmp qscan +  16*qint, 3900 + qscan +  16*qint
         jmp  found4, <found1
        cmp qscan +  17*qint, 3900 + qscan +  17*qint
         jmp  found4, 0

; ---------------------------------------------------- 

aaa equ 2917
bbb equ 2030
ccc equ 6842 

length equ 9

boot   spl 2,0
       spl 2,paper+length+aaa
       spl 1,paper+length
       mov -1, 0           ; 9 proc

       mov <-2, <-3        ; must boot one copy in advance for silk

paper  spl aaa, length+(aaa*2)
       mov <paper+length+aaa, <paper

       mov <length, <1     ; use empty core as pointer to self
       spl      @0,  bbb

inner  mov <length, <1
       spl      @0,  ccc

       mov       3,  <inner-2           ; Bomb!

       mov      #0,  inner+length
       jmp   inner, <inner+1

end qscan

