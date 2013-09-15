;redcode-94
;name Invisigoth
;author Anders Rosendal
;assert CORESIZE==8000

PSTATE EQU 250 ; pspace location containing current state
STATES EQU 9  ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

w0 EQU cleanboot ; THE CORE CLEAR   (Clean)    anti-paper
w1 EQU boot9     ; THE SCANNER      (scan)     anti-scissor
w2 EQU bootptr4  ; THE ANTI-STONE   (dd-clear) anti-stone
w3 EQU catch     ; THE STONE        (catch)    anti-scissor


;bdist   equ   (3312)           ; multi-boot distance
bdist   equ   (-150)           ; multi-boot distance


;---------The Scanner-------------------------------
step9   EQU    1388
;leep9   EQU    -80
;step9   EQU    8*257

boot9
        MOV.A   #(ptr9-1)-boot,boot ; Set component boot pointer
        JMP.B   mboot+1,  #1        ; Jump to multi-boot routine

        add.F bomb9,ptr9
ptr9    seq    -2+step9*2,-2+4*3+step9*2
        slt    #boot+bdist+ending+145,ptr9
        jmp    ptr9-1
loop9   mov.I  bomb9, }ptr9        ; and use the decrement in the b-field
        mov.I  bomb9, <ptr9        ; and use the decrement in the b-field
snoop2  jmp    loop9               ; the b-field of ptr9 to move the bomb
bomb9   dat step9,step9


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
      spl    #9,w3
      spl    #9,w3
      spl    #9,w3
tie_table      
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #3,w1
      spl    #3,w1
      spl    #3,w1
      spl    #6,w2
      spl    #6,w2
      spl    #6,w2
      spl    #9,w3
      spl    #9,w3
      spl    #9,w3

loss_table
      spl    #1,w0
      spl    #2,w0
      spl    #3,w1
      spl    #4,w1
      spl    #5,w1
      spl    #6,w2
      spl    #7,w2
      spl    #8,w2
      spl    #9,w3 
      spl    #10,w3
      spl    #11,w3
      spl    #0,w0

for 0
init_state
      spl    #0,w0
      spl    #2,w1
      spl    #2,w1
      spl    #4,w2
      spl    #4,w2
      spl    #6,w3
      spl    #6,w3
tie_table      
      spl    #0,w0
      spl    #0,w0
      spl    #2,w1
      spl    #2,w1
      spl    #4,w2
      spl    #4,w2
      spl    #6,w3
      spl    #6,w3

loss_table
      spl    #1,w0
      spl    #2,w1
      spl    #3,w1
      spl    #4,w2
      spl    #5,w2
      spl    #6,w3
      spl    #7,w3
      spl    #0,w0
rof

;------CORE-CLEAR     ANTI-PAPER!!!---------------------
space   equ     (MINDISTANCE)

cleanboot
        MOV.A   #scanner-boot,boot ; Set component boot pointer
        JMP.B   mboot+1,  #1        ; Jump to multi-boot routine

disp        equ     4
range       equ     15
stepc       equ     30
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

;----------STONE: Catch the stone ---------------

step    EQU    1385

catch   MOV.A   #loop-boot,boot ; Set component boot pointer
        MOV.A   #5,       boff      ; Adjust for starting offset
        JMP.B   mboot+3,  #1        ; Jump to multi-boot routine

loop    mov.I  bombs,@ptr
        mov.I  bombs,*ptr
        add.F  bombs,ptr
        jmp.B  loop, <loop-2
bombs   dat    step, step
ptr     dat    -1+200,-1+200+800*step

;----------ANTI-STONE: Double d-clear ------------------
shift           equ 1000

ptr4            dat >0,4000
		dat 0,0
start           spl #0,>ptr4
                mov.i bomb,>ptr4
                djn.f -1,>ptr4
bomb            dat >2667,bomb-ptr4+last+1
start2          spl #0,>ptr4
                mov.i bomb,>ptr4
                djn.f -1,>ptr4
last


bb4             spl start2+bdist-(boff-17)
bootptr4
        MOV.I   bb4,      boff+2

;----------ANTI-STONE: Double d-clear ------------------


mboot z for 8
        MOV.I     }boot,    >boot
rof
boot    MOV.I     ptr4,      bdist   ; fast boot away tail first
boff    SUB.AB    #6,        boot
        SPL.B     @boot,     #1      ; split to main program
        MOV.I     0,         boot    ; obliterate boot pointer
        MOV.I     0,         boot    ; obliterate boot pointer
ending dat 0,0
END think
