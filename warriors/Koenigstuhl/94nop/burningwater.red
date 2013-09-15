;redcode-94
;name Burning Water
;author Christian Schmidt
;strategy stone/paper
;strategy it's a slightly optimized version
;strategy of my round 3 'Gray Victim' but without
;strategy launching those useless imps ;-)
;assert 1

cBptr   equ     2152
len     equ     9
fcp     equ     3039
scp     equ     2365
tcp     equ     777

cBoot   mov     cBomb,      frog+cBptr+198
        mov     cSp-1,      frog+cBptr-1
        mov     cSp,        frog+cBptr
        mov     cSp+1,      frog+cBptr+1
        mov     cSp+2,      frog+cBptr+2
        mov     cSp+3,      frog+cBptr+3
        spl     frog+cBptr-1,{0
        spl     boot
        spl     frog+cBptr-1,{0
        spl     frog+cBptr-1,{0

cBomb   dat     >-1,        >1
cSp2    spl     #0,         #0
cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0
        djn.f   -2,         <-1151

cs      spl.b   #0,             <-208+9
        spl.b   imp+5334,       <1
        spl.b   imp+2667,       <-210+11
imp     mov.i   #2667,  *0

   for  65
        dat     0,          0
   rof

boot    spl     1,      >-3000    ; 7 processes replace 9 in CCPaper
        spl     1,      <-3200    ; for cost of extra Mov in launcher.
        mov     -1,     0

frog    spl     @0,     <fcp-len
        mov     }-1,    >-1
        mov     }-2,    >-2
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     2,      <-fcp+len+1   ; Wipe uncle.
        jmp     -1,     <-10
        dat     <2667,  <2667*2
        end

