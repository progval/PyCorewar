;redcode verbose
;name Twilight Pits 3
;author W. Mintardjo
;strategy v1: bombs --> pits --> slavers
;strategy v2: 2 pass core-clear (1 SPL + 1 DAT)
;strategy v3: simplification of version 2
;assert 1
offs  EQU 196

start SPL 0, <-290   ;135x < b-field
s     MOV t, @t      ;JMP spot
      SUB trap, t
      JMP -2, <start
t     JMP -280, 281
trap  MOV 283, <-283
      SPL -1
      JMP -1

      END start
