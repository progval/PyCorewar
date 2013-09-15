; Copyright (c) 1997 by Brett Greenfield
;redcode-94nop
;name Super clone 2.2
;author Compudemon
;strategy 1+1 = 1000
;strategy drive anyone who reads the code nuts
;assert MAXPROCESSES>=8 && (!(CORESIZE%8000) || CORESIZE==55440)

bjs EQU (CORESIZE/2)
min EQU (CORESIZE/800)
fst EQU (min*389)
step EQU (min*73)

;ORG start
dr1 equ (1100)
dr2 equ (1200)
dr3 equ (1300)
dr4 equ (1400)

drlen equ (14)
tosser equ (tossed-drlen-1)

for drlen
 mov }mdrg,>mdrg
rof
mov.f mdrg+1,mdrg
tossed jmp tosser,}-1
 
ener

spl dr1+ener+ofst, 1
spl dr2+ener+ofst, 1
spl dr3+ener+ofst, 1
jmp dr4+ener+ofst, 1

mdrg dat stdr,dr1+ener
dat stdr-mdrg,dr2+ener-mdrg
dat stdr-mdrg,dr3+ener-mdrg
dat stdr-mdrg,dr4+ener-mdrg
dat tkil-mdrg,tosser+1-mdrg
tkil jmp ener-tosser-1, 1

ofst equ (start-tmp)
stdr equ tmp

tmp DAT sce+1,sce+1+fst
top MOV.A #sce+2,tmp
ADD #step+(sce-tmp),tmp
start MOV {tmp,<tmp
MOV {tmp,<tmp
JMN.A start,*tmp
SPL top,>tmp
JMP >tmp
for 5
DAT 1,1
rof
sce DAT 1,1
END

