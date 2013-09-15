;redcode-b
;name Pit-Scanner v1.2
;author Karl Castle
;assert 1

PIT     JMP     PIT
AD      ADD     #8,     SCAN
;I'm a _beginner_, but I'm writing this.
;the warrior jmp-bombs enemy processes,
;stopping them in their tracks.
;What do I do to switch execution to SC2 ?
SCAN    JMZ     AD,     13
ATTACK  MOV     PIT,    @SCAN
        JMP     AD
BOMB    DAT     #0,     #0
S2      ADD     #4,     SC2
SC2     JMZ     S2,     -2
ATT     MOV     BOMB,   @SCAN
        JMP     S2
        END     AD
