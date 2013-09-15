;redcode
;name Leech
;author William Shubert
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
;Label description:
;  bdist is the distance in memory that will separate each bite.
;  bite1 is how far away to drop the first bite.
;  dstart is the starting address for draining.  Since the drain uses a
;    predecrement addressing mode, dstart will NOT be wiped out.  The first
;    address before it will be wiped out.
;  bmove, when added to the bite, produces a new bite with both the new address
;    to place the bit and the new JMP address for the bite itself.
;  leech is the start address.  Notive I do a MOV then an ADD unlike the Dwarf;
;    this may just give me an extra instruction sometimes.
;  bite is both the "jump to drain" instruction and the destination address for
;    this instruction.
;  drain is the start of the function where a fighter will kill itself.  If
;    some part of this routine is corrupted, hopefully the program forced to
;    jump here will kill itself even if it can't kill all it's brethren.
;  clrloc is both the SPL (which is necessary to ensure that the drain process
;    will move faster than the other enemy processes) and the target for
;    draining.
;OK, enough of these comments.  Start the leech code.

bdist	equ	(33*4)		;In an 8000 word core, this will hit every 4th
				;  word eventually; in the meantime it will
				;  get a good scatter.
bite1	equ	(bite-128)	;Drop the first bite somewhere useful.

dstart				;Start "draining" here.
bmove	dat	#bdist,#-bdist
	dat	#0		;A bite will land here eventually, so I can't
				;  use this location.
leech	mov	bite,@bite
	add	bmove,bite
	jmp	leech
bite	jmp	drain-bite1,bite1	;A bite will land here, but it will
				;  cause no change since it will write itself.
drain	mov	bmove,<clrloc
clrloc	spl	drain,dstart	;Use this loc for the split and the draining
				;  address.  Saves an instruction; makes me a
				;  smaller target.
	jmp	drain
	
	end	leech

