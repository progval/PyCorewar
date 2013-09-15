;redcode 
;name Macro Paper
;author J.Layland
;strategy macroized version of Flash Paper 
;strategy some constants randomly changed for no good reason.
;assert 1 
start   spl     p2      ;hedge bets against lucky stone
        spl     1
        spl     1       ;start 4 processes going for copy
        spl     p02
        spl     p03
        spl     p04

i for 7

l&i     mov     #8,     8               ;set source
p&i     mov     <l&i,   <t&i            ;make copy
        mov     <l&i,   <t&i             
t&i     spl     @0,     5001+200*i      ;split to copy
        mov     <-1,    <-2000+200*i
        jmz     l&i,    l&i             ;loop
        dat     <2667, #1
        dat     <2667, #1 
 
rof

p2      spl     1
        spl     1
 
        spl     p05
        spl     p06
        spl     p07

l8      mov     #8,     8               ;set source
p8      mov     <l8,    <t8             ;make copy
        mov     <l8,    <t8              
t8      spl     @0,     5001+200*8      ;split to copy
        mov     <-1,   <-2000+200*8     
        jmz     l8,     l8              ;loop
        dat     <2667, #1 
        dat     <2667, #1 
 
        end     start
