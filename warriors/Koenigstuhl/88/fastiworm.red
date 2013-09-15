;redcode
;name Fast Intangible Worm
;assert 1 
 
DIFF   equ 3044
 
LPTR   dat #0
START  mov DROP, D+DIFF
       mov LOOP, C+DIFF
LOOK   jmz LOOK, <LPTR
A      mov #-3, @LPTR
B      mov #-3, <LPTR
C      mov DIFF, <LPTR
D      mov DIFF, <LPTR
GO     jmp @LPTR
       mov BPTR, GO
       mov BPTR, 0
       jmp OVRGAP
       jmp 1
OVRGAP mov #BPTR, BOMB
DROP   mov BOMB, <BPTR
LOOP   jmp DROP, <BPTR
BOMB   dat #(-3)
BPTR   dat #DROP
 
end    START
