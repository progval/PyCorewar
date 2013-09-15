;redcode-b
;name Monitor
;author M R Bremer
;strategy Need to track the b-hill.
;strategy 3-shot to scan to partial spl dat clear
;strategy Not the time or energy for full double spl/dat
;assert 1
u       jmp o, o        
s       add.f inc, 2
        mov.i off, @1
p       mov.i >-2, @0
        jmz.a -3, *-1
        djn.b -4, #2
o       spl #20, 10     ; self hit in b field sometimes
        mov.i @u, }p
        mov.i @u, }p
        djn.f -2, <-20        
d       dat 20, <2667
for 27
        dat 0, 0
rof
off     dat 1, 445
inc     dat -445, 445*2
