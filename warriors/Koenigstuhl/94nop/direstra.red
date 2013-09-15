;redcode-b
;name Dire Strait
;author Marshall
;assert 1
bombz      EQU   (CORESIZE/7) ;works with any coresize i think
org go
go            MOV      bomb1, >bomb1
              MOV      bomb2, @bomb1
              ADD      #6, bomb1
              DJN.B    go, bomb2 ;make sure not to stun itself
clear         MOV      4 , 5  ;should stick something in here
              JMP      -1, >-1 ;to avoid killing self
bomb1         SPL       0, 3          ;2 part stun bomb
bomb2         JMP      -1, bombz ;makes new processes at 50%C
              DAT      <2666, <5333 ;imp-ring killer, i think
              END
