;redcode
;name ChainGang 1.1
;author Eric J. Schwertfeger
;strategy Vampire & Vampire Hunter that
;strategy is Immune to it's own hunt
;strategy Much improved bombing thanks to 
;strategy Julius Andrew Cisek (PitTrap)
;stragety Submitted: @date@
;assert 1
BOMB    EQU     (WHERE-2)
WHERE   JMP     PIT,0		;by adding a value x,-x, we maintain
	; a proper distance such that if the instruction is moved to
	; where the b field points to, the a field points back to PIT	
BLANK   DAT     #-3,#-3
LOOP    ADD     INC,WHERE	; JMZ so we don't leave fingerprints that
        JMZ     LOOP,@WHERE	; BackFire or garlic will find
        SLT     #TAIL+1,WHERE	; SLT so we don't shoot ourself
        JMP     LOOP
        MOV     WHERE,BOMB	; here we compute the address to blast
        SUB     @WHERE,BOMB	; see BackFire for better explanation
        MOV     BOMB-1,<BOMB
        MOV     BOMB-1,<BOMB
        MOV     BOMB-1,<BOMB
BLAST   MOV     WHERE,@WHERE
        ADD     #4000,@WHERE
        JMP     LOOP
INC     DAT     #13,#-13
PLOOP2  MOV     BOMB-1,<BLANK	; from personal experience, this is the
        MOV     BOMB-1,<BLANK	; best pit to use.  NEVER put the SPL
PIT     SPL     0		; before the MOV, otherwise you kill the
TAIL    JMP     PLOOP2		; MOV's, then have no way to kill the SPL
        END     LOOP
