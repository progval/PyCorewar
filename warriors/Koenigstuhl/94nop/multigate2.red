;redcode
;name Multi-Gate Bombing run (2)
;author Kurt Kirkham
;assert 1

launch   SPL bombfwd           ; Start bombing run forward
         JMP bombbkwd          ; Start bombing run backwards
                               ; << Code above here gets over-written >>
gate     DAT #0,#0             ; Gate for imps
bomb1    DAT #0,#0
bombbkwd MOV.I bomb1,<-1       ; Bomb backwards pre-increment b-field
         JMP bombbkwd,<gate    ; loop
;
bombfwd  MOV.I bomb2, >2       ; Bomb forwards
         JMP bombfwd,<gate     ; loop
bomb2    DAT #0, #1            ; Gate for imps
                 END launch



