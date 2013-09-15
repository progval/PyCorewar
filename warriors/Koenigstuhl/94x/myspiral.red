;redcode-x2
;name mySpiral
;author Magnus Paulsson
;assert 1
; Started to look at imp numbers for 55440+1, didn't find any!
; Thought a bit about a Vampire (as usual :-).
; Looked at imp numbers again and remembered that n*55440+1 also gives
; imps. Found four different (small), 13, 17, 19 and 23 point rings. 
; Read the rules again and thougt that JKW must have mixed in several
; imp numbers to say (from the rules of Round 3):
; "Heh, I'll be very surprised if anyone gets a score of more than 140"
;
; From there it was simple, oneshot -> spiral-clear using two different
; imp numbers. First try gave 153 pts. Tweaking made it worse.
; Haven't even tried if the two imp numbers are needed or if one will be enough
; but ....    Hey, JKW, next time use p-space to mix the imp numbers up!
; 
; V2, removed "bug", turns out oneshot is meaningless starts with 
; cclear at once, gives about 170 pts.
;
; Keep those whites warriors commin.
;
; pmars -s 55440 -c 500000 -p 10000 -l 200 -d 200 -r 250



org cbmb1

skip	equ	20		; skip

cstep1  equ     34117           ; impstep #1, 13 point ring
cstep2  equ     35873           ; impstep #2, 17 point ring

; Double spiral-clear, a bit tricky to keep it from skipping 
; too many sites.


cptr    dat.f  last+15,last+15
cstep   dat.f   cstep1,cstep2
cbmb2   dat.f   last-cptr+1,last-cptr+1
cbmb1   spl     #last-cptr+1,last-cptr+1
cclear
cbmbp   mov.i   cbmb1,*cptr
        mov.i   *cbmbp,@cptr
	add.f   cstep,cptr
        djn.b   cclear,#0
        jmp     cclear+1,{cbmbp

last    dat.f   0,0 