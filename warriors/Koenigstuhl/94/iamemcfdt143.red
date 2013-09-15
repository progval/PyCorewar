;Copyright (c) 1997 by Brett Greenfield
;redcode-94
;name I am EMCFDT 1.43
;author Compudemon
;strategy Ultimate thinking code
;strategy scores itself and selects the
;strategy best strategy
;strategy if anyone as a faster way to do this contact me
;strategy note the commented pengine it works well but not
;strategy better then the first why?
;strategy notice also the random paper
;assert (CORESIZE==8000) && (PSPACESIZE>0)

bjs EQU (4000)
min EQU (10)
fst EQU (min*389)
step EQU (min*73)

lsc LDP #0,lsc
lst LDP #1,lst
JMN gd,lsc
flt LDP #2,flt
JMZ bd,flt
SUB.BA lst,cn
cn STP #1,#1
JMP gd
bd MOV.A #1,gd
gd STP #0,#2
MOV 0,cn ; slows down code works better ?
MOV 0,gd ; these are not nessary but seem to improve performance
JMN ppr,lst
JMP scn

;lsc LDP #0,lsc
;lss LDP #1,lss
;SLT lss,#4000
;tbi ADD #3,#stb
;ADD lsc,tbi
;ADD @tbi,lss
;STP lss,#1
;SLT #4000,lss
;JMP ppr ; papper
;JMP scn ; scissors

for 10
DAT 0,0
rof

;DAT 0  ;data for other pengine
;stb DAT -7
;DAT 14
;DAT -1
;DAT 7
;DAT -14
;DAT 1
;DAT 0
;DAT 0
;DAT 0

;paper
st DAT -cpy,-cpy+230
top MOV st,cpy
ppr MOV }cpy,>cpy
MOV }cpy,>cpy
MOV }cpy,>cpy
JMN.A ppr,cpy
SPL <cpy
MUL #569,st
JMP top
cpy DAT st,st+230

for 10
DAT 0
rof

;cissors
scn SUB #9,#lsc
scl JMZ.B scn,@scn
sc2 JMN.B sc2,<scn
stk MOV trp,>scn
JMN.B stk,@scn
MOV tpe,@scn
CMP scn,#(ed-scn)
bl2 JMP scn,bl+1
kl MOV trp,>bl
MOV trp,{bl
DJN kl,#scn-ed
kl2 MOV bl,>bl2
MOV bl,{bl2
DJN kl2,#scn-ed
trp SPL #5,#0
tpe JMP -1,#0
bl DAT scn-1,2
DAT 0,0
for 9
DAT 1
rof
ed DAT 0
END
