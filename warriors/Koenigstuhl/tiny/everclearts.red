;redcode-94t
;name Tiny Everclear S
;author Franz
;strat  jmz scan -> spl/spl/dat clear
;assert CORESIZE==800
org start

;where to bomb
where   dat #clear,#datz+40
s2bomb  spl #dbomb-where,#datz+20
dbomb   dat #dbomb-where,#datz+10

;buffer between gate and warrior
for 5
dat 0,0
rof

start   jmz.f #0,>where
clear   spl #s2bomb-where,#50
cc      mov *where, >where
        jmp cc, >where-2

datz    end

