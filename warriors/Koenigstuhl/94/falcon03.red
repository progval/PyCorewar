;redcode-94 quiet
;name Falcon v0.3
;author Ian Oversby
;strategy v0.1  P-Warrior with two components
;strategy       One-shot and imp / stone
;strategy v0.3  Trying new anti-brainwash
;assert 1

org str

plc     equ     3

gate1   equ     (gate-3)
tval    equ     850

impstep equ     2667
sval    equ     5600
ival    equ     3000
dist    equ     20

;;------------------------------------------------------------

str     LDP.A   #plc,   pval    ;load wins/losses
        ADD.A   pval,   check
        MOD.A   #3,     check
        JMN.A   boot,   check   ;permanent switch

res     LDP.AB  #0,     #0
sec     SNE.AB  #0,     res     ;check for loss
lost    ADD.A   #3,     pval
        SNE.AB  #1,     res     ;check for win
won     SUB.A   #3,     pval
        STP.AB  pval,   #plc
jump    JMP.B   tboot,  <-100

pval    DAT.F   $0,     $0
check   DAT.F   $7977,  $0      ; 3 / 8

;;--------------------- Tsunami , 25 lines ------------------------

for 10
        DAT.F   $0,     $0
rof

tboot   MOV.I   {tptr,  <tptr
for 10
        MOV.I   {tptr,  <tptr
rof
        ADD.AB  #3,     tptr
        SPL.B   @tptr,  <-300
        MOV.I   pval,   tptr
tptr    DAT.F   #bptr+1,#tval

gate    DAT.F   #-25,   bptr-gate1+3
        SPL.B   #-20,   #20
b1      SPL.B   #309,   #300
sloop   SUB.F   step,   @scan
        SEQ.I   }b1,    >b1
scan    SNE.I   *b1,    @b1
        DJN.F   sloop,  <-800
step    SPL.B   #-18,   <-18
cloop   MOV.I   @bptr,  >gate1
        MOV.I   @bptr,  >gate1
bptr    DJN.B   cloop,  {b1

;;--------- Simple v0.2b with 16 process, 3 point spiral ----------

for 11
        DAT.F   $0,     $0
rof

iboot   MOV.I   {iptr,  <iptr
for 8
        MOV.I   {iptr,  <iptr
rof
        SPL.B   @iptr,  <-300
        MOV.I   die,    iptr
iptr    DAT.F   #imp+1, #ival

mimp    SPL.B   1,      <-500   ; 16 process 3 point imp
        SPL.B   1,      {-500   ; and decoy-maker :-)
        SPL.B   1,      <-500        
        SPL.B   1,      <-500        

        SPL.B   2,      {-500
        JMP.B   imp,    {-500
        ADD.A   #impstep, -1
die     DAT.F   $0,     $0
imp     MOV.I   #impstep, *0

boot    SPL.B   iboot
for 6
        MOV.I   {sptr,  <sptr
rof
        SPL.B   @sptr,  <-300
        ADD.AB  #dist+5,sptr
        MOV.I   gat,    @sptr
        MOV.I   die,    sptr
sptr    DAT.F   #gat,   #sval

        SPL.B   #0,     <-75
stone   SPL.B   #76,    <-76
loop    MOV.I   {0+76,  2-76
        ADD.F   stone,  loop
hit     DJN.F   loop,   <-79
last    MOV.I   dist,   <stone-10

gat     DAT.F   <-77,   <-77

end
