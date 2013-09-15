;redcode
;name Specwar
;author J E Long
;Assert CORESIZE == 8000
;strategy Scanner / Imp
;strategy Hope to find OS first and make it an imp like me.
;strategy Then others might kill OS if they can kill me.
;strategy Hope this theory goes along w/ scoring?
;strategy plan - No OS kills and lots a ties
offset  equ     7
width   equ     6
step    equ     111
scans   equ     -1
first   equ     (next-step*scans)
bombl   equ     width+2
imp     mov     imp,    imp+1
next    sub.f   $incr,  $scan           ;get next
scan    seq     $first-width,   $first  ;check
        slt.ab  #incr-scan+bombl, $scan ;go to attack
        jmp     next,   <next-width     ;try again

trident sub     offset, #scan

        mov     imp,    <scan
        spl     @scan,  {1000
        sub.a   #bombl+offset, $scan
        jmn.a   next,   $next

incr    dat     #-step, <-step
end scan
