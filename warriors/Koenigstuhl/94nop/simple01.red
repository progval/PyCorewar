;redcode-94
;name Simple v0.1
;author Ian Oversby
;strategy Stone/Imp
;assert 1

impstep equ     2667
sval    equ     1300

org     boot

mimp    SPL.B   1,      <-200
        MOV.I   -1,     0
        SPL.B   1,      <-300
        SPL.B   1,      <-400        

        SPL.B   2,      <-500
        JMP.B   imp
        ADD.A   #impstep, -1
die     DAT.F   #0,     #0
imp     MOV.I   #-5,    impstep

boot    MOV.I   {sptr,  <sptr
for 5
        MOV.I   {sptr,  <sptr
rof
        SPL.B   @sptr
        MOV.I   die,    sptr
        JMP.B   mimp
sptr    DAT.F   last+1, sval


stone   SPL.B   #95,    <-95
        SPL.B   #0,     <-96
loop    MOV.I   {94,    -93
        ADD.F   stone,  loop
        DJN.F   loop,   <1300
last    MOV.I   1,      <-6

for 75
        DAT.F   $0,     $0
rof

        END

