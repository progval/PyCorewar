;redcode
;name Froglegs
;author John Lewis
;strategy Leapfrog-quickscan.
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

; removed quickscan.  not sure how it will do.A
for 58
		dat #0, #0
rof



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

end boot




