;redcode-94
;name justice 2
;author bjoern guenzel
;strategy bomber
;strategy v2: test new clear
;assert CORESIZE==8000 

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
jbooptr		spl *jbsource+jshift,jhit+jstep+jshift	
		mov.f 0,jbooptr
jbbooptr	div.f #jbomb+jshift,#0
		dat 0,0	
		

z for (MAXLENGTH-CURLINE)/2
		spl #z*102,#z*101
		stp >0,#1
rof

		end jboot


