;redcode-94
;name Death kiss
;author Anders Rosendal
;strategy Special
;assert 1
org clean

space   equ     (MINDISTANCE)

head
ptr1    dat    clean, head+space+2000
a2      spl    #a3+1, #snoop+2
a3      dat    clean+2, snoop+3

clean   spl    #a2-ptr1,snoop+1-ptr1  ; spl #X, <-Y acts like a split 0.
loop2   mov    *ptr1, >ptr1           ; and use the decrement in the b-field
        mov    *ptr1, >ptr1           ; and use the decrement in the b-field
        mov    *ptr1, >ptr1           ; and use the decrement in the b-field
        mov    *ptr1, >ptr1           ; and use the decrement in the b-field
snoop   djn.F  loop2, <ptr1-space-500 ; the b-field of ptr1 to move the bomb

for MAXLENGTH-CURLINE
        dat     0, 0    ; free space
rof
last
end
