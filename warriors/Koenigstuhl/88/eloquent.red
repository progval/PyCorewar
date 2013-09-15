;redcode
;name Eloquent
;author P.Kline
;strategy replicator using six processes
;assert 1

space1   equ 34
space2   equ 49
space3   equ (34+49)

start1   spl start2
         spl 35
p1       mov #6,p1
next     add #-31,new
         mov <p1,<new
new      spl @0,7000
         jmz p1,p1
erase    mov 0,<0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
start    spl wait1
         spl wait2
         jmp wait3
wait1    jmp 1
wait2    jmp 1
wait3    spl 1
         jmp start1

         spl 35
         mov #6,0
         add #-31,2
         mov <-2,<1
         spl @0,7000
         jmz -4,-4
         mov 0,<0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
start2   spl 35
         mov #6,0
         add #-31,2
         mov <-2,<1
         spl @0,7000
         jmz -4,-4
         mov 0,<0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         spl 35
         mov #6,0
         add #-31,2
         mov <-2,<1
         spl @0,7000
         jmz -4,-4
         mov 0,<0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         dat #0
         end start
