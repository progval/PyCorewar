;redcode quiet
;name T.Rex
;author P.Kline
;strategy stone-paper with a lookout for imps
;strategy added anti-vamp code
;assert 1
step    equ 2376
boot    equ 2000
imp     equ 2667
start   spl scan,1
        spl 1,1
        mov <copyf1,<copyt1
        mov <copyf1,<copyt1
copyt1  jmp @0,copyf1+boot

stone   spl 0,#step
        add stone,bomb
bomb    mov dat1,nobomb-boot
dat1    dat <0,<-3000
copyf1  dat #0

scan    cmp imp1,@bomb+boot
        djn scan,#150
        mov #imp,@stptr
        sub #(step*2)+2,@bmptr
        spl s2paper,2300
        jmp s1paper,4400

nobomb  dat #1000

s1paper spl p4,stone+boot
stptr   spl p3,stone+boot
        spl p2,bomb+boot
bmptr   spl p1,bomb+boot
        spl 0,5500
avamp1  mov 2,<-500
        sub @avamp1,<avamp1
        dat #0
p1      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3031
        add #187,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p2      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3131
        add #287,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p3      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3231
        add #387,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p4      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3531
        add #487,-1
        jmz -5,-5
        mov 0,-4
        dat #1
s2paper spl p8,<-500
        spl p7,<-750
        spl p6,<-1000
        spl p5,<-1500
        spl 0,5500
avamp2  mov 2,<-4500
        sub @avamp2,<avamp2
        dat #0
p5      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3631
        add #587,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p6      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,3831
        add #687,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p7      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,4131
        add #787,-1
        jmz -5,-5
        mov 0,-4
        dat #1
p8      mov #8,0
        mov <-1,<2
        jmn -1,-2
        spl @0,4331
        add #887,-1
        jmz -5,-5
        mov 0,-4
        dat #1
imp1    mov 0,imp
