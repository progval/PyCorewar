;redcode-imt2
;name IMT#2_w2
;author Herve Lepaisant
;strategy pure replicator
;assert 1
boot:	spl	1,}39	; generate 2 process
copy:	spl	14,#0	; split to new copy
	mov 	>-1,}-1	; copy the code
	jmp	-3,<-2	
end boot

