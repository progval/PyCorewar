;redcode-x2
;name Rainbow Demon
;author Lukasz Adamowski
;kill Rainbow Warrior
;strategy paper/gate(with stun bombs)/torpedo -> 
;strategy paper/gate(with dat bombs)/torpedo -> etc.
;strategy Spliting The Shortest with gate and torpedo inside.
;strategy First gate is dropping spl bombs.
;strategy DEADLY
;assert 1

bomb	spl	$0,	$0
	dat	$0,	$0
	dat	$0,	$0
start	mov	#9,	$0
	mov	<-1,	<-3322
	jmn	$-1,	$-2
	spl	$5,	<-18480
	spl	@-3325,	<18480
gate	mov	$bomb,	>bomb
	add	#1663,	$bomb
	jmp	$gate,	>bomb
	mov	$0,	<2
	end	start