;redcode-94
;name Stolen RedCode
;author Leonardo H. Liporati
;assert (CORESIZE==8000)
;strategy p^3++: silk, rock, scan, burn
;strategy based on Self-Modifing Code by Ben Ford
;strategy changed the silk by the one in Origami Harquebus by MJ Pihlaja
;strategy changed the scanner by a mini-HSA
;strategy deleted the wipe component removing three states and
;strategy changing two transitions of the state machine

; ----- p^3++ table -----       ; ##    L-12    W-11    T-13    type
                                ; --    ----    ----    ----    ----
vect    spl     #  w0,  #1045   ;  0     1       0       5      silk
        spl     #  w1,  # 508   ;  1     4       2       1      rock
        spl     #  w1,  #1081   ;  2     1       3       2      rock
        spl     #  w1,  # 146   ;  3     2       3       3      rock
        spl     #  w2,  # 511   ;  4     7       5       4      mhsa
        spl     #  w2,  #1084   ;  5     4       6       5      mhsa
        spl     #  w2,  # 149   ;  6     5       6       6      mhsa
        spl     #  w3,  # 624   ;  7     0       8       0      burn
        spl     #  w3,  #1087   ;  8     7       9       8      burn
        spl     #  w3,  #1088   ;  9     8      10       9      burn
        spl     #  w3,  # 153   ; 10     9      10      10      burn
        spl     #  w0,  #1453   ; 11     1       1      10      unreach

pmod    spl     #   0,  #  12   ; lose, need non-0 b-field in prev cell
        spl     #   0,  #  11   ; win
        spl     #   0,  #  13   ; tie

boot    equ     1430    ; boot distance
spacing equ     2
w0      equ     (silk-silk)
w1      equ     (rock-silk)
w2      equ     (mhsa-silk)
w3      equ     (burn-silk)

for     spacing
        dat     $   0,  $   0
rof

; ----- silk -----
d1      equ     1137    ;4431   ;1137   ;4583   ;1354
d2      equ     4372    ;3151   ;4372   ;3462   ;6277

i1      equ     5380    ;       ;       ;       ;

silk    spl     @0      ,       1
        spl     1       ,       >1567
        spl     1       ,       >7124

        spl     @0      ,       }-d1
        mov     }-1     ,       >-1
        spl     @0      ,       }-i1
        mov     }-1     ,       >-1
        mov     {-2     ,       <1
        spl     @0      ,       >d2
        mov.i   #2*i1   ,       }-i1


for     spacing
        dat     $   0,  $   0
rof

; ----- burn -----

binc    equ     2394    ; 2394 7629 7036
bhop    equ     7953    ; 7953 7965 7969
bclk    equ     1378    ; 1378 1427 1323
bptr    equ        3    ;    3    4    3
borg    equ     (2-binc*bclk)

burn    spl     #   0,   bhop   ; spl half of the incendiary
        add     #binc,      1
        mov      bmov,  >borg
        mov      burn,  @  -1
        jmz        -3,  #   0   ; bombed with spl to start clear
        mov      bdat,  >burn-bptr
        djn.f      -1,  >burn-bptr
bdat    dat     <2667,   2+bptr-burn
bmov    mov     -bhop,  >-bhop  ; mov half of the incendiary

for     spacing
        dat     $   0,  $   0
rof

; ----- mini-HSA -----

SELFS   equ    16 ;20 ; 19/16
INCR    equ     7 ; 6 ;  7

ptr     equ    (mhsa-4)

mhsa    spl    #scan       , }1
atck    mov    mhsa        , {ptr
        mov    }ptr        , }ptr
pptr    jmn.f  atck        , }ptr
scan    add.a  #INCR+1     , @pptr
        jmz.f  scan        , {ptr
        slt.ab @pptr       , #mark-ptr+2
        jmp    atck        , {ptr
        djn    scan        , #SELFS
        jmp    scan        , {atck

mark    dat     $   0,  $   0
for     spacing-1
        dat     $   0,  $   0
rof

; ----- rock -----

rinc    equ     81
rhop    equ     5277+1
rclk    equ     1677
rorg    equ     rinc*rclk+1

rock    spl     #   0,  <rhop+1
rptr    mov      rbmb,  <rorg
        mov      rbmb,  @rptr
        sub     #rinc,   rptr
        djn.f    rptr,  <rhop-3
        dat     $   0,  $   0
        dat     $   0,  $   0
        dat     $   0,  $   0
rbmb    dat     <   1,  <rhop


for     spacing
        dat     $   0,  $   0
rof

; ----- p^3++ brain -----

PKEY    equ     137 ; really
SIZE    equ     10

main    ldp.a   #   0,   pmod
        ldp.a   #PKEY,   vect
        mod.ba  *pmod,   vect
        stp.b   *vect,  #PKEY
        mov.i   #0   ,  -1     ; amnesia
        add.ab  *vect,   last

for     SIZE
        mov     <last,  {last
rof

last    djn.f    *boot, #silk+SIZE

end main

