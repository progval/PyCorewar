;redcode verbose
;Name Leech 1.3
;Author William Shubert
;(wms@iwarp.intel.com)
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
;strategy Throw around "jmp" instructions.  When the enemy executes one of
;strategy   these instructions, they jump to a piece of code that forces them
;strategy   to fork off tons more processes and clear the core.  The last bit
;strategy   of core a captured process clears will be itself, dying and giving
;strategy   the Leech the win.
;strategy 1.2 mod: Move the trap routine far away from my code to make it
;strategy   harder for leech-killers to find me.
;strategy 1.3 mods: Much intensified.  Now does XTC-style searches for greater
;strategy   speed; will hit EVERY OTHER instruction, not every fourth; and
;strategy   for a stunning finale it bombs itself and becomes a kobold.  What
;strategy   more could you ask for?
;strategy For a full listing, just send a letter to wms@iwarp.intel.com

bdist1  equ     (thit-leech)    ;Space this amount.  Should be prime*2 for
                                ;  best results.  I figure 82 should be about
                                ;  as good as you can get.
bdist2  equ     (33*4)          ;In an 8000 word core, this will hit every 4th
                                ;  word eventually; in the meantime it will
                                ;  get a good scatter.

bloc1   equ     (thit+bdist1)   ;Drop the first bite somewhere useful.

bloc2   equ     (hitme2-168)    ;After a capture restart here.

dstart                          ;Start "draining" here.
lloop   add     bmove,bite
leech   jmz     lloop,@bite
        mov     bite,@bite
hitme2  jmp     lloop           ;This must stay a zero or it will be bombed.
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
bmove   dat     #-bdist1,#bdist1
        dat     #0
        dat     #0
        dat     #0
bmove2  dat     #-bdist2,#bdist2
        dat     #0
        dat     #0
        dat     #0
bite    jmp     trap-bloc1,bloc1
        dat     #0
        dat     #0
        dat     #0
bite2   jmp     (drain-bloc2)-bite,bloc2-bite
        dat     #0
        dat     #0
        dat     #0
zero    dat     #0
        dat     #0
        dat     #0
        dat     #0
clrloc  dat     #dstart
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0

drain   mov     zero,<clrloc
        spl     -1
        jmp     drain
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
trap    mov     bmove2,bmove
thit    mov     bite2,bite      ;This space COULD get hit.
        jmp     drain

        end     leech
