;redcode
;name Killer 2
;author ThM
;strategy mobile warrior with imps
;assert 1
           jmp   start
ptr1       dat   #111
ptr2       dat   #11
ptr3       dat   #5
start      mov   #-250,   ptr1
           mov   #11,     ptr2
           mov   #8,      ptr3
           mov   <ptr3,   <ptr1
           djn   -1,      ptr2
           spl   -269
           mov   0,       1
           end   start
