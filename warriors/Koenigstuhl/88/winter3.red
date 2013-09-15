;redcode
;name Winter Werewolf 3
;author W. Mintardjo
;strategy  SPL/JMP bomber + 2 pass core clear using SPL/DAT combination.
;Snowflake Version history:
;          Ver 1: SPL/JMP bomber with core-clear.
;          Ver 2: SPL/JMP bomber with 2 pass core clear with SPL goes first,
;                 and DAT follows in the next pass.
;                 Less dense bombing pattern but optimized.
;                 More instruction line.
;          Ver 2+:Use non-optimized bombing pattern but safer.
;                 First complete version
;strategy Version history
;strategy v2: Denser bombing and safer execution
;strategy v3: Bootstrap added
;assert CORESIZE==8000

step    EQU 156
init    EQU 155
ptr     EQU ((7*5)-2)

boot    EQU (setup+4000)

setup   MOV snow+6, boot+6
        MOV snow+5, <-1
        MOV snow+4, <-2
        MOV snow+3, <-3
        MOV snow+2, <-4
        MOV snow+1, <-5
        MOV snow+0, <-6

        MOV howl, boot-2-ptr
        JMP boot+1, <boot-1997

snow    SPL     0, <-3-step-ptr
main    MOV     hold, @3
        MOV     snow, <2
        ADD     #step, @-1
        JMP     main, init      ; Hit here
        MOV     @-4, <ptr
hold    JMP     -1, 1

howl    DAT     <-4-ptr, #0

        SPL     0, <1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     <0, 1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, @1
        SPL     <0, 1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, @1
        SPL     <0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, 1
        SPL     0, @1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, @1
        SPL     0, <1
        SPL     0, 1
        SPL     0, @1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, @1
        SPL     0, @1
        SPL     <0, <1
        SPL     <0, @1
        SPL     0, @1
        SPL     0, @1
        SPL     <0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, @1
        SPL     @0, <1
        SPL     @0, @1
        SPL     0, @1
        SPL     0, <1
        SPL     0, 1
        SPL     0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     0, 1
        SPL     0, @1
        SPL     @0, <1
        SPL     @0, <1
        SPL     @0, @1
        SPL     <0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1
        SPL     <0, 1
        SPL     @0, @1
        SPL     0, <1
        SPL     0, 1
        SPL     0, @1
        SPL     @0, <1
        SPL     @0, @1
        SPL     @0, 1
        SPL     <0, <1
        SPL     0, <1
        SPL     0, <1
        SPL     <0, @1
        SPL     @0, @1
        SPL     0, <1

        END     setup
