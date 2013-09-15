;redcode-94 test
;name Anti Head
;author Ian Oversby
;strategy Optimised against the head (not)
;strategy No simulator unfortunately
;assert 1

ddist   equ     -2830
idist   equ     2740
st      equ     1143

org boot

boot    MOV.I   <dloc,  <dpos
	SPL.B   impb,   >-200
for 5
	MOV.I   <dloc,  <dpos
rof
dpos    JMP.B   ddist,  #ddist+4

impb    MOV.I   <iloc,  {ipos
for 4
	MOV.I   <iloc,  {ipos
rof
ipos    JMP.B   boot+idist, <-200

spin    SPL.B   #0,     >prime
prime   MOV.I   impy,   impy
	ADD.F   #st+1,  jump
jump    JMP.B   impy-st-1, <-535
impy    MOV.I   #st,    *0
iloc    DAT.F   $0,     $0

gate    DAT.F   >5335,  #3600
bomb    DAT.F   >5335,  #15
first   SPL.B   #0,     >gate-2667
	SPL.B   #0,     >gate-2667
	MOV.I   bomb,   >gate
str     DJN.F   -1,     >gate
dloc    DAT.F   $0,     $0

for 24
	SPL.B   #1,     >1
	SPL.B   #1,     <1
	SPL.B   #1,     #1
rof

end
