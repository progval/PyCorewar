;redcode
;name tiny-tim v1.1
;author gss & mkg
;strategy - linear scan
;assert 1
bomb    equ     last+1
start   jmz     start   ,<ptr
ptr     spl     -1,     start-1
last    mov     bomb    ,@ptr
end     start
