;redcode-tiny
;name Tiny Star v0.10
;author brx
;strategy oneshot.
;assert 1

scd	    equ 10
sstep	    equ 20
sstart	    equ MAXLENGTH+MINDISTANCE-2

magic       equ 14
gate	    equ 200

    org comp

ptr	    spl #ssd-1, #0
	    spl #2, #magic
	    dat #0, #magic
            dat 0, 0

scan        add.f dp, comp
comp        sne sstart, sstart+scd
	    djn.f scan, *-1

	    mov.ab comp, ptr

	    spl #1, #magic
ssd	    mov *ptr, >ptr
            mov *ptr, >ptr
            djn.f -2, <-gate+ptr

dp	    dat #sstep, #sstep
