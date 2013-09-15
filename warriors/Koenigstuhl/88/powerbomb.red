;redcode
;name Power Bomb
;author Bram Cohen
;assert 1
GLANCE   ADD  # 412,              OUTPTR
START    JMZ    GLANCE,         @ OUTPTR
NOOP     JMP    NOOP+1
;
         ADD  # 9,                OUTPTR
         MOV  # 0,                JMPTRAP
         SUB    OUTPTR,           JMPTRAP
         JMP    1
         SUB  # 11,               JMPTRAP
         MOV    JMPTRAP,        @ OUTPTR
         MOV  # 17,               COUNT
BOMB     MOV    NOOP,           < OUTPTR
         DJN    BOMB,             COUNT
         ADD  # 420,              OUTPTR
         JMP    START
;
HELP     MOV    DATBOMB,        < BOMBPTR
         JMP    HELP
;
ENTER    MOV    JUMP,             START
         JMP    1
         SPL    0
DEC      DJN    SPLIT,            FOES
;
         MOV    DATBOMB,          SPLIT
COUNT    DAT                    # 0
DATBOMB  DAT   #-BOMBPTR+HELP
SPLIT    SPL    DEC
         MOV    DATBOMB,        < BOMBPTR
         JMP    SPLIT
FOES     DAT                    # 64
OUTPTR   DAT                    # 802
BOMBPTR  DAT                    # GLANCE
JUMP     JMP    HELP-START
JMPTRAP  JMP  @ JMPTRAP,        # JMPTRAP
         END    START
