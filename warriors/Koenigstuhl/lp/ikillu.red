;redcode-lp
;name I KILL U
;author LAchi
;assert CORESIZE==8000

       org start
count   dat                     #0
       dat                     #0
ind     dat                     #0
start   spl     loop
       jmp     2
       dat                     #0
       mov     #2216,          count
again   mov     #bomb-ind+1,    ind
       jmp     2
       dat                     #0
copy    mov     @ind,           <count
       djn     copy,           ind
       jmp     2
       dat                     #0
       spl     @count
       add     #1129,          count
       jmp     again
       dat                     #0
loop    add     #88,            bomb
       mov     bomb,           @bomb
       jmp     loop
       dat                     #0
bomb    dat                     #-1
       end 

