;redcode quiet
;name Simple '88
;author Ian Oversby
;strategy Imp/Stone
;assert 1

impstep equ     2667
sval    equ     1900
dist    equ     95

mimp    SPL     1,      <-500   ; 16 process 3 point imp
        SPL     1,      <-500   ; and decoy-maker :-)
        SPL     1,      <-500        
        SPL     1,      <-500        

        SPL     2,      <-500
        JMP     @0,     imp
        ADD     #impstep, -1
die     DAT     #0,     #0
imp     MOV     0,      impstep

boot    MOV     <pptr,  <sptr
for 5
        MOV     <pptr,  <sptr
rof
        SPL     @sptr,  <-300
        ADD     #dist+5,sptr
        MOV     gat,    @sptr
        MOV     die,    sptr
        JMP     mimp,   <-300
sptr    DAT     #0,     #sval
pptr    DAT     #0,     #gat

stone   SPL     0,      <-95
        SPL     0,      #0
loop    MOV     <95-1,  2-95
        ADD     last,   loop
hit     DJN     loop,   <-99
last    MOV     dist,   <-dist  ; Core-clear

gat     DAT     <-96,   <-96

end boot
