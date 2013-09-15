;redcode-b
;name Iced Creamer 1.3
;author Compudemon
;strategy trap opponent in ice or shatter him with a hammer
;assert CORESIZE==8000

lsc LDP #0,lsc
lss LDP #1,lss
SLT lss,#4000
tbi ADD #3,#stb
ADD lsc,tbi
ADD @tbi,lss
STP lss,#1
SLT #4000,lss
JMP scn ; scissors

;my old slow engine
;talk about big improvement
;lsc LDP #0,lsc
;SNE #-1,lsc
;JMP set
;lst LDP #1,lst
;scc LDP #2,scc
;ppc LDP #3,ppc
;SNE #0,lsc
;MOV #-2,amd ; loss -2 points
;SNE #1,lsc
;MOV #4,amd ; win 4 points
;JMN psc,lst
;ADD amd,scc
;amd JMP fin+1,#-1  ; tie -1 points
;psc ADD.B amd,ppc
;fin STP ppc,#3 ; save scores
;STP scc,#2
;MOV 0,-2 ; anti brain wash
;MOV 0,-2
;SLT scc,ppc ; store current strategy which
;MOV.A #0,cst ; is used for scoring on next round
;cst STP #1,#1
;MOV 0,-1
;SLT scc,ppc
;JMP scn ; scissors

MOV 6,4000
MOV 6,4000
MOV 6,4000
MOV 6,4000
MOV 6,4000
JMP 3996
kbl DAT <-5,>2
SPL #25,<-2
rck MOV.I kbl,-2
ADD #5*271,rck
JMP rck,<-5

for 3
DAT 0
rof

DAT 0
stb DAT -2
DAT 4
DAT -1
DAT 2
DAT -4
DAT 1
DAT 0
DAT 0
DAT 0

;part of old engine
;set MOV #4000,ppc ; must be done in order to avoid
;MOV #4000,scc ; problems caused by negetive numbers
;JMP fin

for 3
DAT 0
rof

scn SUB #10,#lsc
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
st DAT -cpy,-cpy+230
top MOV st,cpy
ppr MOV }cpy,>cpy
MOV }cpy,>cpy
MOV }cpy,>cpy
JMN.A ppr,cpy
SPL <cpy,1
MUL #569,st
JMP top,1
cpy DAT st,st+230
ed DAT 0
END
