;redcode-94
;name Stylized Euphoria
;author Ken Espiritu
;strategy qscan -> paper/imp
;strategy q^4 -> Fixed variant
;strategy SPL carpet resistant silk
;strategy computer optimized against the following warriors:
;strategy goonie,Draken Fire,Zooom,QHSA,Mini-Blur,Iron Curtain,
;strategy Win!,Mini-HSA,Seven-Eleven,Torch t18,One-pass Blur,QHSA2
;assert 1

org qscan

factor equ 7552
qA equ 4295
qB equ 2246
qC equ 3208
qD equ 1159
qE equ 7110
qF equ 7805

qscan   seq dest+factor, dest+factor+qD
        jmp decide, {dest+factor+7

        sne dest+factor*qE, dest+factor*qE+qE
        seq <table2+1, dest+factor*(qE-1)+(qE-1)
        jmp decode, }decode+2

        sne dest+factor*qF, dest+factor*qF+qD
        seq <qb, dest+factor*(qF-1)+qD
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

table1  djn.f st, #qB

decode  mul.b      *2,  dest
decide  sne   {table1, @dest
        add.b  table2,  dest
qloop   mov qb, @dest
dest    mov qb, *factor
	sub #7, dest
	djn qloop, #11
	djn.f st, #0
qb      dat {7*11-10, #qF

for 52
dat 0,0
rof

st     SPL.B  $     2, {qC     
table2 SPL.B  $     2, {qD     
       SPL.B  $     1, {qE     
       MOV.I  {     3, {     2     
       MOV.I  {     2, {     1     
       SPL.B  $  3352, }ff-1429+2     
       SPL.B  @    10, }  -782     
       MOV.I  }    -1, >    -1     
       MOV.I  }    -2, >    -2     
       SPL.B  @     0, {  2023     
       MOV.I  }    -1, >    -1     
       SPL.B  @     0, }  1879     
       MOV.I  }    -1, >    -1     
ff     MOV.I  # -3399, } -1429     
       MOV.I  #  2908, } -3819     
       MOV.I  #  1169, }   772     

