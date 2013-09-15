;redcode-94
;name BgSc 270695 Evolved
;assert CORESIZE==800
;author Terry Newton
; <wtnewton@nc5.infi.net>
;remark Produced by Redmaker on 11 Aug 2000
spl.i  $ 14  , > 398 
add.ba }-1   , < 5   
jmp.a  } 10  , @ 3   
cmp.x  } 730 , } 213 
dat.ba } 356 , @ 542 
djn.ba $ 5   , $ 440 
sne.ab # 524 , # 300 
djn.b  $ 6   , } 6   
jmn.f  { 2   , *-10  
add.ba {-6   , $ 3   
jmz.a  * 1   , *-6   
jmn.ab #-8   , $ 496 
cmp.f  *-1   , @-7   
jmz.x  } 231 , { 208 
spl.x  #-4   , *-3   
mov.i  @ 341 , <-4   
djn.x  $-1   , }-1   
end
