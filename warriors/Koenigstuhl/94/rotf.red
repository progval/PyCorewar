;redcode-94
;name Return of the Fugitive
;author David Moore
;strategy qscan, silk, imps
;assert 1

factor equ 5020
qA equ 213
qB equ 2792
qC equ 3742
qD equ 6321
qE equ 900
qF equ 2317

;-----------
; quick bomb
;-----------

decode  mul.b      *2,  dest
decide  sne   {table1, @dest
        add.b  table2,  dest
        mov      wash, >dest
        mov     jbomb, >dest
        add.ba   dest,  dest
        mov     dbomb, *dest
        mov     dbomb, @dest
dest    mov        24, @factor
        sub      qsub,  dest
        djn        -4, #5
        djn.f    boot, #0

wash    stp.ab  #qF+117, #qF
jbomb   djn.f      -1,  -1
dbomb   dat       {-1, <11

;-----------
; quick scan
;-----------

qscan   seq dest+factor, dest+factor+qD
qsub    jmp decide, 23   ; jmp -15, 23

        sne dest+factor*qE, dest+factor*qE+qE
	seq <table2+1, dest+factor*(qE-1)+(qE-1)
        jmp decode, }decode+2

        sne dest+factor*qF, dest+factor*qF+qD
	seq <wash, dest+factor*(qF-1)+qD
        jmp decode, }decode

        sne dest+factor*qA, dest+factor*qA+qD
	seq <table1-1, dest+factor*(qA-1)+qD
        djn.a decode, {decode

        sne dest+factor*qB, dest+factor*qB+qD
	seq <table1, dest+factor*(qB-1)+qD
        jmp decode, {decode

        sne dest+factor*qC, dest+factor*qC+qC
	seq <table2-1, dest+factor*(qC-1)+(qC-1)
        jmp decode, {decode+2

        seq dest+factor*(qC-2), dest+factor*(qC-2)+(qC-2)
        djn decode, {decode+2
 
        sne dest+factor*qD, dest+factor*qD+qD
	seq <table2, dest+factor*(qD-1)+(qD-1)
        jmp decode, qA

table1  djn.f boot, #qB

  for MAXLENGTH-CURLINE-13
    dat 0,0
  rof

;---------------
; Silk with Imps
;---------------

impy equ 2667
aaa  equ 1880
bbb  equ 2050
ccc  equ  240

boot    spl 1, >qC
table2  spl 1, >qD
        spl 1, >qE
        mov <1, {1
        spl ccc+paper+8, paper+8

paper   spl  @0, >aaa
        mov }-1, >-1
        spl  @0, >bbb
        mov }-1, >-1
        spl  @0, <2668
        mov }-1, >-1
        mov.i #2*aaa, }-aaa
        mov.i #bbb, impy

end qscan
