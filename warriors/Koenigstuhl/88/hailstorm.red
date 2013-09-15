;redcode
;name	Hail Storm
;author Robert Hale
;assert CORESIZE == 8000

;strategy Stone Paper
;strategy 
;strategy It kills most 88 programs I could find:
;strategy Imps a generally ties with a little edge 
;strategy to hail storm, stone/imps it does slightly better against
;strategy stones and vamps get crushed but scanners crush me.
;strategy as expected :(
;strategy 
;strategy I get only 15% - 20% wins verses blurr'88.
;strategy I do better against most other scanners.
;strategy 
;strategy Two questions for the group
;strategy 1) how to protect against the scanner?
;strategy    I sent more cycles to the stone sooner and that helped
;strategy    a little but just a little.
;strategy 2) I posted a question to the newsgroup about 88 benchmark
;strategy    warriors but nobody answered.  Did the question make it 
;strategy    to the newgroup?

inc      dat #0-spacing,#spacing
warrior
        spl     1         
        spl     1

spacing  equ 2365

;emerald by paul kilne
                spl     paper
emerald         spl 0
stone           mov <cnt-spacing-2,cnt+spacing
                add inc,stone
cnt             djn stone,<inc-129

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0
	dat	#0, #0

;31 inst
      			;Replicator from FlashPaper
                        ;   by Matt Hastings

paper           spl     paper2
		spl	paper3

          	mov 	#8,	8
paper1    	mov 	<-1,	<2
          	mov 	<-2,	<1
          	spl 	@0,	-3031
          	mov 	<-1,	<1020
          	jmz 	-5,	-5
          	mov 	0,	-1
          	dat 	#0,	#1
          	dat 	#0,	#1

          	mov 	#8,	8
paper2   	mov 	<-1,	<2
          	mov 	<-2,	<1
          	spl 	@0,	-2365
          	mov 	<-1,	<1020
          	jmz 	-5,	-5
          	mov 	0,	-1
          	dat 	#0,	#1
          	dat 	#0,	#1

          	mov 	#8,	8
paper3   	mov 	<-1,	<2
          	mov 	<-2,	<1
          	spl 	@0,	-777
          	mov 	<-1,	<1020
          	jmz 	-5,	-5
          	mov 	0,	-1
          	dat 	#0,	#1
          	dat 	#0,	#1

		end	warrior
