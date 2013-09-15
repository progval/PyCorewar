;redcode-94
;name Recycled Bits
;author David Moore
;strategy Pwarrior switches between five modules:
;strategy   scanner, incendiery bomber, silk-imps, spl/dat clear, skew dwarf
;assert 1

;;;;;;;;;;;;;;;;;;;;
;                  ;
; transition table ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

lt    stp # 1, #dd  ;         LL WW TT
      stp # 2, #ss  ;         -- -- --
      stp #15, #bb  ;  0  P1  D1 D1 W1  paper     ; switch even if paper wins
      stp # 2, #ss  ;  1  D1  S1 D2 D1  dwarf
      stp #15, #bb  ;  2  S1  B1 S2 S1  scanner
tt    stp # 3, #ww  ;  3  W1  S1 W2 W1  sdd clear
      stp # 1, #dd  ;  4  B2  B1 B3 B2  incendiary
      stp # 2, #ss  ;  5      W1 P1 D1             (unreachable state)
      stp # 3, #ww  ;  6  D2  D1 D3 D2  dwarf
      stp # 4, #bb  ;  7  S2  S1 S3 S2  scanner
wt    stp # 1, #dd  ;  8  W2  W1 W3 W2  sdd clear
      stp # 6, #dd  ;  9  B3  B2 B4 B3  incendiary
      stp # 7, #ss  ; 10      D1 P1 P1             (unreachable state)
      stp # 8, #ww  ; 11  D3  D2 D3 D3  dwarf
      stp # 9, #bb  ; 12  S3  S2 S3 S3  scanner
      dat   0,   0  ; 13  W3  W2 W3 W3  sdd clear
      stp #11, #dd  ; 14  B4  B3 B4 B4  incendiary
      stp #12, #ss  ; 15  B1  P1 B2 P1  incendiary
      stp #13, #ww
      stp #14, #bb
      dat   0,   0  ; 0 -> paper
      stp #11, #dd
      stp #12, #ss  ; saved 16 lines by overlapping tables
      stp #13, #ww
      stp #14, #bb  ; same size as the equivalent Nomolos switcher
      stp # 4, #bb  ; but with fewer unreachable states

;;;;;;;;;;;;;;;;;;;;
;                  ;
;    silk-imps     ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

p1 equ 2333 ; 3076
p2 equ 1737 ; 1599

paper  spl 2, >7398       ; make 6 parallel processes
       spl 1, >5483
       spl 1, >6723

       spl  @0, >p1       ; copy copy copy
       mov }-1, >-1
       mov {-2, <1
       spl  @0, >p2

       mov.i #2*p1, }-p1  ; pass this instruction to other copies, like an imp

       dat 1,1

;;;;;;;;;;;;;;;;;;;;
;                  ;
;   misc. tables   ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

pboot equ 1430  ; boot distance for paper

     dat 0,0    ; scanned by f-scan

; here are the rest of the boot distances.
; for example: dwarf will start at 5416 + last

dd   dat 5416-pboot, dwarf-paper ; dwarf
ss   dat 5923-pboot, scan-paper  ; scanner
ww   dat 4235-pboot, wipe-paper  ; sdd clear
bb   dat 3250-pboot, bomb-paper  ; incendiary

; more p^2 stuff

      stp #0, #wt-find+5  ; initial state = 0
table stp #0, #lt-find
      stp #0, #wt-find
      stp #0, #tt-find

;;;;;;;;;;;;;;;;;;;;
;                  ;
;  sdd core-clear  ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

; fighting 3 point imps and stones which bomb with core (i.e. MOV <a, b)

wtop equ (wipe-3)    ; hope for dat 0,0 in that location

wipe  spl   #-1,  wend-wtop
      mov *wend, >wtop
      mov *wend, >wtop
      djn.f  -1, {wtop
      jmp    -2, <wtop-2667

      dat    #0,  wend-wtop-1
      dat <5334, <2667         ; 2nd pass
      spl   #-2,  wend-wtop    ; 1st pass bomb
wend  spl #wipe,  wend-wtop

      dat 0,0   ; scanned by f-scan

;;;;;;;;;;;;;;;;;;;;
;                  ;
;   incendiary     ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

bstep equ 2394 ; 7629 ; 7036
bhop  equ 7953 ; 7965 ; 7969
btime equ 1378 ; 1427 ; 1323
bgate equ    3 ;    4 ;    3

bomb    spl    #1,bhop      ; spl half of the incendiary
        add   #bstep, 1
        mov     bmov, >2-bstep*btime
        mov     bomb, @-1
        jmz       -3, #0    ; bombed with spl to start clear

        mov  bdat,>bomb-bgate
        djn.f  -1,>bomb-bgate

bdat    dat <2667, 2+bgate-bomb

bmov    mov -bhop,>-bhop    ; mov half of the incendiary

;;;;;;;;;;;;;;;;;;;;
;                  ;
;     scanner      ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

step equ 5379       ; or 5393

scan nop 0, 5000

sm   mov sb, >scan  ; bombing from the scan loop - Mirage style
sc   add #step+1, #step+1
     jmz.f sm, <sc
     slt.b sc, #14
     mov.b sc, scan
     jmn sm, sc
     jmp sm, }sm    ; switch to next bomb after a while

sb   spl #0, {0     ; hope for two dat 0's following this location

;;;;;;;;;;;;;;;;;;;;
;                  ;
;    skew dwarf    ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

; not quite a dwarf, it's different somehow

dstep equ 81
dhop  equ 5277
dtime equ 1677
 
dwarf spl  #0, <dhop+2             ; combines with datb to form a gate
      mov datb, {(dstep*dtime)+1
      mov datb, @-1                ; hit by datb to start clear
      sub #dstep, -2
      djn.f -3, <dhop-2

   for 3
      dat 0,0
   rof

datb  dat <dhop+1, >1

   for 3
      dat 0,0
   rof

;;;;;;;;;;;;;;;;;;;;
;                  ;
;  pspace & boot   ;
;                  ;
;;;;;;;;;;;;;;;;;;;;

pkey    equ  321
length  equ    9

main  ldp.a  #pkey, find
      mod.a    #16, find
      ldp.a    #0, table
      add.ba *table, find
      stp.ab  *find, #pkey
find  add    @0, last

    for length                    ; all components have the same length
      mov  <last, {last
    rof

last  djn.f pboot, #paper+length  ; this line will be modified

end main

