;redcode-94
;name myTest
;author Paulsson
;strategy A.Ivner get's some credit.
;strategy Shorter, gate but will lose to paper instead.
;strategy Submitted: 14 january 96     
;assert CORESIZE > 1

org     new

step    equ     (5*9)

        dat     0,<-2*step-1    ;gateing bomb
back    spl     #-2*step,<-2*step
bmba    mov.i   -1,{-1          ;core clear
        djn.f   -1,>next
        dat.f   0,0        
        dat.f   0,0
next    mov.i   bmbb,<ptr       ;move second bomb of the inc
ptr     seq.i   start-1+4*step,@start+2*step    ;scan
        add.f   back,ptr        ;go back if found anything
        add.f   forw,ptr        ;add step  
start   jmz.a   next,@ptr       ;scan
        mov.i   bmba,@ptr       ;bomb half incineary
        jmz.f   *start,forw-1   ;continue?
        djn.f   back,bmba
        dat.f   0,0                    
        dat.f   0,0              
forw    dat     3*step,3*step+1
bmbb    spl     #7,step

i for 60
         dat.f   $0,$0
rof

new      mov.i   start-1,start-1+step   ;make it scan longer
         mov.i   start-1,start-1-step
         mov.i   -1,start-1-2*step
         jmp             start
