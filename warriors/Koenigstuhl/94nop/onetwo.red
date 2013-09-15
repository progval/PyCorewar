;redcode-b
;name One-Two
;author WFB
;strategy splits in two, with one process throwing SPL's, and another DAT's
;strategy only my third warrior, so don't laugh.
;assert CORESIZE==8000
start: mov copy,4001
       mov copy2,4001
       mov copy3,4001
       mov kill,4001
       spl 3998
       add #5,aimer
       mov bomb,@aimer
       jmp 1,<aimer
       mov explosion,@bomb
       jmp -4,>aimer
bomb:  spl 0
explosion: jmp -1
aimer: dat #0,#0
copy:   mov -4006,3
copy2:  mov kill,@2
copy3:  jmp -2
kill:   dat #0,#0

end
