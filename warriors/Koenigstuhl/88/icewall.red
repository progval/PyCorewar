;redcode
;name Icewall
;author Matt Hastings
;assert 1
inc     dat #155,#-155
        mov -2,@-2
jb      jmp 7,0
start   spl 0,<2000-1368
b1      mov <-2-5+155+2945,0+5-155-2945
        add inc,@t3
        jmp -2,<-3
        mov @-9,<-6
        spl -1,jb
        t3 jmp -2,b1

        end start
