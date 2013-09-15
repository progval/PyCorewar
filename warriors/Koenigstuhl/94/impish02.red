;redcode-94
;name Impish v0.2
;author Ian Oversby
;strategy Imp/Stone
;assert 1

gate1   equ     (init-3-dist)
pat     equ     95
sval    equ     5300    ; Not quite
ival    equ     3300    ; More or less
dist    equ     3
st      equ     2667

org boot

;;-------------------------------------------------------------------

for 8
        SPL.B   #1,     }1   
        STP.AB  #1,     {1
        SPL.B   #1,     {1
rof

;;----------------------- Boot the stone ----------------------------

boot    MOV.I   cbomb,  @sptr  
        MOV.I   <spos,  {sptr
        SPL.B   iboot,  <-300
for 6
        MOV.I   <spos,  {sptr
rof

        SPL.B   *sptr,  <-200

sptr    DIV.F   #sval,  #sval-7-3

cbomb   DAT.F   >2667,  #3+hit-gate1
; 2 DATS
init    SPL.B   #0,     <stone-pat
stone   SPL.B   #pat,   <-pat
loop    MOV.I   {0+pat, hit-pat
        ADD.F   stone,  loop
hit     DJN.F   loop,   <stone-pat
        MOV.I   init-dist, >gate1
last    DJN.F   -1,     >gate1

spos    DAT.F   $0,     $0

;;--------------------- Boot the imp/launch -------------------------

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

;;-------------------------------------------------------------------

for 14
        SPL.B   #1,     <1   
        STP.AB  #1,     }1
        SPL.B   #1,     >1
rof

end
