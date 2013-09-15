;redcode-94
;name Marcia Trionfale
;author Beppe Bezzi
;strategy A solid silk, Timescape like, base 
;strategy tuned for max scissors resistance
;strategy and some bombing add on
;assert CORESIZE == 8000

A0      equ     3488
A1      equ     1860
A2      equ     3740
B0	equ	3620
B1	equ	1270
B2	equ     -350
start
	spl     startb, <1000
	
	spl     1,      <300    ;\.
	mov     -1,     0       ;-\ generate 10 
	mov     -1,     0       ;-/ processes
	spl     1,      <400    ;/.

silk    spl     @0,     }A0     ;split 
	mov.i   }-1,    >-1     ;copy 
	mov.i   bomb,   {123    ;bombing
silk2   spl     @0,     }A1     ;split
	mov.i   }-1,    >-1     ;copy
	mov.i   bomb,   >1001   ;bombing
	mov.i   bomb,   }2042   ;A-indirect bombing
	mov.i   {silk2, <silk3  ;copy
silk3   jmp     @0,     >A2     ;jmp new copy 
bomb    dat.f   >2667,  >5334   ;anti-imp bomb

for 70
	dat     0,0
rof

startb        
	spl     1,      <300    ;\.
	mov     -1,     0       ;-\ generate 10 
	mov     -1,     0       ;-/ processes
	spl     1,      <400    ;/.

silkb   spl     @0,     }B0     ;split 
	mov.i   }-1,    >-1     ;copy 
	mov.i   bombb,  }113    ;bombing
silk2b  spl     @0,     }B1     ;split 
	mov.i   }-1,    >-1     ;copy 
	mov.i   bombb,  >1001   ;bombing
	mov.i   bombb,  }2042   ;A-indirect bombing
	mov.i   {silk2b,<silk3b ;copy 
silk3b  jmp     @silk3b,>B2     ;jmp new copy 
bombb   dat.f   >2667,  >5334   ;anti-imp bomb

