;redcode
;name PLAGUE
;author R. Paludan
;assert 1

   SPL k
   SPL k
l: ADD #24, p
   JMZ l, @p
   MOV b, @p
   MOV a, <p
   ADD #1, p
   JMP l
   DAT #1
   DAT #2
   DAT #3
   DAT #4
p: DAT #5
k: MOV z, <z
   JMP k
z: DAT #-16
b: JMP -1
a: SPL 0
