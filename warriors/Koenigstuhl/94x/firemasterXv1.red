;redcode-94x
;name Fire Master Xv1
;author JS Pulido
;strategy   Scan -> CClear
;strategy       Scan:   JMZ     MOV/SPL Bomb
;strategy       CClear: SPL+DJN Pass -> DAT+DJN unceasing pass w/ gate
;strategy       13 ins (8 exe + 4 bombs + gate)
;strategy   X -> new const.
;assert CORESIZE==55440
;macro
;1
;

DEBUG   EQU     0

INC     EQU     (21445) ; 21445 m5
DES     EQU     ( 0)
LAST    EQU     (last+4)
SPACE   EQU     (3)
BOOTPTR EQU     (-1001)
inicio      EQU     4


FOR     !DEBUG

boot    mov.i   gate,       }bootptr    ;*
        add.a   #SPACE,     bootptr
        mov.i   ptr,        }bootptr
        mov.i   bomb1,      }bootptr
        mov.i   bombA,      }bootptr
        mov.i   bombB,      }bootptr      ;*
        mov.i   start,      }bootptr
        mov.i   A,          }bootptr
        mov.i   B,          }bootptr
        mov.i   eye,        }bootptr
        mov.i   C,          }bootptr        ;*
        mov.i   clr,        }bootptr
        mov.i   D,          }bootptr
        mov.i   last,       }bootptr
        sub.a   #8,         bootptr
bootptr spl     BOOTPTR                     ;*
        mov.i   gate+1,     bootptr
        dat     1,          1
        dat     1,          1


        gate    dat         #LAST,          #-1

            FOR     SPACE                           ;space 1,3+
                dat         0,              0
            ROF

        ptr     dat         #LAST-gate,     #bomb1
        bomb1   spl         #LAST-gate,     #ptr-gate+1
        bombA   mov.i       @0,             >1
        bombB   spl         -1,             #1
        start   add.ab      #INC,           eye
        A       jmz.f       start,          @eye
        B       mov.i       bombA,          @eye
        eye     mov.i       bombB,          @DES        ;0 HIT
        C       jmn.b       start,          -1
        clr     mov.i       @ptr,           }gate
        D       djn.b       clr,            <gate
        last    jmp         -2,             0

        dat     0,      0
        dat     1,      1
        dat     1,      1
        dat     1,      1
        dat     1,      1

DECOY   FOR     (MAXLENGTH-CURLINE)/5

            DAT 0,0

DB      FOR     4
            DAT     #bombA-(DECOY*DB),   #bombB+(DECOY*DB)
        ROF ;DB

        ROF   ; DECOY

        END boot

ROF     ;!DEBUG

;--------------------------------------------------------------------
;               Desarrollo
;--------------------------------------------------------------------

FOR     DEBUG

        gate    dat         #LAST,          #-1

            FOR     3                               ;space 1,3+
                dat         0,              0
            ROF

        ptr     dat         #LAST-gate,     #bomb1
        bomb1   spl         #LAST-gate,     #ptr-gate+1
        bombA   mov.i       @0,             >1
        bombB   spl         -1,             #1
        start   add.ab      #INC,           eye
                jmz.f       start,          @eye
                mov.i       bombA,          @eye
        eye     mov.i       bombB,          @DES        ;0 HIT
                jmn.b       start,          -1
        clr     mov.i       @ptr,           }gate
                djn.b       clr,            <gate
        last    jmp         -2,             0

                end     start


ROF ;DEBUG

