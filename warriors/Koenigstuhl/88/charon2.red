;redcode verbose
;name Charon v2.0
;author J.Cisek
;strategy creation date 4/11/92
;strategy cmp scan, spl trap, clear core, etc.
;strategy  v1.1 4/14/92 improved trap [reversed in v1.3]
;strategy  v1.2 4/16/92 improved clear core routine
;strategy  v1.3 4/21/92 original trap, optimal step, smaller code
;strategy  v2.0 4/22/92 total code overhaul
;strategy   mod 3 cmp scan with optimal step, new deadly trap
;assert CORESIZE==8000

START	equ 1581
STEP	equ 1581
HALF	equ 4000
COUNT	equ 1333

target	cmp START, START+HALF		;this must be first for SLT to work
counter	jmp gotem, #COUNT		;also used as counter
search	add steps, target		;start new search here
	djn target, counter		;countdown to clear

clear	mov bomb, <bomb			;your typical clear core
	jmp clear, #0			; routine
bomb	dat #clear			;visible bomb

gotem	slt #trap+3-target, target	;don't hit self
	jmp search, #0			;skip over self
	mov trap+1, @target		;move trap in place
	mov trap, <target
	add switch, target		;swap a and b operands
	jmp target, #0			;cmp again (same location)

steps	dat #STEP, #STEP		;our step value
switch	dat #HALF, #HALF+1		;the swap value
trap	spl 0, #0			;the trap
	jmp trap, #0

	end target

