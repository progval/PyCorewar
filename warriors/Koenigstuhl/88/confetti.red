;redcode verbose
;name Confetti
;author Pierre Baillargeon
;strategy   v0.99:  Leave stuff everywhere.
;strategy   v1.00:  Fastest clear core.
;strategy   v1.10:  Copy ourselves away.
;strategy   v1.20:  Change step and kill method.
;strategy   v1.22:  One instruction smaller.
;strategy   v1.30:  Now affect 3 locations / 4 cycles.
;strategy   v2.00:  Start mod-5, decrement, end core-clear.
;strategy   v2.10:  Smaller.
;strategy   v2.20:  Self-splitting, mod-random, mutagenizing.
;assert 1

dist1	equ -15			; mod-5 but not 10
dist2	equ (-70+1)             ; mod-10 but not 20

many	spl 0,<kill		; staying alive
kill	mov bomb1,@back+dist2	; decrement and bomb2
clear	mov bomb1,@kill		; decrement and bomb1 (mod-8)
        add #dist2,kill		; change location (mod-16)
back	djn kill,<1998		; redo if not zero: small protection

bomb1	dat #0,#dist1		; bombs are not moved away

	end many
