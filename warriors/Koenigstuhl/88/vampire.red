;redcode
;name vampire
;The vampire is my favorite of the examples.  Vampire throws jump
;instructions around in memory (I call them "FANGS").  If one of the
;fangs happens to land in the enemy program then the enemy will jump
;into a trap.  The trap creates several hundred new programs which do
;nothing but jump to themselves.  This of course robbs the enemy of
;almost all his effective power.  Any other programs that he might
;have running will be going so slow as to be almost harmless.  When
;vampire detects that one of its fangs has found a jugular, it begins
;a methodical erasure of memory.  If all goes well, all the enemies
;programs will be erased, and VAMPIRE will win.

;*
;* Vampire -- seek out the enemy, drain the life out of him/her, and then
;* erase him/her in his/her weakened condition.
;*
;assert 1
nprc 	dat #500
;* the number of dummy processes that the enemy will be forced to make
spin	spl 0
	djn -1, nprc
trap	jmp -1
;*
	mov null, trap
	mov #0, spin
null	jmp 0
fang	jmp @1
bite	dat #1000
start	mov #(spin-bite), @bite
	sub bite, @bite
	sub #1, bite
        mov fang, @bite
	add #03, bite
;*
	cmp #500, nprc 	; have we caught anybody?
	jmp start	; nope.
;*
;* the enemy has been caught, and is currently being drained of energy. So 
;* start the process of erasing the world.
;*
	mov #100, bite	; start near here
erase	mov #0, @bite	; erase everything and	
	add #1, bite	; hope he dies before we kill ourselves
	jmp erase

	end start 
