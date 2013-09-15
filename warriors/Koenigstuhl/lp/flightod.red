;redcode-94
;name Flight of Dragons
;author Ian Oversby
;strategy  Forget '94 part ;-)
;assert 1

pat     equ     95              ; Simple '88
dist    equ     5500
idist   equ     3200
st      equ     2667

;------------------------------------------------------------

ill     MOV     <spin,  <iptr
        DJN     -1,     #6
iptr    JMP     @0,     idist

spin    SPL     0,      impy+3
        ADD     #st+1,  jump
jump    JMP     @0,     impy-st-1
impy    MOV     0,      st
        MOV     0,      st
        MOV     0,      st

;------------------------------------------------------------

for (MAXCYCLES != 80001)
tiny    SPL.B   #76,    <-76
tloop   MOV.I   {0+76,  thit-76
        ADD.F   tiny,   tloop
thit    DJN.F   tloop,  <-4270
        MOV.I   76,     <-76
        JMP.B   -1      <-76-2667

tbit    DAT     #0,     #0
rof

;------------------------------------------------------------

hstart  JMP     1,      0       ; How to avoid this?

for (MAXCYCLES <= 80000 && MAXPROCESSES != 8)   ; This is the 94 bits
        SPL.B   1,      <-400
        MOV.I   -1,     0
        SPL.B   1,      {-400

hard    SPL.B   @0,     >1400
        MOV.I   }-1,    >-1
        SPL.B   #0,             >-700
        SPL.B   imp+5334,       >-701
        SPL.B   imp+2667,       >-702
imp     MOV.I   #2667,  *0
rof

;------------------------------------------------------------

for (MAXCYCLES == 80001)        ; '88 round
        MOV     gate,   ptr+dist+pat-1
        SPL     ill,    <-700
rof

for (MAXPROCESSES != 8)         ; '88 round
        MOV     <clear+1,       <ptr
rof
for (MAXPROCESSES == 8)         ; Limited process round
        MOV     <tbit,  <ptr
rof
        DJN     -1,     #6
ptr     JMP     @0,     dist

gate    DAT     <-96,   <-96

init    SPL     0,      <-95
        SPL     0,      #0
loop    MOV     <pat-1, hit-pat
        ADD     clear,  loop
hit     DJN     loop,   <-2570
clear   MOV     pat,    <-pat

end hstart

