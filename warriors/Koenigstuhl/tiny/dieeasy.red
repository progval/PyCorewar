;redcode
;name Die Easy
;author Jakub Kozisek
;strategy paper
;assert CORESIZE == 800

; my "thank you very much" is going to:
;	John Metcalf - name
;	Roy (code) - mail sessions
;	Fizmo - nice paper article
;	Will, Mizcu, Neogryzor - nice IRCing (you are all cool listeners ;)
;	Mom and Dad - hey, great job

; many thanks to some Guitar Godz: Michael Angelo, Rusty Cooley, Yngwie J.
; Malmsteen, John Petrucci, Shawn Lane, Paul Gilbert, Steve Vai, Joe Satriani,
; Vinnie Moore, Tony MacAlphine, Troy Stetina, Dough Marks, Dave Bates,
; Greg Howe, Chris Impelliteri, Jason Becker, Steve Morse, Frank Gambale, 
; Jimmy Page, Jimmy Hendrix, Eddie Van Halen, Stevie Ray Vaughan, Jake E. Lee, 
; Steve Howe, Randy Rhoads, Kirk Hammet, Eric Johnson, Gary Moore, George 
; Bellas, Jeff Beck, Nuno Bettencourt, Richie Kotzen, ... 

	org 	start

P_STEP1 equ     39
P_STEP2 equ     295
P_STEP3 equ     -117

B_STEP	equ	251

start	spl     1,	<-100		; ###
	spl	1, 	{-200		; #### generate 8 processes
	spl	1, 	<-300		; ###

; ============= BOOT ===============

	mov.i	{copy1, {boot		; boot to 1st location
boot	spl	B_STEP,	{-400		; split there

; ============ PAPER ===============

copy1   spl     @copy3+1,<P_STEP1	; make 1st copy
        mov     }copy1,	>copy1

copy2   spl     @0, 	<P_STEP2	; make 2nd copy
        mov     }copy2, >copy2

	mov.i	<120,	{-346		; decoy maker
	mov.i   {-711,  <201		;    =II=

        mov     {copy2, <copy3		; make 3rd copy
copy3   jmz.a	@0,	P_STEP3		; jump there

        end

