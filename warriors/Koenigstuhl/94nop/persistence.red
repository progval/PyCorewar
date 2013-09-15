;redcode-94
;assert CORESIZE == 8000
;author Kurt Franke
;name Persistence

;strategy vamp/scan -> core clear
;strategy  (this version does better against imp-types)

for     0
        (I think this is the same as I sent in to pizza -- 
         but I might have changed the core clear a little.)

        This is a vampire/scanner along the same lines as myvamp.
        I bomb every 16th location with an instruction to jump into
        the pit.  The pit clears core forward from by warrior with
        3-point-imp-killing instructions, eventually killing itself.
        In between every bombed location, I scan to see if it is not
        zero and drop a dat bomb if it isn't.  After ten finds I go to
        the core clear part.
rof

step    equ     48

hell    spl     0, <-300
hell2   spl     0, <-200
hell3   spl     -1, <-100
        spl     -1, <-60
mbomb   mov     5, >1
        jmp     -1, cend+10
        dat     0,0                             ;; hit

        for     7
          dat   <2667, <2667*2
        rof

        for     41                              ;; check
          dat   0,0
        rof                                     ;; hit

        dat     0,0

loop    add.f   $incr, $jbomb                   ;; vamp/scan loop
        mov     $jbomb, @jbomb
        jmz.f   loop, *jbomb
        mov     $dbomb, *jbomb
ret     djn     loop, #10                       ;; start clear after 10

ptr     jmp     $sbomb2, $cend+6
dbomb   dat     #sbomb-ptr, }cend+6-ptr         ;; check
sbomb   spl     #dbomb-ptr, #cend+1-ptr
sbomb2  spl     #sbomb-ptr, #cend+6-ptr
clear   mov     *ptr, >ptr                      ;; 3/4 c core clear
        mov     *ptr, >ptr
        mov     *ptr, >ptr
cend    djn     -3, <loop-100
        dat     0,0
        dat     0,0                             ;; hit

        for     8
          dat   0,0
        rof                                     ;; check

        dat     0,0
        dat     0,0
        dat     0,0
        dat     0,0
incr    dat     step, -step
jbomb   jmp     hell-dbomb+8, dbomb-8
        dat     0,0
        dat     0,0                             ;; hit

        for     7
          dat   1,1                             ;; djn stream guard
        rof

        end     loop
