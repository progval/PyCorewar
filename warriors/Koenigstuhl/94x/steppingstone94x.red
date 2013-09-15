;redcode-94x
;name Stepping Stone 94x
;author Kurt Franke
;strategy Vampire (big hill version, kind of buggy)
;assert CORESIZE == 55440

;; - - - - - - - - - - - boot parameters - - - - - - - - - - - - - - - -

				;; reference address for boot distances
REF		equ	(vamp-3)

				;; first define the places things will go
BVAMP		equ	(3+205*10+REF)
BSTEP		equ	(6+32*10+REF)
BINCR		equ	(0+240*10+REF)
BJUMP		equ	(1+99*10+REF)
BCLEAR		equ	(3+229*10+REF)	;; 729??
BPIT		equ	(5+415*10+REF)
		;;	 ^
		;;	 +---- 	don't change this column of numbers
		;; 		they are magic to avoid self-bombing

				;; now define constants for use in the code
				;; (these are to be used when refering to a
				;;  line within that block of code)
CVAMP		equ	(BVAMP-vamp)
CCLEAR		equ	(BCLEAR-cptr+space)
CTARGET		equ	(BVAMP-vamp+target)

FIRST		equ	0
INC		equ	950	;; mod 10 step for mod 5 vamp/scan
COUNT		equ	20*5

;; - - - - - - - - - - - the vampire code - - - - - - - - - - - - - - -

vamp	add.f	$(BINCR-CVAMP),	$(BJUMP-CVAMP)
	mov.i	@0,		@(BJUMP-CVAMP)
	jmz.a	vamp,		*(BJUMP-CVAMP)
	mov.i	@0,		*(BJUMP-CVAMP)	;; a-field needs to be 0
target	djn	vamp,		#COUNT
	jmp	(CCLEAR-CVAMP)
	
jbomb	jmp	@BSTEP-BJUMP-FIRST,	$FIRST	;; indirect jump to pit

step	jmp	@0,		BPIT-BSTEP	;; a-field needs to be 0

cptr	spl	{200, >(CORESIZE/2)+200
dbomb	dat	{10, >(CORESIZE/2)+10
sbomb	spl	#20, <-100
space	spl	#0, #0				;; a-field needs to be 0
clear	mov	$sbomb, >cptr
	mov	$sbomb, }cptr
	djn.a	$clear, <sbomb

pit	mov	$0,		$CTARGET-BPIT	;; trigger core clear
	spl	#0,		$0		;; a-field needs to be 0
	mov	2,		>1
	stp	#0,		#BCLEAR-BPIT+106

;; - - - - - - - - - - - - - boot code - - - - - - - - - - - - - - - - - -

pboot	mov	pit+3, BPIT+3
	for	3
	  mov   {pboot, <pboot
	rof

	mov	jbomb, BJUMP

	mov	incr, BINCR

	mov	step, BSTEP

cboot	mov	cptr+6, BCLEAR+6
	for	6
	  mov	{cboot, <cboot
	rof
	
vboot	mov	vamp+5, BVAMP+5
	for	5
	  mov	{vboot, <vboot
	rof
	
	spl	@vboot

	mov	$0, $vboot			;; erase important pointers
	mov	$0, $cboot

incr	dat	$-INC,		$INC

	for	131
	  spl	#0, #last*2843
	rof

;; - - - - - - - - - handshake constants - - - - - - - - - - - - - - -

	PIN	279

MAGICP		equ	378
WINP		equ	379
LOSEP		equ	380
HWARRIOR	equ	pboot

;; - - - - - - - - - handshake initialize - - - - - - - - - - - - - -

magic	ldp.ab	>last, #0
	jmn	HWARRIOR, $magic	;; if flag is set, fight

last	ldp	#0, #magicp
	sne	#-1, $last		;; if it is the first round, set
	jmp	search			;; special routine for first round

;; - - - - - - - try handshake - - - - - - - - - - - - - - - - - - - - -

shake	jmz	lost, $last		;; the actual handshake
won	stp	#0, #LOSEP		;; reset the expected flag
	stp	#1, #WINP
loser	ldp	#LOSEP, #0		;; and then check it
	jmz	>foe, $loser		
	jmp	0			;; wait

lost	stp	#0, #WINP		;; reset the expected flag
	stp	#1, #LOSEP
winner	ldp	#WINP, #0		;; and then check it
	jmz	>foe, $winner
magicp	dat	#MAGICP, #0

;; - - - - - - - - - - - flag enemy warrior - - - - - - - - - - - - - - -

foe	stp.a	#1, @0
magicp2	jmp	HWARRIOR, *magicp

;; - - - - - - - - - special first round routine - - - - - - - - - - - - -

;; Determine who moved first without pspace
;;  1st version waits till timeout and second kills itself

search	jmz.f	search, {count		;; find the other copy

count	sne.i	#-220, {count		;; skip the next line if we are #2
	jmp	$0, {count		

;; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	end	magic
