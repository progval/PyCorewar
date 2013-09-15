;redcode-94
;name Bird of Prey
;author various authors
;strategy imp spiral with cloaking device
;assert 1

step equ 2667

boot spl 1,0
     spl 1,0
     spl 1,0
     spl 1,0
     jmp >1, }0
     dat 0, imp+0*step
     dat 0, imp+0*step-1
     dat 0, imp+0*step-1
     dat 0, imp+1*step
     dat 0, imp+1*step-1
     dat 0, imp+1*step-1
     dat 0, imp+2*step
     dat 0, imp+2*step-1
     dat 0, imp+2*step-1
     dat 0, imp+3*step
     dat 0, imp+4*step
     dat 0, imp+5*step
     dat 0, imp+6*step
     dat 0, imp+7*step
     dat 0, imp+8*step
     dat 0, imp+9*step

for MAXLENGTH-CURLINE-2
  dat 0,0
rof

     mov.i }0, <1     ; cloaking device (executed twice)
imp  mov.i #-2, step  ; the imp

end boot

