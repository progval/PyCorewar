;redcode-94
;name CrazyShot
;author Christian Schmidt
;strategy Q^3 -> .66c Bishot-style Scanner
;assert 1


sOff    equ     (20*sStep-1)
sStep   equ     10
sDelet  equ     205

sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        jmp     sOne,        >qC
table2  jmp     sBomb,       >qD
        dat     0,           >qE
sAdd    dat.f   sStep,       sStep
        dat     0,           0
        dat     0,           0           ;scanned
sPtr    spl     {sOff,       >4000+sOff-sDelet
        dat     {10,         >4010-sDelet
sBomb   spl     #20,         <-100
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb

for 52
dat 0, 0
rof


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

table1  djn.f sOne, #qB

decode  mul.b      *2,  dest
decide  sne   {table1, @dest
        add.b  table2,  dest
qloop   mov qb, @dest
dest    mov qb, *factor
        sub #7, dest
        djn qloop, #11
        djn.f sOne, #0
qb      dat {7*11-10, #qF
        end

