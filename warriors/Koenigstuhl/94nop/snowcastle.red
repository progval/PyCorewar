;Copyright (c) 1997 by Brett Greenfield
;redcode-94x
;name Snow Castle
;author Compudemon
;assert (CORESIZE==8000) || (CORESIZE==800)

prm EQU (19)

ORG scn

wl1 DAT trp+1,0
scn ADD #5*prm,snl
snl JMZ.F scn,0
snb ADD #5,snl
MOV #5,ctr
frz MOV trp,<snl
MOV trp,<snl
ctr DJN frz,#0
wl2 DJN scn,#3
top MOV trp,}wl1
MOV trp,<wl1
JMN.A top,wl1
JMP kl,0
tmp DAT -1,trp
kl MOV bl,{tmp
MOV bl,>tmp
JMN kl,tmp
JMP 0,0
bl DAT 1,1
trp SPL -1,1
end

