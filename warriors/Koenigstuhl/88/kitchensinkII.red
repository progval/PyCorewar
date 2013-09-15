;redcode
;name Kitchen Sink II
;author Robert Macrae
;strategy  The warrior with everything -- paper, clear, bomber and Q^2!
;strategy     :-( actually its just Leapfrog with a new quickscan )-:
;assert CORESIZE==8000

; Adjusts QS parameters

qint equ 200
dist equ (1388-400)
incr equ -1001
time equ 920

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

; the core clear

clean   spl      0,    <front-4
        spl      0,    <front-4
        mov  clear,    <front-2
        djn     -1,       <3850

; "anti-vamp"
; destroys vampires that give away their fang location
; and the rare warriors which my linear scan picks up.

avamp   sub @sptr+dist-2,  sptr+dist+0    ; single process, so slow.
        add  sptr+dist-2,  sptr+dist+0
        mov        clear, <sptr+dist+0    ; Bomb putative fang
        mov        clear, <sptr+dist-2    ; Bomb putative warrior 
        jmp           -2,            0    ; Until boredom sets in

; I hope that any vampires or scanners are gone
; before this paper is launched.

paper   spl 1, 0
        mov 1, 0
        spl 1, 0

; Tweaked Paper hit imps a little harder via SPL <0
;   -- until I discovered that MOV #6, #0 is not legal '88. Boo.

        mov #6,   0
        mov <-1,  <1
        spl @0,   -3365
        mov 2,    <-1
        jmz -4,   -4
        dat <2667,<5334

; The stone has found some non-zero location, so the
; anti-vamp will use it while the paper and
; the core clear start.

next    spl avamp, 0
        spl paper, 0
        spl clean, 0
        jmp  gate, 0

; deliver the payload when the quickscanner
; finds something

found4  add # qint*4, qptr
found2  add # qint*2, @-1
found1  add # qint*1, @-2
found0

qbite   cmp @qptr, front-2
         add #4100, qptr
        add #3902, qptr                 ; JMN would save 1 cycle...

qmain   mov <qpit, <qptr
qptr    mov <qpit, @(qscan + 2*qint)
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

boot    mov  d, <sptr
        mov  c, <sptr
        mov  b, <sptr
        mov  a, <sptr
sptr    jmp @0,  dist

; Bomb the core until a non-zero location is found
; i.e. until my enemy proves that he's not a scanner

     a  mov    <c, d+1+incr-96
     b  add #incr, a
     c  jmz     a, d+time
     d  jmp next-sptr-dist+1, 0

        end qscan
