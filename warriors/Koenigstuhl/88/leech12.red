;redcode
;Name Leech 1.2
;Author William Shubert
;assert 1
;A modification of the Vampire (written by Robert Martin).
;  Basically, like a vampire but much smaller.  Faster and more vicious, too.
;Algorithm: Drop bites in memory, spreading them well.  By arranging code
;    correctly, I use 3 out of every 4 words.  This enables me to drop the
;    bites in every fourth word.  However, dropping them in every 33rd 4-word
;    space gives a fairly good spread through memory.
;  Each bite is a jump to the "drain" part of code.  To be real nasty, I make
;    the competitor kill itself.  The drain runs through code, dropping a DAT
;    instruction in each place and splitting constantly.  Eventually the
;    drainer will overwrite itself.  It is important that it FIRST kills the
;    "SPL" instruction then the "MOV"; if the MOV died first the splitter would
;    live on forever and cause a tie.
;Notice that by using "bmove" to both add to the jump address of a bite and
;  subtract from the location where the bite lands I make the leech as fast
;  and as small as a Dwarf.  Also, instead of adding an extra "DAT" statement
;  for the location where the draining clear is being used I use the B location
;  of the SPL instruciton.  This saves an instruction and makes me a smaller
;  target for other figters.
;I believe that this is the smallest, fastest, and nastiest single-process
;  vampire possible.  It can be improved by producing multiple leeches.  Good
;  idea for a future project.  However, this will improve the win ratio
;  against Dwarves, etc. while decreasing the win ratio against other
;  vampire-style programs.
;strategy Throw around "jmp" instructions.  When the enemy executes one of
;strategy   these instructions, they jump to a piece of code that forces them
;strategy   to fork of tons more processes and clear the core.  The last bit
;strategy   of core a captured process clears will be itself, dying and giving
;strategy   the Leech the win.
;strategy 1.2 mod: Move the trap routine far away from my code to make it
;strategy   harder for leech-killer to find me.
;strategy For a full listing, just send a letter to wms@iwarp.intel.com

bdist	equ	(33*4)		;In an 8000 word core, this will hit every 4th
				;  word eventually; in the meantime it will
				;  get a good scatter.
bite1	equ	(bite-168)	;Drop the first bite somewhere useful.

dstart				;Start "draining" here.
leech	mov	bite,@bite
	add	bmove,bite
	jmp	leech
	
	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
	dat	#0

	dat	#0
	dat	#0
	dat	#0
bmove	dat	#bdist,#-bdist

bite	jmp	drain-bite1,bite1	;A bite will land here, but it will
				;  cause no change since it will write itself.
drain	mov	bmove,<clrloc
clrloc	spl	drain,dstart
	jmp	drain

	end	leech
