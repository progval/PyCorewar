;redcode-b
;name Hint Test v4
;author M R Bremer
;strategy Original code based on Scott Manley's Mutagen
;strategy Once through scan --> spl spl dat dat coreclear 
;strategy Core_Warrior_ #2:  compressed code
;strategy Core_Warrior_ #4:  improved scanner
;assert CORESIZE==8000

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
        mov *ptr2, <ptr2
d       dat <scan,<scan
m       mov.i dist, }dist          
        dat 0, 0
        dat 0, 0
        dat 0, 0
        dat 0, 0
b5      dat 0, 0
b4      dat b5-ptr2, a-2-8
b3      dat b4-ptr2, a-2-7
b2      spl #b3-ptr2, a-2-6
b1      spl #b2-ptr2, a-2-5
        mov *ptr2, <ptr2
        mov *ptr2, <ptr2
        mov *ptr2, <ptr2
        djn.f -3, <6000
ptr2    dat b1, -100+a
        END     begin
