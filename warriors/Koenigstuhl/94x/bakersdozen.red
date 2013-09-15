;redcode-94x
;name Bakers Dozen
;author Wayne Sheppard
;strategy Imp/stone
;contact wsheppar@st6000.sct.edu
;I have had little time to work on the big
;hill.  This is just something I had thrown together.
;assert CORESIZE==55440
;macro

;ZIP file preferred

nta equ start+400
istart equ start+700

spl 0,<-34117
mov <-21,1+586
add 1,-1
s jmp -2,<586

start mov s,nta+3
mov s-1,<-1
mov s-2,<-2
mov s-3,<-3
spl nta
spl nta
spl nta
spl nta
spl nta
;Binary imp launch
SPL 32
SPL 16
SPL 8
SPL 4
SPL 2
JMP istart+0
JMP istart+34117
SPL 2
JMP istart+12794
JMP istart+46911
SPL 4
SPL 2
JMP istart+25588
JMP istart+4265
SPL 2
JMP istart+38382
JMP istart+17059
SPL 8
SPL 4
SPL 2
JMP istart+51176
JMP istart+29853
SPL 2
JMP istart+8530
JMP istart+42647
SPL 4
SPL 2
JMP istart+21324
JMP istart+1
SPL 2
JMP istart+34118
JMP istart+12795
SPL 16
SPL 8
SPL 4
SPL 2
JMP istart+46912
JMP istart+25589
SPL 2
JMP istart+4266
JMP istart+38383
SPL 4
SPL 2
JMP istart+17060
JMP istart+51177
SPL 2
JMP istart+29854
JMP istart+8531
SPL 8
SPL 4
SPL 2
JMP istart+42648
JMP istart+21325
SPL 2
JMP istart+2
JMP istart+34119
SPL 4
SPL 2
JMP istart+12796
JMP istart+46913
SPL 2
JMP istart+25590
MOV imp,istart
JMP nta

for 120 ;decoy
mov 0,34117
rof

imp mov 0,34117
end start
