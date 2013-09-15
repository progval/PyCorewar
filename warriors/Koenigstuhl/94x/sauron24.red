;redcode-94x
;name Sauron v2.4
;author Michael Constant
;contact mconst@soda.berkeley.edu
;strategy  quick-scan -+-(found enemy)--> spl/dat cclear --> perfect gate
;strategy              \-(found nothing)--> 13x3 spiral and cclearing stone
;kill Sauron
;assert CORESIZE==55440
;macro


DIST    equ     -19000

cclear  mov     split,  <-10
        jmz.a   cclear, last+10
split   spl     #11,    <-30
        mov     bomb,   <-5
jump    jmp     -1,     <-32

f
impgen  spl     1,      stone+4+1
        spl     1
        mov     -1,     0
        mov     -1,     0
        spl     1
        spl     2
        jmp     @0,     imp
        add     #35873, -1

bomb    dat     <-32,   <-31      ; as far as I know there are no big gate-
                                  ; crashing imps around...

look
qscan   for     85
        cmp.x   look+((qscan+1)*200), look+(CORESIZE/2)+((qscan+1)*200)
        mov.ab  #-60+look+((qscan+1)*200)-found, @found
        rof

found   jmz     blind,  #0
zap     mov.i   split,  >found
        mov.i   jump,   @found
        add     #(CORESIZE/2)+2, found
        djn     -3,     #75
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
imp     mov.i   #0,     35873

        end     look


                - Michael Constant
