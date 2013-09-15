;redcode-94X
;name CG-X V
;author Brant D. Thomsen
;contact bdthomse@peruvian.cs.utah.edu
;strategy CURIOUS GEORGE TAKES SOME FRIENDS AND GOES STREAM FISHING
;strategy  A cross between Hydra and ROTLD, works very hard at being
;strategy  hard to find and kill.
;strategy Submitted: @date@
;assert CORESIZE==55440
;macro

size    equ     CORESIZE
dist    equ     (size / 32)
sdist   equ     (dist - 420)
bdist   equ     (size / 81)

for 39
        dat     #start*10, #-start*10
rof

split   spl.F   #0, <-40
wimp    djn.F   #0, <split-40

; Start all 32 of them simultaniously.

start   spl.A   p9, <start+sdist+bdist*1
        spl.A   p5, <start+sdist+bdist*2
        spl.A   p3, <start+sdist+bdist*3
        spl.A   p2, <start+sdist+bdist*4

p1      mov     wimp, start+sdist+dist*0
        mov     split, <-1
        mov     wimp, start+sdist+dist*1
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*5
        spl.A   @-3, <start+sdist+bdist*6

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*7, <start+sdist+bdist*8

p2      mov     wimp, start+sdist+dist*2
        mov     split, <-1
        mov     wimp, start+sdist+dist*3
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*9
        spl.A   @-3, <start+sdist+bdist*10

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*11, <start+sdist+bdist*12

p3      spl.A   p4, <start+sdist+bdist*13

        mov     wimp, start+sdist+dist*4
        mov     split, <-1
        mov     wimp, start+sdist+dist*5
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*14
        spl.A   @-3, <start+sdist+bdist*15

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*16, <start+sdist+bdist*17

p4      mov     wimp, start+sdist+dist*6
        mov     split, <-1
        mov     wimp, start+sdist+dist*7
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*18
        spl.A   @-3, <start+sdist+bdist*19

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*20, <start+sdist+bdist*21

p5      spl.A   p7, <start+sdist+bdist*22
        spl.A   p6, <start+sdist+bdist*23

        mov     wimp, start+sdist+dist*8
        mov     split, <-1
        mov     wimp, start+sdist+dist*9
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*24
        spl.A   @-3, <start+sdist+bdist*25

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*26, <start+sdist+bdist*27

p6      mov     wimp, start+sdist+dist*10
        mov     split, <-1
        mov     wimp, start+sdist+dist*11
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*28
        spl.A   @-3, <start+sdist+bdist*29

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*30, <start+sdist+bdist*31

p7      spl.A   p8, <start+sdist+bdist*32

        mov     wimp, start+sdist+dist*12
        mov     split, <-1
        mov     wimp, start+sdist+dist*13
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*33
        spl.A   @-3, <start+sdist+bdist*34

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*35, <start+sdist+bdist*36

p8      mov     wimp, start+sdist+dist*14
        mov     split, <-1
        mov     wimp, start+sdist+dist*15
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*37
        spl.A   @-3, <start+sdist+bdist*38

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*39, <start+sdist+bdist*40

p9      spl.A   p13, <start+sdist+bdist*41
        spl.A   p11, <start+sdist+bdist*42
        spl.A   p10, <start+sdist+bdist*43

        mov     wimp, start+sdist+dist*16
        mov     split, <-1
        mov     wimp, start+sdist+dist*17
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*44
        spl.A   @-3, <start+sdist+bdist*45

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*46, <start+sdist+bdist*47

p10     mov     wimp, start+sdist+dist*18
        mov     split, <-1
        mov     wimp, start+sdist+dist*19
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*48
        spl.A   @-3, <start+sdist+bdist*49

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*50, <start+sdist+bdist*51

p11     spl.A   p12, <start+sdist+bdist*52

        mov     wimp, start+sdist+dist*20
        mov     split, <-1
        mov     wimp, start+sdist+dist*21
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*53
        spl.A   @-3, <start+sdist+bdist*54

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*55, <start+sdist+bdist*56

p12     mov     wimp, start+sdist+dist*22
        mov     split, <-1
        mov     wimp, start+sdist+dist*23
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*57
        spl.A   @-3, <start+sdist+bdist*58

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*59, <start+sdist+bdist*60

p13     spl.A   p15, <start+sdist+bdist*61
        spl.A   p14, <start+sdist+bdist*62

        mov     wimp, start+sdist+dist*24
        mov     split, <-1
        mov     wimp, start+sdist+dist*25
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*63
        spl.A   @-3, <start+sdist+bdist*64

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*65, <start+sdist+bdist*66

p14     mov     wimp, start+sdist+dist*26
        mov     split, <-1
        mov     wimp, start+sdist+dist*27
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*67
        spl.A   @-3, <start+sdist+bdist*68

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*69, <start+sdist+bdist*70

p15     spl.A   p16, <start+sdist+bdist*71

        mov     wimp, start+sdist+dist*28
        mov     split, <-1
        mov     wimp, start+sdist+dist*29
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*72
        spl.A   @-3, <start+sdist+bdist*73

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*74, <start+sdist+bdist*75

p16     mov     wimp, start+sdist+dist*30
        mov     split, <-1
        mov     wimp, start+sdist+dist*31
        mov     split, <-1

        spl.A   @-4, <start+sdist+bdist*76
        spl.A   @-3, <start+sdist+bdist*77

        mov     2, -6
        mov     1, -5

        dat.A   <start+sdist+bdist*78, <start+sdist+bdist*79

        end     start
