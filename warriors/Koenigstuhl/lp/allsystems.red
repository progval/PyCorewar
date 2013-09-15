;redcode-lp
;name	All Systems Normal
;author Robert Hale
;assert CORESIZE == 8000
;strategy	if LP then bomber else paper
;strategy	so if people used the same strategy in both environments
;strategy   All Systems Normal should crush it in one environment
;strategy	with the exception of paper but LP papers are specialist
;strategy	that I do not expect to see.
;strategy	
;strategy	of course everyone else will submit papers 
;strategy	and I will be crushed ;-)

start	spl	sboot			;Start bomber
	spl	1,	<5000		;create 8 more processes
	spl	1,	<2000		
	spl	1, 	<3000		
	spl	paper,<4000		;if in LP environment this statement is 
	dat	<1000,<-1000	;a NOP and no paper otherwise the paper 
				;is launched and soon dominates the bomber

;the bomber is from the scanner killer hint in CW #66 by Paul Kline
saway		equ		3221

sboot		mov		Stone, saway
		mov		Stone+1, saway
		mov		Stone+2, saway
		jmp		saway+sboot

sStep	equ	3174
Stone     	mov    	{1545     ,1-sStep
          	sub.x  	#sStep   ,-1
          	jmp    	-2       ,}-2

for MAXLENGTH-CURLINE-11
	dat	0,0
rof

;the paper is Sad from Obvious
len     EQU 9
fcp     EQU 3039
scp     EQU 2365
tcp     EQU 777

paper   spl @0,         <fcp-len
        mov }-1,        >-1
        mov }-2,        >-2
        spl @0,         <scp
        mov }-1,        >-1
	  mov	<-1000, 	<1000
        spl @0,         <tcp
        mov }-1,        >-1
        mov 2,          <-fcp+len+1
        jmp -1,         <-10
        dat <2667,      <2667*2


	end start
