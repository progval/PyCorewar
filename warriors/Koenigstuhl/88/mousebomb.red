;redcode-iwcs verbose
;name MouseBomb
;author Gabler Alexander
;assert CORESIZE == 8000

ptr     dat     #0      , #0
start   mov     #12     , @ptr
loop    mov     @ptr    , <copy
	djn     loop    , ptr
	spl     bomb
	spl     @copy   , 0
	add     #330    , copy
	jmz     start   , ptr
bomb    mov     -1      , -10
	jmp bomb
copy    dat     #0      , #1984

	end start
