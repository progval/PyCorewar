;redcode-94
;author Compudemon
;name Wizard 1.2
;strategy ultimate 2 way switcher
;strategy speed speed speed hahaha
;strategy fastest pcode ever!!! (no really)
;strategy i have favored speed over brains
;strategy kill off slower strategies
;strategy contains three programs but uses two
;assert 1

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870
step EQU 9
ptr EQU (bomb-5)

org psw

; Mini HSA

bomb spl    #1,{1
kill mov    bomb,<ptr ; start here
mptr mov    >ptr,>ptr
     jmn.f  kill,>ptr
a    add    #step+1,@mptr
scan jmz.f  a,<ptr
     slt    @mptr,#btm-ptr+3
     djn    kill,@mptr
     djn    a,#16
btm  jmp    a,{kill

for 5
 dat 0
rof

; Carbonite
dbomb   dat     >-1, >1
rck     spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
        djn.f   -2, <-1151

for 5 
 dat 0
rof

; pcode
psw ldp #0,psw
jmn kill,<psw 

; Timescape (1.0)

ppr     spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

end
