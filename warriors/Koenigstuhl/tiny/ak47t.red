;redcode-94x
;name Tiny AK-47
;author Franz
;strategy scanner->d-clear
;assert CORESIZE==800

step equ 236
stscn equ (bomb+1+step)

          org scan

ptr       dat 0,jump+20
          dat 0,0
splbomb   spl #1,#1
top       mov.i splbomb,>ptr
scan      seq.i stscn,stscn-8
kill      mov.b scan,ptr
          add.f incr,scan
          djn.b top,#49          
incr      spl #step,>step
          mov.i bomb,>ptr
          mov.i bomb,>ptr
jump      djn.f incr+1,>ptr
bomb      dat >267,jump+10-ptr

          end

