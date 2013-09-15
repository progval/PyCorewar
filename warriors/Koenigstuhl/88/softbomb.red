;redcode
;name Soft Bomb v1.0
;author Lars Riemer
;strategy "If it moves, kill it; if it doesn't, kill it anyway."
;assert 1

START   ;
        MOV     REREZAP,<DEST
        MOV     REZAP,  <DEST
        MOV     LOOP,   <DEST
        SPL     @DEST
        ADD     OFFSET, DEST
        DJN     START,  OFFSET
        ADD     DEST,   OFFSET
        JMP     START
DEST    DAT     #666
OFFSET  DAT     #666

GUARD   DAT     #1234
IMPGUAR MOV     0,      1
SOFTBOM DAT     <0

LOOP    ADD     <0,     <0
REZAP   DJN     LOOP,   <LOOP
REREZAP DJN     LOOP,   @LOOP

        MOV     0,      1
        END
