;redcode-94b
;name Neverland
;author John Metcalf
;strategy Carpet-bombing mini-scanner (6 instructions)
;assert 1

blur equ (align-1)
step equ 4956
align:mov.b @loop,    blur
loop: add   #step,    point
      mov   @bomb-1,  >blur    ;increment a-field to switch bomb
point:jmz   loop,     }step-1  ;b-scan - increments while scanning
      jmp   align,    1
bomb: spl   #1,       <0
      end   align

