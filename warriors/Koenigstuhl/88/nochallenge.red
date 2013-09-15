;redcode
;name No Challenge
;author Michael Constant
;assert 1
 
where   equ     scan-3
 
scan    jmz     0,      <where
        add     #2,     where
        sub     #3044,  where
        jmz     -1,     @where
        cmp     bomb1,  bomb2      ;if this is hit, then bomb3 wasn't
        mov     bomb3,  bomb1
        spl     0,      #2
attack  mov     bomb1,  <where
        mov     bomb1,  <where
        jmp     attack
bomb1   dat     #0,     #-100
bomb3   dat     #0,     #-100
bomb2   dat     #0,     #-100
