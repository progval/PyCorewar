;redcode-94
;name hypergate
;author Christian
;strategy hypergate
;assert CORESIZE==80

gate         equ wait-10
wait              spl wait,<gate
gate2            equ       wait2-40
wait2            jmp      wait2,<gate2    
end wait 
