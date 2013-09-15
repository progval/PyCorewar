;redcode-94t
;name Tiny Tiberius
;author Franz
;strategy silk+coreclear
;strategy CC Paper is back with vengeance
;url http://www.azstarnet.com/~franz
;assert CORESIZE==800

fcp EQU 303
scp EQU 236
tcp EQU 77

	org boot

boot
	spl 1,>-300  ;letz get 9 processes together
	mov.i -1,#0
	mov.i -1,#0
	mov.i -1,#0

frog    spl     @0,     <fcp
frogc   mov     }-1,    >-1
	spl     @0,     <scp
	mov     }-1,    >-1
	spl     @0,     <tcp
	mov     }-1,    >-1
	mov     >600,      <frogc
	mov     >200,      <frogc
	jmp     -2,     >-10
datz    end

