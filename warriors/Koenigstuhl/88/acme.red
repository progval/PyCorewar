;redcode
;name THE ACME TRAP COMPANY
;author Campbell Fraser
;20:September:1990
;assert 1

WPOS:   DAT #0
WDEATH: MOV <WPOS,  <WPOS
        DJN WDEATH, <WPOS
START:  ADD #10, NET             ; Put in some B-fields
        SUB #5,  AFOUR           ; Make AFOUR point to POS
        SUB #37, TRAP            ;
ATAKA:  SPL ATAKB
        MOV ONEA, AONE           ; Build program once processes are generated
        JMP WDEATH
ATAKB:  SPL ATAKC
        MOV TWOA, ATWO           ; Build program once processes are generated
        JMP IMP
ATAKC:  SPL GENA
        MOV THREEA, ATHREE       ; Build program once processes are generated
;
DONE:   MOV POS, @AONE           ; These 5 lines are the defense
DTWO:   MOV POS, @ATWO           ; They continually mov POS onto itself until
DTHREE: MOV POS, @ATHREE         ; a trap is dropped onto the main code when
DFOUR:  MOV POS, @AFOUR          ; POS will be moved onto the trap before the
DFIVE:  JMP DONE                 ; trap is executed.
        DAT #0
        DAT #0
POS:    DJN POS, <6              ; Pointer for dropping "jmp @0, <trap>" inst.
AGEN:   SPL AONE
AONE:   SPL ATWO
ATWO:   SPL ATHREE
ATHREE: SPL AGEN
AFOUR:  JMP AONE                ; The last line of the main code
NET:    JMP @0
ONEA:   ADD #3384,  -2          ; These 3 lines are part of the main code
TWOA:   MOV  3,    @-3          ; They get moved into "AONE, ATWO, ATHREE"
THREEA: SUB  -4,   @-4          ; respectively.
;
TRAP:   SPL 1                   ; TRAP which the enemy executes
        SPL -1                  ; "spl 1/spl -1 is used to make them execute
LOOP:   MOV #666, <TRAP         ; lines alternately. Fast worm necessary due to
        DJN LOOP,  TRAP         ; the 16384 cycle limit.
        DAT #0
GENA:   SPL GENB
        JMP DTWO               ; Jump to defense code
GENB:   SPL GENC
        JMP DTHREE             ; Jump to defense code
GENC:   SPL GEND
        JMP DFOUR              ; Jump to defense code
GEND:   SPL AGEN
        JMP DFIVE              ; Jump to defense code
IMP:    MOV IMP, 1

        end START
