;redcode 
;name The Next Step '88
;author David Houston 
;strategy quickscan -> stone/paper 
;assert CORESIZE == 8000 
;optimax pws
zero i for 0 
rof 

;----------------------------------------------------- 
; The boot 

bpoff equ 5880 
bsoff equ 5954 

boot mov sbomb, zero + bsoff + soff 
mov <bssrc, <bsdst 
spl 1 
spl 1 
mov <bssrc, <bsdst 
spl 1 
mov <bpsrc, <bpdst 
spl @2 
bpdst spl @0, zero + bpoff + 8 
bsdst jmp @0, zero + bsoff + 5 

;----------------------------------------------------- 
; The paper 

pstep equ 7115 
paim equ 7463 

; must be preceded by a dat 
bpsrc 
paper mov #8, 8 
mov <paper, <pspl 
pspl spl @0, pstep 
mov pmbmb, <paim 
mov paper-1, <pspl 
jmz @0, paper 
pmbmb mov 0, <1 
dat <2667, <5334 


;----------------------------------------------------- 
; The stone 

sstep equ 4859 
sstream equ 2394 
sfirst equ 1844 
shop equ 389 
soff equ 6291 

sbptr equ stone + soff 

bssrc 
stone spl 0, 5 
mov sbptr, @sfirst 
mov sbptr, @-1 
add #sstep, @-1 
djn -3, <sstream 
sbomb dat #0, #shop 

for 40 
dat #0, #0 
rof 

qs    equ 322 
qd    equ 161 

qscan cmp 2*qs+qd       , 2*qs 
qt1   jmp qa0           , <3*qs 
     cmp qscan+5*qs+qd , qscan+5*qs 
qt2   jmp qa1           , <4*qs 
     cmp qscan+4*qs+qd , qscan+4*qs 
qs1   djn qa1           , #qt1 
     cmp qscan+10*qs-2 , qscan+10*qs+qd-2  ; qscan-(qt2-1) = -2 
qs2   djn qa2           , #qt2 
     cmp qscan+9*qs+qd , qscan+9*qs 
qt3   jmp qa2           , <6*qs 
     cmp qscan+6*qs+qd , qscan+6*qs 
     jmp qa2           , <qa1 
     cmp qscan+8*qs+qd , qscan+8*qs 
     jmp qa2           , <qs1 
     cmp qscan+11*qs   , qscan+11*qs+qd 
     jmp qa3           , <qa2 
     cmp qscan+18*qs-8 , qscan+18*qs+qd-8  ; qscan-(qt3-1) = -8 
qs3   djn qa3           , #qt3 
     cmp qscan+16*qs-2 , qscan+16*qs+qd-2  ; qscan-(qt2-1) = -2 
     jmp qa3           , <qs2 
     cmp qscan+12*qs   , qscan+12*qs+qd 
     jmp qa3           , <qa1 
     cmp qscan+14*qs   , qscan+14*qs+qd 
     jmp qa3           , <qs1 
     jmz boot          , qscan+15*qs 

qa3   add @qs3          , qp 
qa2   add @qs2          , @qa3 
qa1   add @qs1          , @qa3 
qa0   cmp @qp           , <1234 
     cmp @0            , 0 
     add #qd           , qp 
ql    mov qb            , @qp 
qp    mov <2345         , <qscan+2*qs 
     sub #9            , @ql 
     djn ql            , #6 
qb    jmp boot          , <43 

     end qscan 
