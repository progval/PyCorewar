;redcode
;name Simple '88 v0.2
;author Ian Oversby
;strategy v0.1  Stone/Imp
;strategy v0.2  New imps, more decoy
;assert 1

gate1   equ     (init-3-dist)
impstep equ     2667    ; Probably doesn't do anything
pat     equ     95
sval    equ     5300    ; More or less
ival    equ     3300    ; More or less
dist    equ     3

st      equ     2667

;;-------------------------------------------------------------------

for 9
        SPL     0,      <1
        DAT     <1,     <1
        SPL     0,      0
rof

;;----------------------- Boot the stone ----------------------------

boot    MOV     gate,   @sptr
        SUB     #pat,   sptr 
        MOV     <spos,  @sptr
        SPL     iboot,  <-300
for 5
        MOV     <spos,  <sptr
rof

        SPL     @sptr,  <-200
        MOV     empty,  sptr

sptr    DAT     #0,     #sval+pat

init    SPL     0,      <-95
        SPL     0,      #0
loop    MOV     <pat-1, hit-pat
        ADD     clear,  loop
hit     DJN     loop,   <-2570
clear   MOV     pat,    <-pat

spos    DAT     #0,     #0

gate    DAT     <-96,   <-96

;;--------------------- Boot the imp/launch -------------------------

iboot   MOV     <ipos,  <iptr
for 5
        MOV     <ipos,  <iptr
rof
        SPL     @iptr,  <-300
        MOV     empty,  iptr

iptr    DAT     #ival,  #ival
empty   DAT     #0,     #0

spin    SPL     0
        ADD     #st+1,  jump
jump    JMP     @0,     impy-st-1
impy    MOV     0,      st
        MOV     0,      st
        MOV     0,      st

ipos    DAT     #0,     #0

;;-------------------------------------------------------------------

for 9
        SPL     0,      1
        DAT     #1,     <1
        SPL     0,      <1
        DAT     <1,     #1
rof

;;-------------------------------------------------------------------

end boot
