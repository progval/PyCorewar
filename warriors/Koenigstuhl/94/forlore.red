;redcode-94
;assert CORESIZE==8000
;name Forgotten Lore
;author David Moore
;strategy vampire or one-shot
;strategy switch on loss

second spl #0, -5800
       spl #0, 0
       djn.f -2, >-2

  for 14
    dat 0,0
  rof

enter  spl second, 2
       spl #0, {0
       spl #0, }0
       stp.a @-2, -1

  for 15
    dat 0, 0
  rof

step  equ 82
first equ (1 + step*5)
trap  equ (-1 - step*22)
fang  equ (vamp + 2 + step)

gate  equ (clr - 4)
db    equ (clr - 3)

vamp    spl #0, 4
        mov       @1, @fang
        add.f #-fang,  fang
        djn.f     -2, *fang

src_J   jmp trap-first, first

src_G   dat 0, 6438
src_D   dat <2667, 12

clr     spl   #0,  4
        mov   db, >gate
        djn.f -1, >gate
        dat    0,  0

loc_V  equ (enter - trap - step - 2)
loc_C  equ (loc_V + step*2)

boot    spl boot2, <5057
        spl 1, <4810
        spl 1, <4563
        mov <clr, {dest_C
        mov <vamp, {dest_V
dest_V  jmp loc_V + 4, enter - trap

boot2   mov src_G, >dest_C
        mov src_D, >dest_C
        mov src_J, @dest_V
dest_C  spl loc_C + 4, loc_C - 4
        mov <5293, dest_V
        mov <5538, dest_C
        dat 0, 0

  for 2
    dat 0,0
  rof

        dat 0, 0
empty   dat 0, 0
        dat 0, 0
        dat 0, 0

think   ldp.ab pp, pp
        ldp.ab }empty, empty
        add.ab @empty, pp
        mod.ab  #2, pp
pp      stp.ba #50, #0
        jmz.b   boot, pp

dest equ 5000

        mov s04, >loc
        mov s17, {loc
        mov s16, {loc
        mov s15, {loc
        mov s14, {loc
        mov s05, >loc
        mov s06, >loc
        mov s07, >loc
        mov s08, >loc      
hide    mov s01, loc+dest-13
loc     spl dest+4, dest-10
        mov s13, {loc
        mov >200, loc
        div.f #0, hide

        dat 0, 0
        dat 0, 0
        dat 0, 0

s17     JMP.B  }    -9, $    -8
s16     MOV.F  $    -2, $   -16
s04     JMP.B  $  -400, <  2667
s15     JMZ.F  $    -2, <    -1
s14     SNE.I  $ -3967, $    42
s13     SUB.X  $     4, $     1
s08     DJN.B  $    -3, {    -3
s07     MOV.I  $    -6, }    -7
s01     JMP.B  $ -3991, $    18
s06     MOV.I  @     2, >    -6
s05     SPL.B  # -3400, $    12

end think

