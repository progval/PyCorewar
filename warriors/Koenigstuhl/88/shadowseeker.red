;redcode
;name Shadow Seeker
;author John Metcalf
;strategy blurish scanner, combines Zooom's speed
;strategy trick with a SUB enhanced b-scanner
;assert CORESIZE==8000
     step equ 70
     dist equ 5
     ptr equ inc+2
to:  add #1,       @chk-1
l:   mov sbmb,     <ptr
     sub inc,      chk
chk: sub step*3-3, <step*3+dist+1-3
     jmz @to,      <chk
adj: mov chk,      @l
     jmz <to,      #0
sbmb:spl 0,        <-step
     mov inc,      <chk
inc: dat <-step,   <-step-1
     end chk
