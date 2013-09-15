;redcode-94
;name Door Mat v0.1
;author K Lewin
;assert 1

STEP    EQU     85
D0      EQU     745
D1      EQU     5185
OFFSET  EQU     500
INUM    EQU     2667
        ORG     first

first   spl     1,      <-2000
        spl     1,      <-3000
        mov     -1,     0
m1      mov     {ptr1,  <ptr1
m2      mov     {ptr2,  <ptr2
m3      mov     {ptr3,  <ptr3
s1      spl     go3,    <-4000  
s2      spl     go2,    <-5000
go1     jmp     @ptr1,  <-5998
go2     jmp     @ptr2,  <-5999  
go3     mov     first-1,@-6000
        jmp     @ptr3
for 24  
        dat     0,0
rof

ptr1    dat     last1+1,last1+1+OFFSET+INUM*0
ptr2    dat     last2+1,last1+1+OFFSET+INUM*1
ptr3    dat     last3+1,last1+1+OFFSET+INUM*2

for 24  
        dat     0,0
rof

is11    spl     D0,     0
im11    mov     >is11,  }is11
im12    mov     <is11,  <is12
is12    spl     @0,     }-D1
        mov.i   last1,  <-20
imp1    mov.i   #INUM,  *0
last1   dat     1,      1

for 8
        dat 0,0
rof

is21    spl     D0,     0
im21    mov     >is21,  }is21
im22    mov     <is21,  <is22
is22    spl     @0,     }-D1
        mov.i   last2,  }20
imp2    mov.i   #INUM,  *0
last2   mov     100,    <-6

for 8
        dat 0,0
rof

is31    spl     D0,     0
im31    mov     >is31,  }is31
im32    mov     <is31,  <is32
is32    spl     @0,     }-D1
        mov.i   last3,  <-20
imp3    mov.i   #INUM,  *0
last3   stp     #0,     <-22
