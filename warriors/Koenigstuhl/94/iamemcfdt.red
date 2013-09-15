;redcode-94
;name I am EMCFDT
;author Compudemon 
;strategy Ultimate thinking code
;strategy scores itself and selects the
;strategy best strategy
;strategy if anyone as a faster way to do this contact me
;assert (CORESIZE==8000) && (PSPACESIZE>0)

bjs EQU (4000)
min EQU (10)
fst EQU (min*389)
step EQU (min*73)

;show on
lsc LDP #0,lsc
SNE #-1,lsc
JMP set
lst LDP #1,lst
scc LDP #2,scc
ppc LDP #3,ppc
SNE #0,lsc
MOV #-2,amd ; loss -2 points
SNE #1,lsc
MOV #4,amd ; win 4 points
JMN psc,lst
ADD amd,scc
amd JMP fin+1,#-1  ; tie -1 points
psc ADD.B amd,ppc
fin STP ppc,#3 ; save scores
STP scc,#2
MOV 0,-2 ; anti brain wash
MOV 0,-2
SLT scc,ppc ; store current strategy which
MOV.A #0,cst ; is used for scoring on next round
cst STP #1,#1
MOV 0,-1
SLT scc,ppc
JMP scn ; scissors
JMP ppr ; paper
set MOV #4000,ppc ; must be done in order to avoid 
MOV #4000,scc ; problems caused by negetive numbers
JMP fin
;show off

for 10
DAT 0
rof

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
