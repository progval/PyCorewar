;redcode-94
;name CG IV
;author Brant D. Thomsen
;strategy CURIOUS GEORGE TAKES SOME FRIENDS AND GOES STREAM FISHING
;strategy  A cross between Hydra and ROTLD, works very hard at being 
;strategy  hard to find and kill.
;assert 1

size    equ     8000
dist    equ     (size / 8)
sdist   equ     (dist - 420)
bdist   equ     (size / 21)

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2
        dat     #start*2, #-start*2

split   spl.F   #0, <-50
wimp    djn.F   #0, <split-50

; Start all eight of them simultaniously.

start   spl.A   p3, <start+sdist+bdist*1
        spl.A   p2, <start+sdist+bdist*2

        mov     wimp, start+sdist+dist*0
        mov     split, <-1
        mov     wimp, start+sdist+dist*1
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*3
        spl.A   @-3, <start+sdist+bdist*4

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*13, <start+sdist+bdist*14

p2      mov     wimp, start+sdist+dist*2
        mov     split, <-1
        mov     wimp, start+sdist+dist*3
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*5
        spl.A   @-3, <start+sdist+bdist*6

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*15, <start+sdist+bdist*16

p3      spl.A   p4, <start+sdist+bdist*7

        mov     wimp, start+sdist+dist*4
        mov     split, <-1
        mov     wimp, start+sdist+dist*5
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*8
        spl.A   @-3, <start+sdist+bdist*9

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*17, <start+sdist+bdist*18

p4      mov     wimp, start+sdist+dist*6
        mov     split, <-1
        mov     wimp, start+sdist+dist*7
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*10
        spl.A   @-3, <start+sdist+bdist*11

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*19, <start+sdist+bdist*20

        end     start
