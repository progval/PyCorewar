;redcode-94
;name SUB/JMN Prototype
;author Franz
;strategy A new type of scan, cca .5c sub/sub/jmn single shot
;strategy which is self-splitting. Bad thing about this routine
;strategy is it's a b (or a) scanner only. though it's fairly small
;strategy this is the first prototype of this scan/bomb routine 
;strategy this will probably fail too :)
;assert 1

stsc	equ 3
sstep	equ 3510

	org wh 

ptr	spl #1,#ch+300
bomb	spl #2,#ch+100
bomb2	dat #0,#ch+50

for 32
	dat 0,0
rof

wh	spl #stsc,#stsc+5
	mov.i *ptr,>ptr
	jmz.a -1,@ch

loop	add.f @ch, wh
	sub.b @wh, ch
	sub.b *wh, ch
ch	jmn.a loop, step
	mov.ab wh, ptr

for 51 
	dat 0,0
rof

step	dat #sstep,#sstep

datz	end

