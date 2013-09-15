;redcode-94
;name Invisigoth (2)
;author Anders Rosendal
;startegy P-space with 3 warriors
;assert CORESIZE==8000

step EQU 170
;step EQU 770
;bdist   equ   (3312)           ; multi-boot distance
bdist   equ   (250)           ; multi-boot distance

PSTATE EQU 250 ; pspace location containing current state
STATES EQU 9  ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

w2 EQU bootptr4  ; THE ANTI-STONE   (dd-clear) anti-stone
w0 EQU boot8     ; THE STONE        (stone)    anti-scissor
w1 EQU mboot     ; THE CORE CLEAR   (Clean)    anti-paper

;----------------------------------------
      dat    0,0  
in    dat    0,loss_table-state
p     spl    1,win_table-state
      spl    1,tie_table-state



think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state

win_table
tie_table      
state jmp    @0,w0              ; jump to warrior code

init_state
      spl    #0,w0
      spl    #0,w0
      spl    #3,w1
      spl    #3,w1
      spl    #3,w1
      spl    #6,w2
      spl    #6,w2
      spl    #6,w2

loss_table
      spl    #1,w0
      spl    #2,w0
      spl    #3,w1
      spl    #4,w1
      spl    #5,w1
      spl    #6,w2
      spl    #7,w2
      spl    #8,w2
      spl    #0,w0

;------CORE-CLEAR     ANTI-PAPER!!!---------------------
space   equ     (MINDISTANCE)
djnptr  EQU    600
;step    EQU   3120 ;mod-80 cc

loop    add.f  inc,ptr1
ptr2  
ptr1    sne.i  ptr2-1+step,ptr2-1-10+step
label   djn.f  loop, <-6 ;jmp loop
        mov.A  #clean-ptr2,ptr2
a2      spl    #a3-ptr2,#last-ptr2
clean   spl    #a2-ptr2,#last-ptr2    ; spl #X, <-Y acts like a split 0.
loop2   mov    *ptr2, >ptr2           ; and use the decrement in the b-field
        mov    *ptr2, >ptr2           ; and use the decrement in the b-field
        djn    loop2, <label-60
a3      dat    #0,last-ptr2
inc     dat    step,step
last dat 0,0


for 0
space   equ     (MINDISTANCE)

disp        equ     4
range       equ     15
stepc       equ     2360
offset      equ     (scanner+disp-range-100)


scanner     add.f   incr    ,   cnt
cnt         sne     offset-stepc  ,   offset+range-stepc
            djn.f   scanner ,   -stepc+1         ;Djn used as gate
incr        spl.f   #-stepc ,   >-stepc          ;>-step used as gate
cc          mov.i   @bombp  ,   }cnt           
            djn.f   cc      ,   <cnt           
bombp       dat     #8      ,   #1		;After 2 Spl passes the
            spl     #7      ,   #-85            ; Djn-stream will overwrite
                                                ; the bombp and the @bombp
                                                ; will points to the Dat
rof
;----------ANTI-STONE: Double d-clear ------------------
Dstep EQU 2150

ptr4            dat >6,Dstep
;bomb            dat >5335,bomb-ptr4+bootptr+1
bomb            dat >2667,bomb-ptr4+bootptr+1
                dat 0,0
start           spl #0,>ptr4
                mov.i bomb,>ptr4
                djn.f -1,>ptr4
                nop 0,0
                nop 0,0
start2          spl #0,>ptr4
                mov.i bomb,>ptr4
                djn.f -1,>ptr4
                jmp start
bootptr         dat ending+4,-12

bootptr4
        spl start
        jmp start2
start1    jmz.F  0,}bootptr
          sub.A  #6,bootptr
          mov.I  >bootptr,}bootptr
          mov.I  >bootptr,}bootptr
          djn.A  -2,ptr4
          sub.A  #4,bootptr
          spl.B  *bootptr
          sub.A  #5,bootptr
          jmp.B  *bootptr
for 0
ptr             dat >5,4000
                dat 0,0       
start           spl #0,>ptr
                mov.i bomb,>ptr
                djn.f -1,>ptr
bomb            dat >2667,bomb-ptr+1
rof

;----------STONE: Hit every core location---------------
ststep    equ     -845
djnoff  equ     split+ststep

boot8
MOV.A #clr-boot,boot
MOV.A #6,boff
JMP.B mboot+4

clr     spl     #0,     0
split   spl     #-ststep, <ststep
stone   mov     >-ststep, ststep+1
	add	split,  stone
cnt     djn.f	stone,	<djnoff
stptr   dat     0,0
	dat     0,0
cc      dat     0,      #stone-4
;-----------Multi-boot

mboot z for 11 ;11 hvis a3 skal med
        MOV.I     }boot,    >boot
rof
boot    MOV.I     loop,      bdist   ; fast boot away head first
boff    SUB.AB    #10,        boot
        SPL.B     @boot,     #1      ; split to main program
        MOV.I     0,         boot    ; obliterate boot pointer
ending
END think
