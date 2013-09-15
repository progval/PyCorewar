;redcode
;name anti scanner test
;author mjp
;strategy use a forward djn-stream and bi-shot clear to convert
;strategy the scanner into a slow spl/jmp bomber.
;assert 1

    d equ 1600
      dat 0, d
gate  dat -1+d+2667, -1+d+5334
      dat 0, 0
      dat 0, 0
      dat 0, 0
clear spl #0, 0
      mov bomb, }gate
      mov bomb, >gate
      djn.f -2, >gate-1
      dat 0, 0
      dat 0, 0
bomb  dat <2667, <10

      end clear

