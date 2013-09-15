;redcode
;name BackFire 1.3c
;author Eric J. Schwertfeger
;strategy B-Field scanner that
;strategy bombs location and @location
;strategy v1.1 tried larger jump, putzed out
;strategy v1.2 Seems like I fixed more bugs
;strategy      than I have instructions!!!
;strategy v1.2b Test File, trying different bomb
;strategy v1.3 added a decoy
;strategy v1.3a moved farther from decoy (was 200, now 3000)
;strategy v1.3bc changed increment (was 13, then 39, then 411)
;strategy If this doesn't make the hill, I give up
;strategy (on BackFire, that is).
;stragety Submitted: @date@
;assert 1
BACK    EQU     3000
WHERE   EQU     (LOOP-3)
BOMB    EQU     (WHERE+2)
START   MOV     <SRC, <DEST	;first we copy the actual routine away
        MOV     <SRC, <DEST	;from the decoy.
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        MOV     <SRC, <DEST
        SPL     @DEST,13
        MOV     1,DEST		;Now we destroy the pointer to the running
        DAT     #0,#13		;routine, so no BackFire-like programs
				;will find us from it;
; this is the actual routine.
LOOP    ADD     #411,WHERE	;standard b-field scanner
        JMZ     LOOP,@WHERE
        SLT     #(TAIL-WHERE+1),WHERE	;don't shoot us!
        JMP     LOOP
        MOV     WHERE,BOMB	;  Here we figure out what to hit
        SUB     @WHERE,BOMB	;  Note that since bomb=where+2
        MOV     TAIL+1,<BOMB	;  We can go straight to bombing
        MOV     TAIL+1,<BOMB	;  without having to figure in the
        MOV     TAIL+1,<BOMB	;  offset like BF 1.0 did
        MOV     TAIL+1,@WHERE	;  Now we bomb the original space
TAIL    JMP     LOOP		;  And continue
SRC     DAT     #0,#0
DEST    DAT     #0,#-BACK
;	large decoy goes here, doesn't really matter, but if the
;	b-field is 0, it won't slow us down, but it won't slow down
;	other b-field scanners either.
;
;	Hmmm, maybe that's why 1.3 didn't do well :-(
;
;	if B-field = increment, then it will clear out whatever
;	it would have it next.
;
