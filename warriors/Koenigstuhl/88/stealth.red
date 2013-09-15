;redcode
;name StealthHunter 1.0
;author Eric J. Schwertfeger
;strategy Simple, Fast Vampire
;strategy My first Non-B-Field Scanner
;strategy Again, thanks go to J. Cisek (PitTrap)
;strategy Submitted: @date@
;assert 1
BLANK   DAT     #-4,#-4
LOOP    ADD     INC,SRC
        ADD     INC,DEST
        CMP     @SRC,@DEST
        JMP     BOMBIT
        JMP     LOOP
BOMBIT  SLT     #(BLANK-SRC-1),SRC	; only bomb if it's not us!
        MOV     SRC,@SRC
BLANKS  SLT     #(BLANK-DEST-1),DEST	; only bomb if it's not us!
        MOV     DEST,@DEST
        JMP     LOOP
INC     DAT     #26,#-26
PLOOP2  MOV     SRC+2,<BLANK		; again, I find this to be the
        MOV     SRC+2,<BLANK		; best type of pit, see
PIT     SPL     0			; chaingang for why
TAIL    JMP     PLOOP2
SRC     JMP     PIT,0
DEST    JMP     PIT+90,0-90
        END     LOOP
