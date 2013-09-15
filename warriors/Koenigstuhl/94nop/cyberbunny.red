;Copyright (c) 1998 by Brett Greenfield
;redcode-94m
;name CyberBunny
;author Compudemon
;assert 1

mst EQU (647)

tp SPL 1
MOV -1,0
SPL 60
SPL 50
SPL 40
SPL 30
SPL 20
SPL 10
cld ldf for 7
 SPL @0,mst+(61*(ldf))
 MOV }-1,>-1
 JMP -2,{-2
 for 6
  DAT <-1,}10
 rof
rof
