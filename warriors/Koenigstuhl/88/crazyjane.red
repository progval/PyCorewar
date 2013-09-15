;redcode
;author Simon Arthur
;(neur0mancer@oak.circa.ufl.edu)
;name Crazy Jane
;strategy bombs with spl 0 then with DAT's
;assert 1
 
start    mov loc   ,    -2
         sub #390  , start
         djn start , start         
next     mov (loc+2), -10
         jmp next  , <next
 
loc      spl 0    , #-7  ; bomb here
                         ; bomb here
 
 
end start
