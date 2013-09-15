;redcode-94
;name Fire and Ice
;author David Moore
;strategy scanner & paper
;assert 1

;;;;;;;;;;;;;;;
;             ;
;    paper    ;
;             ;
;;;;;;;;;;;;;;;

paper  spl   1, >-400
       mov.i 1, #0
       spl   1, {-300

       mov <1, {1
       spl 2319, 7

       spl  @0, <4195
       mov }-1, >-1
       mov   3, >-2
       mov {-3, {1
       jmz.a 6234, *0
       dat 1, 1

for 25
 dat 0,0
rof

;;;;;;;;;;;;;;;
;             ;
;    brain    ;
;             ;
;;;;;;;;;;;;;;;

switch ldp.ba what, what
       mod.a #3, what
       ldp.ab #0, switch
       add.a @switch, what
       stp.ab *what, what
what   jmp @0, scan
       dat 1, scan
       dat 0, scan
       dat 1, scan
       dat 1, scan
       dat 2, paper
       dat 0, scan
       dat 1, scan

for 32
 dat 0,0
rof

;;;;;;;;;;;;;;;
;             ;
;  mini Blur  ;
;             ;
;;;;;;;;;;;;;;;

dist equ 2942 ;boot distance
step equ 2891 ;scan pattern; -723 might be better
time equ 2210 ;number of SPLs copied

scan   mov <boot, <top
     for 8
       mov <boot, <top
     rof
boot   jmp start+dist, top+9

top    mov.b  2, #dist+9
       mov   sp, >top
       add #step, #-step*time
start  jmz.f -2, @-1
       jmn  top, *top
sp     spl   0, 0
       mov    2, >top-3
       djn.f -1, >top-3
       dat    0,  5-top

end switch
