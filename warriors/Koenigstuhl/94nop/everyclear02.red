;redcode
;name Everclear v 0.2
;author Franz
;strategy  spl/spl/dat clear
;assert 1

org start

;the imp gate
gate    dat 0,0
        dat 0,0

;where to bomb
where   dat #sbomb,#100

;buffer between gate and warrior
for 20
dat 0,0
rof

start   spl #0, >gate
cc      mov *where, >where
        mov *where, >where
        jmp cc, >gate

;decreased the forward start for the dat round
sbomb   spl #s2bomb-where,#50
s2bomb  spl #dbomb-where,#40
dbomb   dat #dbomb-where,#30

;it's better to include an end so that MARS doesn't get
;confused if there is anything afetr the warrior
end

