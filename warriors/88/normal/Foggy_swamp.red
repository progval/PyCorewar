;redcode
;name Foggy swamp
;author Beppe Bezzi
;strategy round 5 Maniacs tournament
;strategy qscan -> blur 88
;strategy join Leapfrog, beat it or try to beat those beating it?
;strategy this one scores not bad against Leapfrog and Pacman and beats
;strategy paper and slow booting imps. 
;strategy Don't think I'll score well, I know too little of 88

;ASSERT 1
qint    equ     -150
step    equ     70
away    equ     -2200


front
top     mov     bomb,   <ptr
a       add     inc,    scan
scan    cmp     -3*step+5,  -3*step
        mov     scan,   @-3
        jmn     top,    @-3
bomb    spl     0,      <1-step
        mov     inc,    <bomb-2
        djn     -1,     @-1-step
inc     dat     <-step, <-step
ptr     dat     #0,     #-2*step


found3  mov # (qscan +  4*qint) - qptr, qptr
        jmp qbite, 0
found4  mov # (qscan +  5*qint) - qptr, qptr
        jmp qbite, 1
found5  mov # (qscan +  6*qint) - qptr, qptr
        jmp qbite, 1
found6  mov # (qscan +  7*qint) - qptr, qptr
        jmp qbite, 1
found7  mov # (qscan +  8*qint) - qptr, qptr
        jmp qbite, 1
found8  mov # (qscan +  9*qint) - qptr, qptr
        jmp qbite, 1
found9  mov # (qscan + 10*qint) - qptr, qptr
        jmp qbite, 1
found10 mov # (qscan + 11*qint) - qptr, qptr
        jmp qbite, 1

found11 mov # (qscan + 12*qint) - qptr, qptr
        jmp qbite, 1
found12 mov # (qscan + 13*qint) - qptr, qptr
        jmp qbite, 1
found13 mov # (qscan + 14*qint) - qptr, qptr
        jmp qbite, 1
found14 mov # (qscan + 15*qint) - qptr, qptr
        jmp qbite, 1
found15 mov # (qscan + 16*qint) - qptr, qptr
        jmp qbite, 1



found2  mov # (qscan +  3*qint) - qptr, qptr
found1
;-break
qbite   cmp @qptr, front-2
        add #4000, qptr
        add #4002, qptr
qmain   mov <qpit, <qptr
qptr    mov <qpit, @(qscan + 2*qint) - qptr
        djn qmain, #7
qpit    jmp  boot, 15
        jmp -58,   1
        spl   0,  58
        jmp  40,   1
        spl  -1, -40
        jmp -43,   1
        spl  -1,  43
        jmp  29,   1
        spl  -1, -29
        jmp -28,   1
        spl  -1,  28
        jmp  18,   1
        spl  -1, -18
        jmp -13,   1
;-break        
        jmp  -1,  13

; quickscan tries to catch enemies before they can boot away

qscan   
        cmp qscan +  3*qint, 4000 + qscan +  3*qint
        jmp  found2, 0
        cmp qscan +  4*qint, 4000 + qscan +  4*qint
        jmp  found3, 0
        cmp qscan +  5*qint, 4000 + qscan +  5*qint
        jmp  found4, 0
        cmp qscan +  6*qint, 4000 + qscan +  6*qint
        jmp  found5, 0
        cmp qscan +  7*qint, 4000 + qscan +  7*qint
        jmp  found6, 0
        cmp qscan +  8*qint, 4000 + qscan +  8*qint
        jmp  found7, 0
        cmp qscan +  9*qint, 4000 + qscan +  9*qint
        jmp  found8, 0
        cmp qscan + 10*qint, 4000 + qscan + 10*qint
        jmp  found9, 0
        cmp qscan + 11*qint, 4000 + qscan + 11*qint
        jmp found10, 0
        
        cmp qscan + 12*qint, 4000 + qscan + 12*qint
        jmp found11, 0
        cmp qscan + 13*qint, 4000 + qscan + 13*qint
        jmp found12, 0
        cmp qscan + 14*qint, 4000 + qscan + 14*qint
        jmp found13, 0
        cmp qscan + 15*qint, 4000 + qscan + 15*qint
        jmp found14, 0
        cmp qscan + 16*qint, 4000 + qscan + 16*qint
        jmp found15, 0
        cmp qscan +  2*qint, 4000 + qscan +  2*qint
        jmp  found1, 0

boot    mov     ptr,    away
        mov     ptr-1,  <boot
        mov     ptr-2,  <boot
        mov     ptr-3,  <boot
        mov     ptr-4,  <boot
        mov     ptr-5,  <boot
        mov     ptr-6,  <boot
        mov     ptr-7,  <boot
        mov     ptr-8,  <boot
        mov     ptr-9,  <boot
        jmp     @boot,  <boot


end     qscan
