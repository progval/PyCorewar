;redcode-94x
;name Rubber Snake
;author Compudemon
;strategy slither through core
;assert 1

prm EQU (271)
ofst EQU (CORESIZE/2)

MOV 7,ofst
MOV 7,ofst
MOV 7,ofst
MOV 7,ofst
MOV 7,ofst
SPL ofst-4
JMP top
kbl DAT <-5,>2
SPL #20,<-2
rck MOV.I kbl,-2
ADD #5*prm,rck
JMP rck,<-5

top MOV imp,@fsl
SPL @fsl
MUL #3,fsl
fsl JMP top,#10
imp MOV.I #-1,1
END
