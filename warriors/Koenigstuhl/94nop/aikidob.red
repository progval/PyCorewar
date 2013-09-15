;redcode-94
;name Aikido.beta
;strategy wait till @date@ and see.
;author John K. Lewis
;assert 1

throw   equ     -600
step    equ     95
count   equ     533
gate    equ     start-1


org start

        dat 1,1 ;membrane start
        dat 1,2
        dat 1,3
        dat 1,4
        dat 0,1
        dat 0,2
        dat 0,3 ;The membrane helps check for scanners
        dat 0,4
        dat 0,5
head    dat 0,6
        dat 0,7 ;membrane end


top     dat 0,-100


        seq     head,butt 	;checks the membrane
        jmp     scan    	;goto anti-scanner tactic
start   sne     <top,>bottom	;check outside world for contact
        jmp     -3
;       sne     <top,>bottom   	;if skipped then coreclear
;       jmp     bomber,<bottom  ;goto anti-bomber tactic
;       jmp     0       	;coreclear tactic

bomber  mov     jill,>bottom 	;anti bomber tactic
        mov     jill+1,@bottom
        spl     @bottom,>top
        mov     jack,>top
        mov     jack+1,@top
        spl     @top
        spl     @bottom
        jmp     @top
jill    mov     -1,>2
        jmp     -1,>1
jack    mov     -1,<-2
        jmp     -1,<-3

scan    mov     ton,throw	;anti scanner tactic
        mov     ton+1,throw
        mov     ton+2,throw
        mov     ton+3,throw
        mov     ton+4,throw
        mov     ton+5,throw
        mov     ton+6,throw
        jmp     throw+scan
; I think this is the tornado engine.
ton     mov     bombd,  @stone
stone   mov     step+2, @(2*step)+2
        add     incr,   stone
jump    djn.b   ton,  #count
incr    spl     #3*step,#3*step
clr     mov     bombd,  >gate
bombd   dat     step,   step


bottom  dat     0,100

        dat 0,7 ;membrane start
butt    dat 0,6
        dat 0,5
        dat 0,4
        dat 0,3
        dat 0,2
        dat 0,1
        dat 1,1
        dat 1,2
        dat 1,3
        dat 1,4 ;membrane end

