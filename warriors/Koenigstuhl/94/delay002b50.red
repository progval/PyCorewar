;redcode-94
;name delay 0.02b 50
;author bjoern guenzel
;assert 1
;strategy test delayed imp

step	equ (4*19)
gate	equ (steps-step)
delay	equ (50)
istep	equ 2667
dist1	equ (-1000)
dist2	equ (2000)


igate	dat 0,imp+3
	dat 0,0
ilaunch djn.b #0,#delay		;that's all...
	spl #0,<igate
	add.a #istep+1,igo
igo	jmp imp-(istep+1),<igate
	dat 0,0
imp	mov.i #istep,*0
	mov.i #istep,*0
	mov.i #istep,*0

jstep		equ 3364
jshift		equ -1234

jcptr		dat >jstart,#jbomb+2
jcb		dat <-2668,#jbomb+2-jcptr
		dat 0,0	
jstart		spl #0,>jcptr-2
jptr		mov.i jbomb,*(jhit+3*jstep)	
		mov.i jbomb,@jptr		;this bomb hits
jhit		add.ab #2*jstep,jptr
		jmz.b jptr,#0
		mov.i jcb,>jcptr
		djn.f -1,>jcptr
jbsource	dat 0,0
jsplit		spl #0,<0
for 3
		stp.ab >0,#0
rof
jbomb		mov.i jstep,1

jboot		mov.i jsplit,@jbooptr		;move spl to jhit+jstep
		mov.i jbomb,*jbbooptr
for 10
		mov.i {jbsource,{jbooptr
rof

for 8
		mov.i <igate,<jbbooptr
rof
		spl @jbbooptr,0
jbooptr		spl *jbsource+jshift,jhit+jstep+jshift	
		mov.f 0,jbooptr
jbbooptr	div.f #jbomb+jshift,#ilaunch+dist2
		dat 0,0	
		

z	for MAXLENGTH-CURLINE
	spl #z,-z
	rof

	end jboot

