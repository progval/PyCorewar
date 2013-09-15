;redcode
;name Impring
;author Sukru Cinar
;assert CORESIZE==8000
;strategy Imp ring with two parts ( imp edge? )
;strategy with this method, you can have any number of parts
;strategy making up an imp ring, with any number of spaces between them

jj      mov 4001, 4002
jp      mov -4001, -4000
start   spl jump2
jump1   mov jp, 4001                     
        jmp 4000
jump2   mov jj, -2
        jmp -3
        end start

