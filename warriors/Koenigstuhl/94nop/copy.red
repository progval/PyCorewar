;redcode-94
;name Copy
;author sgb
;assert 1
;Block copy code: traditional assy style
OFFSET  equ     20
;Variables (data is arbitrary)
src     dat     #1
dest    dat     #1
count   dat     #1
;Initialise variables
;(subtract dest adr from data adr to)
;(get offset right when executed)
start   mov.ab  #last-src,      src     
	mov.ab  #(last+OFFSET)-dest,    dest
	mov.ab  #last-src,      count
;Do the copy
loop    mov.i   <src,           <dest
	djn     loop,           count
;Jump to run the new copy
	jmp     start+OFFSET
last    end     start
