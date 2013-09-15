;redcode-94b
;name RedPixel.2
;author John Lewis
;strategy jmz.f carpet-bombing scanner based on Rave.red
;assert CORESIZE==8000
;strategy (which was based on agony)
;strategy V.1 New system, it ever works sometimes!
;strategy V.2 Now with comments!
res equ 721

top     sub.ab  #res,#-100      ;subtract from traget
eyes    jmz.f   top,@top        ;scan for target
        slt     top,#20         ;if it's me, skip it
foot    jmp     vein,150        ;jump to target aquired status
        jmp     top,<foot       ;if it's me decrement counter and start over
tail    dat.f   -100,-100       ;target for gunning
vein    mov.ba  top,tail        ;mov target range into sight
        slt     @top,#100
        add.b   @top,top        ;add range as next to be checked
abdom   mov.i   sting,{tail     ;lay fire
meter   djn.b   abdom,#tail-top ;counter for fire
        mov.ab  #tail-top+1,meter ;increment counter
        slt     foot,#130       ;if i've done this enough, coreclear
        jmp     eyes            ;start at top.
sting   spl.a   #0,#0           ;core clear
        mov.i   tail,<-1        ;core clear

        end

