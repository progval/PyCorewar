;redcode-94x
;name rock
;author James Layland
;assert CORESIZE==55440
;macro

; stone with endgame like Dan Nabutovsky's (sp) Moonstone, but gateless
;   (a gate with a bomber can pick up ties on the hill, but that won't
;   really help here...

; I'm not real happy with my current choice of stepsize and bombing
;   locations-- I decrement and bomb the same spots.
; I tried mod-3 and mod-1 steps, and didn't find anything that fit well
;   with my code.

; I don't feel good about this round.  I won't beat anything with imps,
;   but I hope I've scared them off.
; I know that Jay has developed an ivscan6-killer (which he
;   cleverly removed from the big hill before I could get a clue.
; My guess is he has some kind of anti-replicator weapon (vamp or SPL-JMP
;   bomber) which fakes me into running the anti-vamp paper (and if it's
;   a vamp, it's immune to my brand of anti-vamp)
;
; My problem is that Jay's ivscan6 killer also kills all the other
;   programs I had on the big hill (impscanner, stone/imp, stone, paper),
;   which is basically all I have.
;   I'm not quite sure what could do all of that-- any kind of split
;   bombs would beat paper/ivscan, and my stone isn't very optimized.
;   Perhaps a quickscan (to catch the imp) followed by a spl bomber??
;   Whatever it is, I'm hoping he submits something slow and complicated
;   that a simple stone can take out.  (I did try adding imps to this,
;   but it didn't seem to be worthwhile.  Maybe the big decoy can slow
;   up a quickscanner if he has one.

step equ -92

org start

start equ incr

move      mov 4, <step+3

        dat 0,0
here    dat 0,0         ; bomb this, then dec this will point to move

incr      SPL #-step,<step
stone     MOV <-2-step,2+step
          ADD incr,stone
          DJN.f  stone,<-65     ; put mov here & dec this too
          djn.f -1, 780
src     dat 0,0


boot    mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
dst     spl     @0, 11331
        sub  #3,dst
        mov move, dst
        mov 1, dst

decoy
for 182
        mov #dst, 34117
rof
