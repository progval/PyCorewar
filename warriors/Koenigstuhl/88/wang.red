;redcode
;name Wang1
;author Alan Wang
;assert 1
start  mov #-1,             sbeg   ;  set up counts for
       mov #-256,           dbeg   ;  self-copying
       mov # 12,            left
again  mov < sbeg,        < dbeg   ;  make a copy of wang 1
       djn   again,         left   ;  back 256 in the mars
       spl (start-256)             ;  and split to it
       mov # 10,            bstart
       mov # 14,            bleft  ; set up bombing counts
bagain mov   bomb,        @ bstart ; bombing loop
       add # 16,            bstart
       djn   bagain,        bleft
       jmp   start
dbeg   dat                # 0
sbeg   dat                # 0
left   dat                # 0
bomb   dat                # 0
bstart dat                # 0
bleft  dat                # 0
       end   start
