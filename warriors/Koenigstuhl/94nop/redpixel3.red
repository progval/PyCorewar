;redcode-94
;name RedPixel.3
;author John Lewis
;strategy jmz.f carpet-bombing scanner based on Rave.red
;strategy (which was based on agony)
;strategy V.1 New system, it ever works sometimes!
;strategy V.2 Now with comments!
;strategy V.3 Shorter by 3 lines.
;assert 1

res equ 721 ;6381 ;721

org top

tail    dat.f   -100,-100       ;target for gunning

for 2
dat 0,0
rof

top     sub.ab  #res,#-100      ;subtract from traget
eyes    jmz.f   top,@top        ;scan for target
        slt     #15,top         ;if it's me, skip it
        djn     top,foot       ;if it's me decrement counter
vein    mov.ba  top,tail        ;mov target range into sight
        add.b   @top,top        ;add range as next to be checked
abdom   mov.i   sting,}tail     ;lay fire
meter   djn.b   abdom,#top-tail+3 ;counter for fire
        mov.ab  #top-tail+3,meter ;increment counter
foot    slt.ba  #10,#20         ;if i've done this enough,coreclear
        jmp     eyes            ;start at top.
sting   spl.a   #0,#0           ;core clear
        mov.i   log,<1         ;core clear
        jmp -1,-3
log     dat foot,-3

