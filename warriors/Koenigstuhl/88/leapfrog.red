;redcode
;name Leapfrog
;author David Moore
;strategy 1) quickscan
;strategy 2) stone
;strategy 3) antivamp + paper + core clear
;strategy 4) gate
;assert CORESIZE==8000

qint equ 103
dist equ 1388
incr equ 2365
time equ 1593

clear   dat <2667, <5334

; Gate-busting imps stop here when they are gated.
; They execute dat <2663, thus undoing their own work.

front   dat <2663, <2663
        dat <2663, <2663

        dat <2663, <2663

; "gate" works quietly with the antivamp until
; the core clear finishes. Then it spawns lots of
; processes so that it can concentrate on hitting imps.

gate    mov clear, <sptr+dist+7
        djn    -1,          #17  ; timer for gate
        spl     1,     <front-4
        djn    -1,     <front-4

        jmp -1, 0

; the core clear

clean   spl      0,    <front-4
        spl      0,    <front-4
        mov  clear,    <front-2
        djn     -1,       <3850

        jmp -1, 0

; "anti-vamp"
; destroys vampires that give away their location

avamp   sub @sptr+dist-2,  sptr+dist+7
        add  sptr+dist-2,  sptr+dist+7
        mov        clear, <sptr+dist+7
        jmp           -1,            0

        dat #0, #0

; I hope that any vampires or scanners are gone
; before this paper is launched.

paper   spl 1, 0
        mov 1, 0
        spl 1, 0

; Paper borrowed from B-Panama V

        mov #6,0
        mov <-1,<1
        spl @0,-3365
        mov 2,<-1
        jmz -4,-4
        dat <2667,<5334

        dat #0, #0

; The stone has found some non-zero location, so the
; anti-vamp will use it while the paper and
; the core clear start.

next    spl avamp, 0
        spl paper, 0
        spl clean, 0
        jmp  gate, 0

; deliver the payload when the quickscanner
; finds something

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
found2  mov # (qscan +  3*qint) - qptr, qptr
found1
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
        jmp  -1,  13

; quickscan tries to catch enemies before they can boot away

qscan   cmp qscan +  2*qint, 4000 + qscan +  2*qint
        jmp  found1, 0
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

boot    mov  d, <sptr
        mov  c, <sptr
        mov  b, <sptr
        mov  a, <sptr
sptr    jmp @0,  dist

; Bomb the core until a non-zero location is found
; i.e. until my enemy proves that he's not a scanner

     a  mov    <c, d+1+incr
     b  add #incr, a
     c  jmz     a, d+time
     d  jmp next-sptr-dist+1, 0

end qscan
