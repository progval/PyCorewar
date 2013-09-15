;redcode
;name Wars v4.0
;author Lars Riemer
;strategy 1988
;assert 1

START   ;
        MOV     #-11,   SLABEL
INIT    ;
        MOV     SLABEL, <SLABEL
        SUB     #1,     SLABEL
        DJN     INIT,   COUNTER
        SPL     KILLER
EAT     ;
        MOV     SLABEL, <SLABEL         ;MOV    SLABEL, @SLABEL
        DJN     EAT,    <SLABEL         ;SUB    #8      SLABEL
        JMP     EAT
KILLER  ;
        MOV     SLABEL2,<SLABEL2        ;MOV    SLABEL2,@SLABEL2
        DJN     KILLER, <SLABEL2        ;SUB    #8,     SLABEL2
        JMP     KILLER
        ;
SLABEL  SPL     0
SLABEL2 DAT     #START
COUNTER DAT     #512
        END
