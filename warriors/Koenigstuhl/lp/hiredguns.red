;redcode
;name Hired Guns
;author Robert Macrae
;strategy Multi-purpose warrior based around DieHard and
;strategy IronGate for round 5 in tourney.
;assert 1

; In the past rounds I've used DAT clears twice, so hopefully
; I've scared off stone/imps leaving a scanner as a good pick.
; Just in case, I've used a clear which will pick up 3-point imps.
;
; I can't beat DieHard for the multiwarrior round. Though there is
; no space for my kicker MOV #0,*1 imp here I do not expect a
; massive degradation in performance :-)
;
; I like IronGate enough to use it in the 94 arena too; P-spacing
; it with DH should cover most bases as there isn't a lot of space 
; for switching code unless the bulk of the warriors are common. This
; is part of the anti-imp rational for the scanner as a Silk/Imp from
; the multiwarrior section is the most likely opponent.
;
; I've too many losses to make the cut, but this round I intend to
; show just how *good* other people's warriors can be :-)


;-----------------------------------------------------------------
; These are the for-rof blocks I use later. 

;94           for (MAXCYCLES == 80000) && (MAXPROCESSES == 8000)
;LP           for (MAXPROCESSES == 8)
;94+88        for (MAXCYCLES >= 80000) && (MAXPROCESSES == 8000)
;94+MW        for (MAXCYCLES <= 80000) && (MAXPROCESSES == 8000)
;94+88+LP     for (MAXCYCLES != 79999)

;-----------------------------------------------------------------
; Where do I start?

; 94 starts at res
; Others start on their first instruction.

for (MAXCYCLES == 80000) && (MAXPROCESSES == 8000)
   org   res
rof                

;-----------------------------------------------------------------
; P-Spacer (9 Cells, 94 only)

for (MAXCYCLES == 80000) && (MAXPROCESSES == 8000)

_RESULT equ #0
_STRAT  equ #116

ld       mov >loss,    <900     ;Lost or drew, so nudge strategy
         mov.ba loss,  1
         stp #0,       _STRAT   ;store new strategy
         jmp choose,   <1000

res:     ldp _RESULT,  #0      ;load last result into B-field
loss:    ldp _STRAT,   #0      ;even is IM, odd is DH
         djn ld,       res     ;1 indicates a win so no changes
choose:  mod.ab #2,    loss    ;guard
         jmz dh,       loss    ;execute DieHard or Iron Gate.

rof

;-----------------------------------------------------------------
; Iron Gate Scanner (Total 19 cells, Not MW)

for (MAXCYCLES != 79999) 

dist equ 98     ;must be a multiple of two
scan equ dist*2     

a add d,@x
c cmp a+dist,a
  slt #20,@x
  djn a,<7000
  mov j,@c
x mov s,<c
y sub n,@x
  jmn c,a

rof

; Insert a clear of your choice:

;-------------------------------
; Spiral Clear for 88 and 94.

for (MAXCYCLES >= 80000) && (MAXPROCESSES == 8000)

        s spl 0,<1-dist        ;88+94
          mov e,@x             ;88+94
          add #2667,x          ;88+94
          jmp -2,<a            ;88+94

rof

;-------------------------------
; Forward clear for LP

for (MAXPROCESSES == 8)

        s spl 0,>x-1           ;LP 
          mov e,>x             ;LP 
          djn.f -1,>x          ;LP 

rof

;-------------------------------
; back to common elements of scanner (Not MW)

for (MAXCYCLES != 79999) 

j jmp -1
n dat <0-dist,<0-dist-1
d dat <scan,<scan
e dat <2667, #8          ; Clear bomb

rof

;-----------------------------------------------------------------
; Now for DieHard  (11 cells, 94+MW)

for (MAXCYCLES <= 80000) && (MAXPROCESSES == 8000)

space    equ (4-40*127)
dv       equ (c0+58)

dh       spl 1,>dv               ; make 8 processes
         spl 1,}-2100            ; (and pinken the bomb)
         spl 1,}-2000

c0       spl   @0,space          ; here is Die Hard
         mov   }c0,>c0
cs       spl   #0        ,}dv     
         mov   dv        ,}dv+space
cb       add.a #119      , dv+space
         spl   imp+5334  ,}dv+space
         spl   imp+2667  ,}dv+space
imp      mov.i #2667     ,*0

rof


end 
