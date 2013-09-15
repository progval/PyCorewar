;redcode-94
;name paper01o
;author Beppe Bezzi
;strategy paper module, partially optimized with pmars

;assert CORESIZE == 8000

dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   ;pmars optimized
range   equ     933     ;pmars optimized

paper
	spl     1,      <300    ;\.
	spl     1,      <400    ;-> generate 8 consecutive processes
	spl     1,      <500    ;/.

silk    spl     @0,     {dest0
	mov.i   }-1,    >-1 
silk1   spl     @0,     <dest1  
	mov.i   }-1,    >-1     
	mov.i   bomba,  }range
	mov     {silk1, <silk2
silk2   jmp     @0,     >dest2
bomba   dat     <2667,  <1

end     paper
