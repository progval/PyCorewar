;redcode verbose
;name SNAKE
;author WAYNE SHEPPARD
;strategy PITBOMBER
;strategy now with decrement protection
;strategy and extra redundancy
;assert 1
	 spl start		       ;hit here

start2	 spl 0,pitbomb2    ;One of these three statments
	 mov @0,@pitbomb2  ;can be decremented and the
	 sub offset2,@-1   ;bombing goes on
	 jmp -2
	 dat #0,#0		       ;hit here

	 dat #0,#0
pbdup2	 jmp pit-3,3 ;duplicate pitbomb
pitbomb2 jmp pit-2,2
offset2  dat #-115,#115 ;If this is decremented, we are out of action
	 dat #0,#0		       ;hit here

start	 spl 0,pitbomb	   ;making myself larger for scanners
	 mov @0,@pitbomb   ;but helps against bombers
	 sub offset,@-1
	 jmp -2
	 dat #0,#0		       ;hit here

offset	 dat #115,#-115
	 dat #0,#start2 ;duplicate bomb
bomb	 dat #0,#start2
	 dat #0,#0
	 dat #0,#0		       ;hit here

pbdup	 jmp pit+11,-11 ;duplicate pitbomb
pitbomb  jmp pit+12,-12
pit	 mov @0,<bomb	;Even pit is protected decrement
	 spl -1  ;NOT spl 0
	 jmp pit		       ;hit here
