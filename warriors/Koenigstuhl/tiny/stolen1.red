;redcode-94x verbose
;name Stolen1
;author Robert Macrae
;strategy PSwitcher based on hill components
;strategy TinyTim, Poke1, Snufkin
;assert 1

papt    equ     (pgo+6-ptr)
stpt    equ     (stone+6-ptr)

	org	think

load0
z 	for 0
  	rof

; switch on loss, state 0 on tie
state	equ	(load0-250)

think	ldp	}state	,	state
	ldp.ab	state	,	@state
	stp.a	@state	,	<state+1
	jmz.b	w1	,	@state+1

ptr     mov.ab  #papt   ,       #stpt

w1	mov 	<ptr	, 	<pgo
	mov	<ptr	,	<pgo
	djn	-2	,	#3
        jmp     @pgo    ,       <pgo

;----

     s1 equ 60
     s2 equ 444

pgo: spl   1,        {-226
     spl   1,        >-297
pap1:spl   @0,       {s1
     mov   }pap1,    >pap1
     mov   {pap1,    {pap2
pap2:djn.f s2+1,     {355

;----

stone   SPL.B   #28,    >-28    ; mod-4
loop    MOV.I   {0+28,  2-28
        ADD.F   stone,  loop
        DJN.F   loop,   <462    ; SPL is placed here
        MOV.I   5,      <-10    ; for the core-clear

