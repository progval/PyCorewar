;redcode-94x
;name Memories
;author Beppe Bezzi
;strategy cmp scanner like Iron Gate
;strategy with spl spl jmp bombs and 94 improvements
;strategy v07x sne seq engine and better constants for 55440
;assert 1

org     dmake

dist    equ     799	;big core step
scan    equ     dist*2     
safe    equ     (kill-first+2)
djns    equ     1490
decoy   equ     CORESIZE/4
dst     equ     13
stun    equ     kill+30

	jmp     s+1
first   add     off,    @x
loc     sne.f   dist-1, -1
	add	off,	@x
	seq.f	*loc,	@loc
	slt     #safe,  @x
	jmp     first
	mov     j,      @loc
x       mov     stun,   <loc
	mov     stun,   <loc
	sub     s,      @x
	jmn.b   @x,    	loc-1
s       spl     #-dist, <-dist-2
	mov     kill,   >first-1
	mov     kill,   >first-1
j       jmp     -2,     #0
off     dat     <scan,  <scan
kill    dat     <34117, kill-first+6

for 5
	dat     0,0
rof
for MAXLENGTH-CURLINE-12
	spl     #0,#0
rof

dmake
a for 11
	mov    <decoy+a*dst, <decoy+dist+a*dst
rof
	jmp     first
end



