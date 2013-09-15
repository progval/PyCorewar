;redcode
;name Silk Spiral
;author Marshall
;assert MAXPROCESSES > 11
kick1     EQU 2666
kick2     EQU 5332
step      EQU 504 ;this covers the core most efficiently, 50% w/ DAT and 50%
                  ;with silks (which kill anything with < 4 processes)
bomb    EQU step+1
        ORG splkick
boot1   DAT silk, kick1
boot2   DAT silk, kick2

splkick SPL      1   ;\.
        SPL      1   ;4 processes
kick    MOV  }boot1, >boot1   ;\.
        MOV  }boot2, >boot2  ;makes 2 copies of the first silk
        SPL  kick1-7   ;split to those copies
        SPL  kick2-7   ;/.
silk    SPL  @0, step   ;the silk
        MOV  }silk, >silk
        MOV  @kill, }kill
kill    DAT  #bomb, #0 ;if one more process is added, a JMP -1 can be stuck
                       ;here to make eack silk continue to carpet-bomb
        END
