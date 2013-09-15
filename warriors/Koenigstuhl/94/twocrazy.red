;redcode-94
;name 2 Crazy
;author Christian Schmidt
;strategy scanner and stone/paper
;strategy for the KOFACOTO quarterfinal
;assert 1

STORE   equ     250
w0      equ     scissor
w1      equ     cBoot

cBptr   equ     2152
len     equ     9
fcp     equ     3039
scp     equ     2365
tcp     equ     777

dist    equ     3810
xstep   equ     5379

org     think

in      dat     0,           10
boot    spl     1,           9
        spl     1,           11
        mov     -1,          0

frog    spl     @0,          <fcp-len
        mov     }-1,         >-1
        mov     }-2,         >-2
        spl     @0,          <scp
        mov     }-1,         >-1
        spl     @0,          <tcp
        mov     }-1,         >-1
        mov     2,           <-fcp+len+1
        jmp     -1,          <-10
        dat     <2667,       <2667*2

for 34
        dat     0,           0
rof
        dat     0,           0     ;scanned
        dat     0,           0

think   ldp.a   #0,          in
        ldp.a   #STORE,      table
        mod.ba  *in,         table
        stp.b   *table,      #STORE
table   jmp     }0,          226
        dat     w0,          650
        dat     w0,          101
        dat     w0,          886
        dat     w0,          653
        dat     w0,          104
        dat     w1,          889
        dat     w1,          656
        dat     w1,          107
        dat     w1,          630
        dat     w1,          226

        dat     0,           0     ;scanned

cBoot   mov     cBomb,       frog+cBptr+198
        mov     cSp-1,       frog+cBptr-1
        mov     cSp,         frog+cBptr
        mov     cSp+1,       frog+cBptr+1
        mov     cSp+2,       frog+cBptr+2
        mov     cSp+3,       frog+cBptr+3
        spl     frog+cBptr-1,{0
        spl     frog+cBptr-1,{0
        spl     boot
        jmp     frog+cBptr-1,{0

cBomb   dat     >-1,         >1
cSp2    spl     #0,          #0
cSp     spl     #0,          <-1151+3
        mov     197,         cAd-(197*3500)
cAd     add.ab  {0,          }0
        djn.f   -2,          <-1151

        dat     0,           0     ;scanned

scissor:mov     <Sboot,      <xscan
    for 4
        mov     <Sboot,      <xscan
    rof
        djn     -4,          #2
Sboot   jmp     sm+dist,     xscan+9

xscan   dat     0,           dist+9
sm      mov     sb,          >xscan

sc      add     #xstep+1,    #xstep+1
        jmz.f   sm,          <sc
        slt.b   sc,          #14
        mov.b   sc,          xscan
        jmn     sm,          sc
        jmp     sm,          }sm
sb      spl     #0,          {0

        end
