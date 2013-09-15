;redcode
;name macro
;author Nandor Sieben
;assert 1
newloc    equ (last+1000)

decoy   
i         for 5   
LABEL&i   jmp LABEL&i,i+1
          rof 
launch
i         for 2
          mov last-i+1,<newloc
          rof
          jmp @newloc

          mov 0,2
last      mov 0,2
          end launch
