;redcode verbose 
;name Gibraltar
;author Eric Prestemon
;assert 1

space equ 17 
orig  equ (-7-41*space)


	spl 0
	add pit,bomb
	mov bomb,@bomb			
	jmp -2
pit	mov space,<-space
	spl pit
	jmp -1		;hit
bomb	jmp pit-orig,#0+orig		;hit

        end

