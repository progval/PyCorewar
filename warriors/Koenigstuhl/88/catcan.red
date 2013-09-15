;redcode 
;name Cat Can
;author A. Kirchner
;assert 1
;
;    Remixor: F. Uy
;
start     mov       trap2,  < bomb
          mov       trap1,  < bomb
          sub     # 6,        bomb
          jmn       start,    bomb ; trap loop
set       mov     # -12,      bomb
kill      mov       bomb,   @ bomb
          djn       kill,     bomb ; kill loop
reset     jmp       set,      0
          jmp       set,      0
          dat     # 0 ,     # 0    ; buffer
bomb      dat     # 0 ,     # -1024
trap1     spl       0 ,       2
trap2     jmp       -1,       1
          end       start
;
; Your basic two sweep methodical bomber.
; Fires SPL 0 and JMP -1 at every eight
; addresses, then erases the core with
; DAT bombs.
