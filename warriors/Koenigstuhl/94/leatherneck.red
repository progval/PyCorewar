;redcode-94
;name LeatherNeck
;author Robert Hale
;assert CORESIZE == 8000
;strategy pspace scanner, stone/imp
;s trategy mini hsa and impish
;s trategy 
;s trategy The more I play with impish the happier I am with it.
;s trategy It is a great warrior.  Kudos to Ian Oversby.

;*************************************************
;************* The Stone *************************
;*************************************************
;18 instructions

gate1   equ     (init-3-dist)
pat     equ     95
sval    equ     5300	
ival    equ     3300	
dist    equ     3
st      equ     2667

boot    MOV.I   cbomb,  @sptr  
        MOV.I   <spos,  {sptr
        SPL.B   iboot,  <-300
for 6
        MOV.I   <spos,  {sptr
rof

        SPL.B   *sptr,  <-200

sptr    DIV.F   #sval,  #sval-7-3

cbomb   DAT.F   >2667,  #3+hit-gate1
init    SPL.B   #0,     <stone-pat
stone   SPL.B   #pat,   <-pat
loop    MOV.I   {0+pat, hit-pat
        ADD.F   stone,  loop
hit     DJN.F   loop,   <stone-pat
        MOV.I   init-dist, >gate1
last    DJN.F   -1,     >gate1

spos    DAT.F   $0,     $0

;*************************************************
;************ The imp ****************************
;*************************************************
;14 instructions

iboot   MOV.I   <ipos,  <iptr
for 4
        MOV.I   <ipos,  <iptr
rof
        SPL.B   @iptr,  <-300

iptr    DIV.F   #ival,  #ival
        DAT.F   $0,     $0

spin    SPL.B   #0,     >prime
prime   MOV.I   impy,   impy
        ADD.A   #st+1,  jump
jump    JMP.B   impy-st-1, 0
impy    MOV.I   #st,    *0

ipos    DAT.F   $0,     $0

;*************************************************
;********** The Brain ****************************
;*************************************************
;8 instructions

_RES    equ     0
_STR    equ     72

brain
res     ldp.ab  #_RES, #0
        ldp.a   #_STR, str1
        sne.ab  #0, res        ;switch on loss
lost    add.a   #1, str1
        mod.a   #2,     str1
        stp.ab  str1, #_STR
str1    jmp     @0, hboot
        dat     0, boot

;*************************************************
;*********** The Scanner *************************
;*************************************************
;25 instructions

hstep EQU 9
ptr EQU (bomb-5)
away EQU (1550)

bomb: spl    #1,{1
kill: mov    bomb,<ptr
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #hstep+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill

hboot: mov    btm,@dest
N FOR 8
      mov    btm-N,<dest
ROF
      spl    @dest,1
dest: mov    #250,@away
      mov    bomb,<dest
      div.f  #0,dest

      dat    0,0

	end  brain
