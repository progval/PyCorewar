;redcode
;name tombstone
;author Simon Wainwright
;assert 1

        step equ 3764

bl      mov mbomb, middle+step
        add #step,          bl
cptr    djn    bl,       #1998
middle  spl     0,         <-9
cl      mov cbomb,       <cptr
        jmp    cl,        <-11
cbomb   dat  <-10,      <-2678
mbomb   mov  step,           1
        end
