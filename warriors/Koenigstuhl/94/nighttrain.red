;redcode-94
;name Night Train
;author Karl Lewin
;assert CORESIZE==8000

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
s1      spl     go3,    <-4000  
s2      spl     go2,    <-5000
go1     jmp     @ptr1
go2     jmp     @ptr2   
go3     mov     {ptr3,  <ptr3
        jmp     @ptr3

ptr1    dat     last1+1,last1+1+OFFSET+INUM*0
ptr2    dat     last1+1,last1+1+OFFSET+INUM*1
ptr3    dat     last2+1,last1+1+OFFSET+INUM*2

is11    spl     D0,     0
im11    mov     >is11,  }is11
im12    mov     <is11,  <is12
is12    spl     @0,     }-D1
        mov.i   last1,  <-120
imp1    mov.i   #0,     INUM
last1   dat     <-10,   <-10

is21    spl     D0,     0
im21    mov     >is21,  }is21
im22    mov     <is21,  <is22
is22    spl     @0,     }-D1            
        mov.i   last2,  {79
imp2    mov.i   #0,     INUM
last2   stp.b   <-10,   <-10
