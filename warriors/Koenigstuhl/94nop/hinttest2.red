;redcode-b
;name Hint Test v2
;author M R Bremer
;strategy Original code based on Scott Manley's Mutagen
;strategy Once through scan --> spl spl dat dat coreclear 
;strategy Core_Warrior_ #2:  compressed code
;assert CORESIZE==8000

step EQU 11

begin   SPL     a1+2
        jmp start
for 20
        dat 0, 0
rof
start   add.f split, scan
scan    sne.i 112, 113   
        djn.f -2, <-400         ;djn.f will decrement both the a and b field
        mov.i split, *scan
        mov.i jump, @scan
        jmn.b -5, scan   
        jmp a1
split   spl #step, #step        ;try to find other uses for these
jump    jmp -1                  ;can be anywhere in code
        DAT     0 , 0
        DAT     0 , 0
        DAT     0 , 0
ptr1    dat a1, out+200
a4      dat 0,  out+2+1
a3      dat 1,  out+2+2
a2      spl #2, out+2+3
a1      spl #3, out+2+4
        mov *ptr1, >ptr1
        mov *ptr1, >ptr1
        mov *ptr1, >ptr1
out     djn.f -3, <4000
        END     begin
