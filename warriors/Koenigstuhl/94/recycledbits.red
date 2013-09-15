;redcode-94
;name Recycled Bits--
;author David Moore
;strategy Five-way pwarrior
;strategy minus the sophisticated switcher which I haven't written yet  :(
;strategy The components are:
;strategy 1. The scanner from my round 1 entry
;strategy 2. paper also from round one
;strategy 3. kill -9, the bomb dodger from round 6
;strategy 4. a simple one-shot scanner
;strategy 5. stone like Alladin's Cave (see CW65)
;assert 1

org main

nStates equ 24
pKey equ 100
length equ 9
gate equ 3

d1 equ 4496
d2 equ 1283

a equ 4414
b equ 5428
c equ 5427

w1    jmp 5200, (w1-bp+length)+scan
w2    jmp 5200, (w2-bp+length)+paper
w3    jmp 1200, (w3-bp+length)+once
w4    jmp 5200, (w4-bp+length)+kill9
w5    jmp 2000, (w5-bp+length)+stone

      dat 0, brain-find+1
table dat 0, brain-find+1
      dat 0, brain-find-1
      dat 0, brain-find+1

      dat  0,  w1
brain dat  0,  w1
      dat  1,  w1
      dat  2,  w1
      dat  3,  w1
      dat  8,  w2
      dat  6,  w2
      dat  6,  w2
      dat  7,  w2
      dat  8,  w2
      dat 13,  w3
      dat 11,  w3
      dat 11,  w3
      dat 12,  w3
      dat 13,  w3
      dat 18,  w4
      dat 16,  w4
      dat 16,  w4
      dat 17,  w4
      dat 18,  w4
      dat 23,  w5
      dat 21,  w5
      dat 21,  w5
      dat 22,  w5
      dat 23,  w5
      dat  3,  w1

kill9 jmz.f   #0, }sp
      mov    <sp, {sp
      djn     -1, #(db-p2)+1
sp    jmp   db+1, db+1
p2    spl    #p2, db+1
      mov     db, >p2
      djn.f   -1, {p2
db    dat <(CORESIZE+1)/3, <((CORESIZE+1)/3)*2
      dat 0, 0

paper spl   1, >-250
      mov.i 1, #0
      spl   1, {-264

      spl @0, <d1
      mov }-1, >-1
      mov   3, >-2
      mov {-3, {1
      jmz.a d2, *0
      dat 1,1

once  add.ab  #9,  2
      jmz.f   -1, @1
      sub.ab  #5, #15
      spl  #6, 8
      mov *-2, >-2
      mov *-3, >-3
      jmp -2, 0
      spl  #1, 8
      dat <5334, <2667

scan  mov.b   2, #0
      mov    sb, >-1
      add #2891, #0-(2891*2209)
      jmz.f  -2, @-1
      jmn  scan, *scan
sb    spl     0,  0
      mov     2, >scan-gate
      djn.f  -1, >scan-gate
      dat     0,  2+gate-scan

main  ldp.a   #pKey, find
      mod.a #nStates, find
      ldp.a      #0, table
      add.ba *table, find
      stp.ab  *find, #pKey
find  mov    @brain, bp

    for length
      mov  <bp, {bp
    rof
      jmp  *bp, {bp

bp    jmp 5200, w1

stone mov  > a,   b
      add.f  1,  -1
      jmp   -2,   c

end
