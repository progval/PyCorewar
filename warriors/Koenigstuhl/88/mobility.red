;redcode 
;name Mobility 8000
;author David Moore
;assert CORESIZE==8000 && MAXPROCESSES==8000 
;strategy Phase 1: Attack (dwarf + stun) 
;strategy Phase 2: Defense (full gate) 

time equ 7895 

sb spl 1, <-115 
db dat <1, #1 

main mov db, db+125+(time*15) 
mov sb, <2 
sub #15, main 
jmp main, time+1 

end main 
