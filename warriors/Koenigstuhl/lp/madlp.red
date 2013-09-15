;redcode-lp
;name Mad LP
;author Christian Schmidt
;strategy scanner, stone/paper
;assert 1

step equ 6557
ptr equ (scan-8)

        dat      19,  19
diff    jmp  #-step, #-step
        spl  #0, 0
wipe    mov    diff, >ptr
w2      mov   *wipe, >ptr
        djn.a  wipe,  length

loop    sub    diff, @s2
scan    sne (step*2) - 1, (step*2) - 7
        sub    diff,  scan
s2      seq   *scan, @scan
        slt.a   #20,  scan
timer   djn    loop, #1400

length  sub.ba #0,  #-7
tweak   mov.ab @s2, @wipe
t2      jmn    *w2,  timer
        djn.a  <tweak, {t2

for 75
 dat 0,0
rof

switch ldp.ba what, what
       mod.a #3, what
       ldp.ab #0, switch
       add.a @switch, what
       stp.ab *what, what
what   jmp @0, scan
       dat 1, scan
       dat 0, scan
       dat 1, scan
       dat 1, scan
       dat 2, xGo
       dat 0, scan
       dat 1, scan

for 82-5
 dat 0,0
rof

sAwa1   equ   6897 
sAwa2   equ   2842
sAwa3   equ   4582
sStep   equ   1564
sStep2  equ   383

pStep1  equ   2990
pStep2  equ   1719

xGo     spl     pGo
qtab2   spl     2
        spl     1

        mov     <sa1,            {sa1
        mov     <sa2,            {sa2
        mov     <sa3,            {sa3
        jmp     *sa1,            }0

sa1      dat     pa1+sAwa1,       sEnd+1
sa2      dat     pa1+sAwa2,       sEnd+1
sa3      dat     pa1+sAwa3,       sEnd+1

        mov     <sStep2 ,       1+sStep
        sub     1,              -1
sEnd    jmp     -2,             <-sStep

pa1      mov     #6,             #6
pGo     mov     <pa1,            <j1
        jmn     -1,             @-2
        spl     @pa1,            <pStep2
j1      jmz.b   @0,             pStep1
b1      dat     {1,             <1

end switch

