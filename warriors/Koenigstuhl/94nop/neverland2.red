;redcode-94b
;name Neverland II
;author John Metcalf
;strategy added an extra line to my 6 line scanner!
;assert 1

blur equ (align-1)
step equ 4956
align:mov.b point,    blur
loop: mov   bomb,     >blur
point:add   #step,    #step
      jmz.f loop,     @point
      jmn   align,    point
      jmp   point,    }loop
bomb: spl   #0,       {0
      end   align

