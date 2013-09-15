;redcode-94b
;name Forked Lite Ning 4.076
;author Ansel G. Sermersheim
;       Ansel Greenwood Sermersheim
;strategy  incendiary bombing cmp-scanner
;strategy  Multiple-pass spl/infinite dat coreclear 
;strategy With step size optimized for toasting imps
;assert 1

org start1

step1   equ     1295

        dat     1,      0
bm1     mov     1,      >1
bm2     spl     -1,     -10          
step    dat     #step1,  #step1

hitit   mov     bm1,            @complin
        mov     bm2,            *complin;a-field of this &

start1  add.f   step,           complin ;this must be identical
complin cmp.a   -1,             -2
        jmp     hitit,          <rets   ; <rets so wo dont have to waste a
line later
rets    djn     start1,         #1600
        jmp     @0,             c2   ;a this &

c2      spl     0,              -1  ;this
        mov     *ptrbm,         <ptrbm
        sub.ab  #2666,          ptrbm
bomb    dat     <(-10)-2667,    <-10
ptrbm   dat     bm2,            -10
        dat     bm2+1,          0
