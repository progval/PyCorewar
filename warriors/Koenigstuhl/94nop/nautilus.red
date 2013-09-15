;redcode
;name Nautilus
;author Mole IX
;strategy please please don't kill me too fast
;assert CORESIZE==8000

first   equ     100     ;20
second  equ     100+13  ;20+15
step    equ     2*13    ;2*15

b       dat.f   5,      5
s       dat.f   step,   step

dodaj   add.f   s,      @2
	mov.i   b,      @scan
	mov.i   b,      *scan
scan    sne     *first, @second
	jmp     dodaj,  <-1000
	mov.ab  scan,   bom
	spl     drugi
bom     spl     #b1,    clear+1
	mov.i   *bom,   >bom
	djn     -1,     {-100
b3      dat.f   #b3-bom,        clear+1-bom
b2      spl     #b3-bom,        clear+1-bom
b1      spl     #b2-bom,        clear+1-bom

drugi   mov.ab  scan,   dr
	add.ab  #3960,  dr
dr      spl     #b1,    clear+1
	mov.i   *dr,    >dr
	djn     -1,     #1000
	dat     0,      0
clear

end     dodaj
