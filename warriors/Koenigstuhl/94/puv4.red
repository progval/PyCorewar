;redcode-b verbose
;name p-U v.4
;author Ryan Coleman
;strategy P^2 --> scissor / paper
;strategy v.2 booted the scissor
;strategy v.3 used a better boot and boot const
;strategy v.3 overwrote ldps and stps when papering
;strategy v.4 changed components
;strategy testing shows i'm gonna lose--but no time to write decent 
;strategy warriors till after tomorrow 
;assert 1

org think

PSTATE    EQU 666 ; pspace location containing current state
STATES EQU 6      ; maximum number of states for brainwash protection

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
state jmp    @0                 ; jump to warrior code

      ; You could also delete the #PSTATE value
      ; if you wish or the stp.a instruction.

c1 EQU boot2
c2 EQU overwrite

loss_table
  dat 1,c1
  dat 2,c1
  dat 3,c2
  dat 4,c2
  dat 5,c2

win_table

tie_table
  dat 0,c1
  dat 0,c1
init_state dat 0,c1
  dat 3,c2
  dat 3,c2
  dat 3,c2


;----------scissor------------


step EQU 9
ptr EQU (bomb-5)
away EQU (-4000) ; not the actual value

bomb  spl    #1,{1
kill  mov    bomb,<ptr
mptr mov    >ptr,>ptr
      jmn.f  kill,>ptr
a     add    #step+1,@mptr
scan  jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm   jmp    a,{kill

boot2 mov    btm,@dest
N FOR 8
      mov    btm-N,<dest
ROF
      spl    @dest,1
dest  mov    #250,@away
      mov    bomb,<dest
      div.f  #0,dest

;----------------paper---------------

space    equ (4-40*127)
boot     equ (30*127+50)
dv       equ (c0+58)
dvins    mov   101,{1               ; pretty good bomb


dh       mov dvins,dv+boot       ; position dv-bomb as needed
         mov dvins,dv
         spl 1,>-2002            ; make 8 processes
         spl 1,>-2001
         spl 1,>-2000
         mov <s2,{s2             ; boot one copy of Die Hard
s2       spl c0+boot+8,c0+8

c0       spl   @0,space          ; here is Die Hard
         mov   }c0,>c0
cs       spl   #0        ,}dv    ; following lines execute in reverse 
order
         mov   dv        ,}dv+space
cb       add.a #119      , dv+space
         spl   imp+5334  ,}dv+space
         spl   imp+2667  ,}dv+space
imp      mov.i #2667 ,*0

;-------------overwrite--------

overwrite mov.i tie_table+1, think
mov.i tie_table, think+1
mov.i tie_table-1, think+2
mov.i tie_table, think+3
mov.i tie_table+1, think+4
mov.i tie_table-1, think+5
jmp dh,dh

;-----decoy stuff-----

for (MAXLENGTH-CURLINE)
spl.f #1,#1
rof

end
