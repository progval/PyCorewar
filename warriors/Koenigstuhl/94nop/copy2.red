;redcode-94
;name Copy2
;author sgb
;assert	1
OFFSET  equ     20
;Variables
ptr     dat     #1,	#2
;Initialise
start   mov.a   #last-ptr,      ptr     
	mov.ab  #(last+OFFSET)-ptr,	ptr
	mov.ab  #(last-ptr)/2,	count
;Do the copy
loop    mov.i   {ptr,	<ptr
	mov.i	{ptr,	<ptr
count	djn     loop,	#0
;Jump to run the new copy
	jmp     start+OFFSET
last    end     start
