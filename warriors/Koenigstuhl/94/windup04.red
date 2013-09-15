;redcode-94
;name Wind-up Toy v0.4
;author Ian Oversby
;strategy Big, slow and lumbering...
;assert 1
;P-Switching Bomb dodger, Bomber and Scanner
;Credits to M R Bremer for Derision

org str

plc     equ     (17+5)          ; Not really
plc2    equ     (17+12)         ; Not really

;;------------------------------------------------------------

str     LDP.A   #plc,   pval    ;load wins/losses
        ADD.A   pval,   check
        MOD.A   #73,    check
        JMN.A   der,    check   ;permanent switch

res     LDP.AB  #0,     #0
        LDP.A   #plc2,  pval2
        ADD.A   pval2,  check2
        MOD.A   #87,    check2
        JMZ.A   first,  check2

sec     SNE.AB  #0,     res     ;check for loss
lost    ADD.A   #73,    pval
        SNE.AB  #1,     res     ;check for win
won     SUB.A   #73,    pval
        STP.AB  pval,   #plc
jump    JMP.B   st,     <-100

first   SNE.AB  #0,     res     ;check for loss
        ADD.A   #87,    pval2
        SNE.AB  #1,     res
        SUB.A   #87,    pval2
        STP.AB  pval2,  #plc2
        JMP.B   dodge,  <-100

pval    DAT.F   #0,     #0
check   DAT.F   #7300,  #7300
pval2   DAT.F   #0,     #0
check2  DAT.F   #7134,  #7134

;;------------------------------------------------------------

safe    DAT.F   $0,     $0
for 5
        DAT.F   $0,     $0
rof

st      SPL.B   #95,    <-95
sloop   ADD.F   st,     1
        MOV.I   {line,  line
line    DJN.F   sloop,  <-100
        MOV.I   1,      {st-1

;;------------------------------------------------------------

for 5
        DAT.F   $0,     $0
rof

dodge   JMN.F   dboot,  safe
        JMZ.F   dodge,  <-130
dboot   ADD.AB  #3,     -131
        MOV.I   dptr+4, <-132
        MOV.I   dptr+3, <-133
        MOV.I   dptr+2, <-134
        MOV.I   dptr+1, <-135
        MOV.I   dptr,   <-136
        JMP.B   @-137
dptr    SPL.B   #0,     <-10
dloop   MOV.I   lline,  {dptr
        MOV.I   lline,  {dptr  
        JMP.B   dloop,  <-13
lline   DAT.F   <-12,   <-11

for 35
        DAT.F   $0,     $0
rof

;;------------------------------------------------------------

ptrs    DAT.F   b1,     0
der     ADD.F   step,   scan
scan    SNE.I   108,    100
        DJN.F   -2,     <-1664
b1      SPL.B   #9,     #14
cloop   MOV.I   *ptrs,  >scan
        MOV.I   *ptrs,  >scan
        DJN.F   -2,     <-40
step    DAT.F   #16,    #16
b2      SPL.B   #8,     #14

end

