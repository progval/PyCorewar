;redcode verbose
;name Bow-n-Arrow 2.2
;author James Jesensky
;strategy bombs and imps...
;assert 1

start    spl  gun
         mov  #16, where
loop     add  #4, where
         mov  death, @where
         jmp  loop
where    dat  #0
death    dat  #0, #69
gun      spl  imp
         spl  imp
         spl  imp
         jmp  gun
imp      mov  0, 1
