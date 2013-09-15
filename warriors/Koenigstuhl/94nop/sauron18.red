;redcode-94
;name Sauron v1.8
;author Michael Constant
;strategy  "Three Rings for the Elven-kings under the sky,
;strategy     Seven for the Dwarf-lords in their halls of stone,
;strategy   Nine for Mortal Men doomed to die,
;strategy     One for the Dark Lord on his dark throne
;strategy   In the Land of Mordor where the Shadows lie.
;strategy     One Ring to rule them all, One Ring to find them,
;strategy     One Ring to bring them all and in the darkness bind them
;strategy   In the Land of Mordor where the Shadows lie."
;strategy                       -- J.R.R. Tolkien, _Lord_of_the_Rings_
;macro
;assert 1

DIST    equ     2300

cclear  mov     split,  <-10            ; lazy man's two-pass coreclear :-)
        jmz.a   cclear, last+10
split   spl     #11,    <-30
        mov     bomb,   <-5
jump    jmp     -1,     <-32

f
impgen  spl     1,      stone+4+1
        mov     -1,     0
        spl     1
        spl     2
        jmp     @0,     imp
        add     #2667,  -1

bomb    dat     <-31-2668,<-31     ; is this right?  I'm not very familiar
                                   ; with gate-breaking imps but it seems to
                                   ; work against Cannonade.

look
qscan   for     36  ; this would be 38 if there was enough room in the program
        cmp.x   look+((qscan+1)*100), look+4000+((qscan+1)*100)
        mov.ab  #20+look+((qscan+1)*100)-found, @found
        rof

found   jmz     blind,  #0
zap     mov.i   jump,   @found
        mov.i   split,  <found
        sub     #4002,  found
        djn     -3,     #45
t       jmp     cclear, stone+4+1+DIST

stone   mov.i   <1-10,  3+10
        spl     -1,     #incr+1
        sub.f   incr,   stone
        djn.f   -2,     <-3002
incr    mov.i   10,     <-10

blind   spl     impgen
        mov     <f,     <t
        djn     -1,     #5
        jmp     stone+DIST

last
imp     mov.i   #0,     2667

        end     look
