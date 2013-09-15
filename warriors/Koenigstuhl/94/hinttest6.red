;redcode-b
;name Hint Test v6
;author M R Bremer
;strategy Original code based on Scott Manley's Mutagen
;strategy Once through scan --> spl spl dat dat coreclear 
;strategy Core_Warrior_ #2:  compressed code
;strategy Core_Warrior_ #4:  improved scanner
;strategy Core_Warrior_ #6:  pspaced with small bomber
;assert CORESIZE==8000

org start

dist equ 98
scan equ dist*2     

begin   SPL     b1+2
	jmp a
for 20
	dat 0, 0
rof
a       add d,c
c       cmp a+2*dist,a+dist
	slt.a #dist+ptr2-a, c
	djn.f a,<7000
	mov s, *c
x       mov m, @c
	jmn a,a
s       spl #-dist+1, <0
	jmp b1
d       dat <scan,<scan
m       mov.i dist, }dist          
	dat 0, 0
	dat 0, 0
	dat 0, 0
	dat 0, 0
	dat 0, 0
b3      dat <2667, <2667*2      ;a suggestion by Paulsson to kill imps
b2      spl #b3-ptr2, a-2-6
b1      spl #b2-ptr2, a-2-5
	mov *ptr2, <ptr2
	mov *ptr2, <ptr2
	mov *ptr2, <ptr2
	djn.f -3, <6000
ptr2    dat b1, -100+a

for 21
	dat 0, 0
rof
start   ldp #0, #0
	ldp #1, #0
	cmp.b -2, -1
	jmp bomber, {4000
	stp #1, #1
	jmp begin, {4000
bomber  stp #0, #1
	jmp juliet, {3000
for 19
	dat 0, 0
rof


juliet  spl #445, <-445
	spl #0, <-446
	mov {445-1, -445+2
	add -3, -1
	djn.f -2, <-2667-500
	mov.i 1, <-6
