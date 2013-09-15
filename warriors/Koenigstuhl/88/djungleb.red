;redcode verbose
;name Djungle Bungle
;author Jonas Hartwig
;assert CORESIZE==8000
;strat Warrior submitted @date@
;strat -------------------
;strat 1. Stunner
;strat 2. Coreclear
;strat -------------------
;url mailto:yllis@dataphone.se

mod4 	equ 3044

top 	dat #0,#0
delta 	dat #-mod4,#mod4
bomb 	jmp trap,#0  	;h=84r kommer en
start 	add delta,bomb
 	mov bomb,@bomb
 	jmp start
    	dat #0   	;h=84r kommer en
trap 	spl 0,2000
 	djn trap,-1
 	jmp 2
 	dat #0   	;h=84r kommer en
 	mov delta,trap
 	mov delta,<1
 	jmp -1,top
 	end start

