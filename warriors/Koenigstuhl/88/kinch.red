;redcode verbose
;name Kinch
;author Kevin Whyte
;<kwhyte@zaphod.uchicago.edu>
;assert 1
;strategy Kinch looks for non-zero B-fields
;strategy and bombs the region with jumps to
;strategy a "slave pit".  The pit then changes
;strategy my program so that it simply bombs
;strategy memory (every single address) w/dat 's
;strategy (and then the pit splits ad infinitum).
;strategy Once we have the enemy (and quickly he
;strategy is executing little else than spl 's)
;strategy we win. That's why it cleans up against
;strategy things which split alot.
;strategy MAJOR WEAKNESS: Very long if the searching
;strategy looks at more than B-fields.
;strategy THING-TO-FIX: Find out why it draws so much
;strategy and stop doing so (35% wins and 65% losses
;strategy is BETTER than all draws)
bomb jmp pit,0
offset dat #436,#-436
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
start  add offset,bomb
       jmz start,@bomb
       add #7,bomb
loop   mov #13,loop
get    mov bomb,<bomb
       djn get,loop
       add #6,bomb
change jmp start,0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
new    mov #-10,0
       mov -2,-3
       mov -4,<-4
       djn -1,-3
       jmp -3,0
thing  jmp new-start,start
       jmp 13,0
       jmp 12,0
       jmp 11,0
       jmp 10,0
       jmp 9,0
       jmp 8,0
pit    jmp 7,0
       jmp 6,0
       jmp 5,0
       jmp 4,0
       jmp 3,0
       jmp 2,0
       jmp 1,0
       mov thing,@thing
       spl 0,0
       jmp -1,0
       end start
