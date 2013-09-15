;redcode verbose
;name PLASMA 4a
;author Wayne Sheppard
;assert 1

bomb      equ (start-1)

start     add #3039,loc  ;mod 1
loc       jmz start,-1
          cmp #-1,@loc   ;don't look at DJN trails
          slt #100,loc   ;program length
          jmp start
          spl rep

          spl 0
          mov bomb,<loc
          jmp -1,<loc

rep       spl rep2      ;Replicator from FlashPaper
          spl 1         ;   by Matt Hastings
          spl 1
          spl paper4
          spl paper3
          spl paper2
          mov #8,8
paper1    mov <-1,<2
          mov <-2,<1
          spl @0,-2340
          mov <-1,<1020
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper2    mov <-1,<2
          mov <-2,<1
          spl @0,5823
          mov <-1,<-740
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper3    mov <-1,<2
          mov <-2,<1
          spl @0,1000
          mov <-1,<-3690
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper4    mov <-1,<2
          mov <-2,<1
          spl @0,6109
          mov <-1,<1873
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
rep2      spl 1
          spl 1
          spl paper8
          spl paper7
          spl paper6
paper5    mov <-1,<2
          mov <-2,<1
          spl @0,3009
          mov <-1,<-200
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper6    mov <-1,<2
          mov <-2,<1
          spl @0,4832
          mov <-1,<-1830
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper7    mov <-1,<2
          mov <-2,<1
          spl @0,1080
          mov <-1,<4096
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
          mov #8,8
paper8    mov <-1,<2
          mov <-2,<1
          spl @0,-3040
          mov <-1,<-195
          jmz -5,-5
          mov 0,-1
          dat #0,#1
          dat #0,#1
