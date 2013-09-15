;redcode-lp test
;name Foobar
;author bjoern guenzel
;assert 1
;strategy Incendary Bomber with economy airbag
;strategy running with five processes
;strategy changed d-clear for maniacs tournament
;strategy can't really test the code, so no further 
;strategy adaptions to lp-conditions :-(

;show off
;constants

secret	equ (500)	;change boot distance for publication
;setshift equ (secret-1000)
mshift	equ (secret-2270)
clshift	equ (secret-3100+4)
setshift equ (mshift-step+bopclm-check-1390+80) ;erase bootpointer with first bomb
mcldist	equ (mshift-clshift)

step	equ (2234)

;show on
;code

; ** Core Clear and rescue **

clptr	dat >-1,ptr+mcldist	;pointer for Core Clear
clb	dat >-1,last-clptr+9	;bomb for Core Clear	
 dat 0,0
 dat 0,0
 dat 0,0
 dat 0,0
 dat 0,0
mv	mov.i @(-2*step),}-step	;mv half of incendary + check reference
sb	spl #step+1,1		;spl part of incendary
 mov.i clb,>clptr	;d-clear
last	jmp.f {0,}0		;hope this works...
zero	dat 0,0
 dat 0,0
 dat 0,0

; ** bomb loop **

 mov.i zero-mcldist,#0	;helps putting five processes into the loop
ptr	mov.i sb-mcldist,@check+2*step
check	sub.ab mv-mcldist,ptr	
 mov.i }check,@ptr ;prepare to check
heel	jmn.a ptr,{check ;achilles heel not protected :-(
mlast	jmp.f sb-mcldist,<mv-mcldist	

; ** set up five processes **

 spl 1,1
bopclb	mov.i -1,#clb+1+clshift-setshift
bopclm	mov.i -1,#zero+1+clshift-setshift
setup	jmp >0,#mlast+1+mshift-setshift		;pointer erased by bombs

; ** boot **

boot z	for 4
 mov.i <bootptr,{bootptr	;boot setup
 rof

  for 6
 mov.i <clsource,<bopclm+setshift ;boot clear
 rof

 for 2
 mov.i {clsource,<bopclb+setshift ;boot clear data
 rof

 for 6
 mov.i <msource,<setup+setshift ;boot main loop
 rof

bootptr jmp setup+1+setshift,setup+1

clsource dat #clb+1,#zero+1
msource	dat #0,#mlast+1

; ** redundant space **

 for 15
 dat 0,0
 rof

 z	for 100-CURLINE 
 spl #z,-z
 rof

 end boot
