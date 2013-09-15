;redcode-94 test
;name Boys are Back in Town 1.1
;author Philip Kendall
;strategy Blur-style scanner
;strategy Quicker boot + more anti-imp
;assert CORESIZE==8000

bdist   equ     -200

	mov.i   87,>6                   ; scanned-lo
boot
i       for     10
	mov.i   (ptr+i-1),>bptr
	rof
bptr    jmp.a   (scan+bdist),(ptr+bdist)
	spl.ab  #1,@1
	spl.a   #1,@1
	spl.b   #1,@1

	mov.i   87,>1                  ; scanned-hi

	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,1
	spl.b   #1,1
	spl.ab  #1,1
	spl.ba  #1,1
	spl.f   #1,1                    ; scanned-lo
	spl.x   #1,1
	spl.i   #1,1
	spl.a   #1,*1
	spl.b   #1,*1
	spl.f   #1,1                    ; scanned-hi
	spl.a   #1,#1
	spl.b   #1,#1

step    equ     1970
gate    equ     (ptr-2)

ptr     mov.i   -20,>(scan-bdist)
loop    mov.i   inc,>ptr
scan    seq.i   2*step,2*step+5         ; scanned-lo
	mov.ab  scan,@loop
	sub.f   inc,scan
	jmn.b   loop,@loop
inc     spl.x   #-step,>-step
clear   mov.i   cbomb,>gate             ; scanned-hi
	djn.f   clear,>gate
cbomb   dat.f   >5335,cbomb-gate+3

	spl.b   #1,@1
	spl.ab  #1,@1

	end     boot


