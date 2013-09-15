;redcode
;name Cleaner
;author Pen
;assert 1
HEAD     DAT               #0
SBOMB    SPL                 0
DBOMB    DAT               #0
ORIG     MOV   # HEAD-AIM,   AIM
SLOOP    MOV     SBOMB,    @ AIM
         DJN     SLOOP,      AIM
         MOV   # HEAD-AIM,   AIM
DLOOP    MOV     DBOMB,    @ AIM
         DJN     DLOOP,      AIM
         JMP     ORIG
AIM      DAT                #0
         END     ORIG
