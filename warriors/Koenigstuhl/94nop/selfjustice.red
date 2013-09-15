;redcode-94
;name self justice
;author bjoern guenzel
;strategy test nice bombs suggested by beppe bezzi
;strategy torch-like bomber, and only mod 5 :-(
;strategy 10,5 vulnerable instructions...
;assert CORESIZE==8000 

jstep		equ 3315
jshift		equ -1234

jcptr		dat 0,0
		dat 0,0
		dat 0,0
jsplit		spl #0,#0
jptr		mov.i jbomb,*jhit+3*jstep
		mov.i jbomb,@jptr
jhit		add.ab #2*jstep,jptr
		djn.f jptr,<-5000
		mov.i jcb,>jcptr
		djn.f -1,{jcptr
jcb		dat #-1,<jcb-jcptr+20
jbomb		mov.i jstep,1

jbsource	dat 0,0


jboot		mov.i jsplit,@jbooptr		;move spl to jhit+jstep

for 9
		mov.i {jbsource,{jbooptr
rof		
jbooptr		spl jbsource+jshift,jhit+jstep+jshift
		mov.i 0,-1
		dat 0,0
for MAXLENGTH-CURLINE
		dat 0,0
rof

		end jboot

