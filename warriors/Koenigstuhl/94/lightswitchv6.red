;redcode-94
;name LightSwitch v6
;author Ryan Coleman
;strategy pswitcher for 3 components
;assert 1

;---- please reply when received and if there are problems-----
org think

PSTATE    EQU 666 
STATES EQU 9      

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think ldp.a  #0,in              
load  ldp.a  #PSTATE,state      
     ; mod.a  #STATES,state      ; screw brainwash protection
      add.ba *in,state           ;feel there is no danger
store stp.a  *state,load    
state jmp    @0             


c1 EQU time             ;paper
c3 EQU scissor_boot     ;scissor
c2 EQU stone_boot       ;stone

loss_table
  dat 1,c1
  dat 2,c1
  dat 3,c2
  dat 4,c2
  dat 5,c2
  dat 6,c3
  dat 7,c3
  dat 8,c3
 ; dat 0,c1  ;same as next line, so not necessary

win_table
tie_table
  dat 0,c1
  dat 0,c1
  dat 0,c1
  dat 3,c2
  dat 3,c2
  dat 3,c2
init_state  dat 6,c3
  dat 6,c3
  dat 6,c3

;----------------paper----------
TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

time    spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

;-------------------scissor--------

step EQU 9
ptr EQU (bomb-5)

bomb: spl    #1,{1
kill: mov    bomb,<ptr
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #step+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill

;----------------------stone--------------
dbomb   dat     >-1, >1
carb    spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1 
        djn.f   -2, <-1151

;---------------stone_boot--------
boot1 EQU 3000

stone_boot
   mov.i   dbomb+0,dbomb+0+boot1
   mov.i   dbomb+1,dbomb+1+boot1
   mov.i   dbomb+2,dbomb+2+boot1   
   mov.i   dbomb+3,dbomb+3+boot1   
   mov.i   dbomb+4,dbomb+4+boot1   
   jmp.a   carb+boot1, carb+boot1

;-----------scissor-boot-------
boot2 EQU 2666

scissor_boot
  mov.i bomb+0,bomb+0+boot2
  mov.i bomb+1,bomb+1+boot2
  mov.i bomb+2,bomb+2+boot2
  mov.i bomb+3,bomb+3+boot2
  mov.i bomb+4,bomb+4+boot2
  mov.i bomb+5,bomb+5+boot2
  mov.i bomb+6,bomb+6+boot2
  mov.i bomb+7,bomb+7+boot2
  mov.i bomb+8,bomb+8+boot2
  mov.i bomb+9,bomb+9+boot2
  jmp.a a+boot2,a+boot2   ;yes i know proper place is kill, but 
;the ruling was that you were allowed to start at a diff location

;--------decoy-------
;  i like div.ab #0,#1 to kill others
;  there are probably better decoys but i'm lazy
for (MAXLENGTH-CURLINE)
div.ab #0,#1
rof

end
