;redcode-94 quiet
;name Tuning Fork
;author Robert Hale
;assert CORESIZE == 8000
;strategy pspace scanner and paper
;strategy 	a new pspace engine 
;strategy	
;strategy	it picks a random number
;strategy 	compares it to a threshold and starts the
;strategy 	scanner if the rnd is less than the threshold
;strategy	otherwise is starts the paper.  Next round it 
;strategy	adjusts the threshold based on the previous 
;strategy	warrior and the results.
;strategy	
;strategy	Comments would be appreciated.  Thanks

;show on
;********** Brain ***********************************

_RES    	equ   0
_STR    	equ   721
_RND		equ	722
_THRES	EQU	723
_BWD		equ	720

THRESV  equ     3000
THRESR  equ     6000
ADJ             equ     500
BWDV		equ 	73

SEED        equ     5313
RND1        equ     557
RND2        equ     THRESR

brain
;38 instruction

;brainwash detect and intial setup
bwd		ldp.ab	#_BWD, #0		
		sne.ab	#BWDV, bwd
		jmp		res
		stp.ab	#THRESV, #_THRES
		stp.ab	#BWDV, #_BWD
		stp.ab	#0, #_STR	;if brainwashed set valid strategy

res     	ldp.ab  	#_RES, #0
        	ldp.a   	#_STR, strat

;if tie run same strategy no adjustments
		sne.ab	#2, res
		jmp		strat

;if not a tie we load, adjust and save the threshold
thold		ldp.ab	#_THRES, #0
		seq.a		#0, strat
		jmp		adj1

;adjust threshold for strat 0
adj0		seq.ab	#1, res
                add.ab  #2*ADJ,thold
                sub.ab  #ADJ, thold
		jmp		sthold

;adjust threshold for strat 0
adj1		seq.ab	#1, res
                sub.ab  #2*ADJ, thold
                add.ab  #ADJ,thold
sthold	stp.b		thold, #_THRES

;pick a random number
        	ldp.a   	#_RND, seed

;if seed is zero set to initial SEED value
	  	sne.a	 	#0, seed 	
		mov.a		#SEED, seed

;seed * RND1 - mod(seed, RND2)
		mul.a		#RND1, seed
		mod.a		seed, store
		sub.a		store, seed

;save the random number
        	stp.ab  	seed, #_RND

;mod random number by threshold range so we always get a number in range
            mod.a       #THRESR,     seed

;pick strategy
; if random < threshold strategy 0 else strategy 1
                slt.ba          thold, seed
		jmp		str1

;strategy2
		mov.a		#1,	strat
		jmp		sstr

;strategy1
str1		mov.a		#0, strat
sstr		stp.ab	strat, #_STR

;jump to choosen strategy
strat		jmp         @0, scan
store      	dat     	#RND2, paper
seed      	dat     	0, 0
;show off

;;;;;;;;;;;;;;;
;             ;
;  mini Blur  ;
;             ;
;;;;;;;;;;;;;;;

dist equ 2942 ;boot distance
step equ 2891 ;scan pattern; -723 might be better
time equ 2210 ;number of SPLs copied

scan   mov <boot, <top
     for 8
       mov <boot, <top
     rof
boot   jmp start+dist, top+9

top    mov.b  2, #dist+9
       mov   sp, >top
       add #step, #-step*time
start  jmz.f -2, @-1
       jmn  top, *top
sp     spl   0, 0
       mov    2, >top-3
       djn.f -1, >top-3
       dat    0,  5-top


;*************************************************

for MAXLENGTH-CURLINE-14
	dat	0, 0
rof

;*************************************************
;************ Pulp *******************************
;*************************************************
dest1   equ     1400    ; For Pulp v0.2
dest2   equ     5460
dest3   equ     725
pos1    equ     930     
pos2    equ     3359
pos3    equ     1009    ; clear old copies

;;------------------------------------------------------------

paper   SPL.B   1,      <-300
        MOV.I   -1,     0
        MOV.I   -1,     0
        SPL.B   1,      {-300

silk    SPL.B   @0,     >dest1
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos1
silk2   SPL.B   @0,     >dest2
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos2   ; linear bombing
        MOV.I   bomb,   }pos3   ; anti-vamp
        MOV.I   {silk2, <silk3
silk3   JMP.B   @0,     >dest3
bomb    DAT.F   <2667,  <5334



		end 	brain
