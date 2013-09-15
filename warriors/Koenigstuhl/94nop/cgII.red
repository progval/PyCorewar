;redcode-94
;name CG II
;author Brant D. Thomsen
;strategy CURIOUS GEORGE TAKES SOME FRIENDS AND GOES STREAM FISHING
;strategy  Seven friends are better than none!
;strategy  A cross between Hydra and ROTLD, works very hard at being 
;strategy  hard to find and kill.
;strategy  Good for tournament play, since tends to tie when it doesn't win.
;strategy Submitted: @date@
;assert 1

dist    equ     (8000 / 8)
sdist   equ     670

; The standard version of George
split   spl.A   #0, <wimp
wimp    djn.A   #-100, <wimp

; An alternate version of George that will die eventually,
;  but DAT bombs the core meanwhile.
asplit  spl.A   #-100, <-100
amove   mov     @-50, <asplit
awimp   djn.A   0, <asplit

; Make 6 copies of George, and two copies of his alternate.
start   mov     wimp, start+sdist
        mov     split, <-1
        mov     wimp, start+sdist+dist
        mov     split, <-1
        mov     wimp, start+sdist+dist*2
        mov     split, <-1
        mov     wimp, start+sdist+dist*4
        mov     split, <-1
        mov     wimp, start+sdist+dist*5
        mov     split, <-1
        mov     wimp, start+sdist+dist*6
        mov     split, <-1
        mov     awimp, start+sdist+dist*3
        mov     amove, <-1
        mov     asplit, <-2
        mov     awimp, start+sdist+dist*7
        mov     amove, <-1
        mov     asplit, <-2

; Start all eight of them simultaniously.
        spl.B   p3, <dist+500
        spl.B   p2, <dist

        spl.B   @start, <dist*2
        jmp.B   @start+2, <dist*3

p2      spl.B   @start+4, <dist+(dist/2)
        jmp.B   @start+6, <dist*2+(dist/2)

p3      spl.B   p4, <dist-500

        spl.B   @start+8, <dist*2+500
        jmp.B   @start+10, <dist*3+500

p4      spl.B   @start+12, <dist+(dist/2)+500
        jmp.B   @start+15, <dist*2+(dist/2)+500

        end     start
