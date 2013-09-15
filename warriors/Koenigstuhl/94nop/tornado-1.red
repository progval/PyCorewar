;redcode
;name Tornado -1.0
;strategy This is a .6c bomber, losely based on Tornado 3.0 by Beppe Bezzi.
;strategy I borrowed the bombing loop, but took out the parts of it I didn't
;strategy fully understand - so there's not much left now...
;strategy After the bombing run, loop in a DAT clear forever...
;author George Eadon
;assert 1

step    equ     3005               
djnoff  equ     -4000

pos     dat     0, bombd+1
bombs   spl     #step,  -step           ;hit spl
start1  add     incr,  stone           
b2      mov     bombs,  @stone
b1      mov     bombs,  *stone
stone   mov     jump, *(1*step)+jump
jump    djn.f   start1, {djnoff         ;hit by spl
        mov     bombd, >pos
        djn     jump, {pos-1
incr    dat     3*step, 3*step      
bombd   dat     0, bombd - pos
end     start1

