;redcode
;name Gisela 3G6
;author Andrzej Maciejczak
;strategy B-scanner
;assert CORESIZE==8000

ival equ 692
gate equ -15

	dat       < gate,      < gate
	dat       < gate,      < gate
        dat       < gate,      < gate
	for 21
        jmn           -1,          #0
	dat       < gate,      < gate
	dat       < gate,      < gate
        dat       < gate,      < gate
	rof
jm1     jmn           -1,          #0
	dat       < gate,      < gate
da1	dat       < gate,      < gate
       mov	#-targ+1,      -5
scan   mov         stun, < (targ+ival+1);
main   add    #(ival+1),       @safe
start  jmz         main,       <scan
safe   mov           jm1,       @scan
targ   jmp         scan,       @scan	;
stun   spl            0, 	0
	sub	#2666,		@clear
clear  mov          da1,      <stun
       jmp	-2,	       0	;
	end start
