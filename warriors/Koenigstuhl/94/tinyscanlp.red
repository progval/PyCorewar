;redcode-94lp
;name tiny scan lp
;author bjoern guenzel
;strategy paper x-tinction ??? Probably not :-(
;strategy 0.66c size 12 scanner, bombs with s/s/j -> d/d/d... clear
;strategy wasted youth version, the original doesn't run properly
;strategy with 8 processes...
;strategy beta test - no boot or decoy yet
;assert CORESIZE==8000
;release 22.6.96

step5		equ 15
dist		equ step5		
	
step		dat #2*step5+1,#2*step5	
b0		stp.ab >0,#0		;first compared+decr
		dat 0,0			;semi-gate
		dat 0,0			;scanned, better put same to +/- dist
		dat 0,0
loop		add.x step,@ref		
return		sne.f *ptr,<ptr		;'<' resets pointer after bombing
jb		jmp loop,<-5		;jmp bomb and bomb pointer
ptr		mov.x #ptr+step5+dist,#ptr+step5+1	;22 to step
x		mov.i @b0,>ptr
ref		mov.i b1,>ptr
decref		mov.i jb,@ptr		;hit with jb -> clear :-)
modi		djn.b return,@decref	;last action: decrement return
last		dat 0,0			;scanned, 5 to ptr,12 to b0
for 17
		dat 0,0
rof
		dat >2667,#last-ptr+1	;30 to b0, 23 to ptr
for 10
		dat 0,0
rof	
b1		spl #-7,#3		;34 to ptr
		
		
for MAXLENGTH-CURLINE
		dat 0,0
rof
		end return

