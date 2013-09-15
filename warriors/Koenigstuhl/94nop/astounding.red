;redcode-94
;name A-stounding
;author Simon Hovell
;strategy modified Beholders Eye (v1.1)
;assert 1

start:  add.AB #76,scan
zero:   jmz.A -1,@scan
        mov.I rewind,@scan
scan:   mov.I stop, <zero
        jmn.B start,start
stop:   spl.AB 0,<0
        mov.I gate,<-6
rewind: jmp.A -1,0
gate:   dat.AB <-92,<-2
