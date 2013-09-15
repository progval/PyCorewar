;redcode verbose
;name asian flu 1.2
;author Simon Hovell
;strategy no loop paper/stone
;strategy modified with notepaper start-up
;strategy added emerald-style stoner
;strategy date:24/11/92
;assert 1

flu:	spl emerald,<350
	spl emerald,<2225
	spl emerald,<1450
	spl emerald,<2550
	spl emerald,<3650
	spl start1,<1850
	spl start2,<4650
	spl start3,<3450
	spl start4,<4250
	spl start5,<5050
	spl start6,<5850
	spl start7,<6650
	spl start8,<7450
	spl start9,<1150

start0:	spl 0, #-100
 	mov <current,<dest
dest:	spl @dest,#1850
stream:	cmp #7995,current
current:dat #2
	mov #2,current
	mov <start0,<start0
	dat #1

start1:	spl 0,<-50
 	mov <current1,<dest1
dest1:	spl @dest1,#2110
stream1:cmp #7995,current1
current1:dat #2
	mov #2,current1
	mov <start0,<start0

start2:	spl 0,<-50
 	mov <current2,<dest2
dest2:	spl @dest2,#2400
	cmp #7995,current2
current2:dat #2
	mov #2,current2
	mov <start0,<start0
	dat #3

start3:	spl 0,<-50
 	mov <current3,<dest3
dest3:	spl @dest3,#2700
	cmp #7995,current3
current3:dat #2
	mov #2,current3
	mov <start0,<start0

	dat #4
start4:	spl 0, <-100
 	mov <current4,<dest4
dest4:	spl @dest4,#950
	cmp #7995,current4
current4:dat #2
	mov #2,current4
	mov <start0,<start0
	dat #5

start5:	spl 0,<-50
 	mov <current5,<dest5
dest5:	spl @dest5,#3500
	cmp #7995,current5
current5:dat #2
	mov #2,current5
	mov <start0,<start0

	dat #6
start6:	spl 0,<-50
 	mov <current,<dest6
dest6:	spl @dest6,#1700
	cmp #7995,current6
current6:dat #2
	mov #2,current6
	mov <start0,<start0

	dat #7
start7:	spl 0,<-50
 	mov <current7,<dest7
dest7:	spl @dest7,#2800
	cmp #7995,current7
current7:dat #2
	mov #2,current7
	mov <start0,<start0

	dat #8
start8:	spl 0,<-50
 	mov <current8,<dest8
dest8:	spl @dest8,#3800 -35
	cmp #7995,current8
current8:dat #2
	mov #2,current8
	mov <start0,<start0

	dat #9
start9:	spl 0,<-50
 	mov <current9,<dest9
dest9:	spl @dest9,#2350
	cmp #7995,current9
current9:dat #2
	mov #2,current9
	mov <start0,<start0

inc:      dat #-207,#207
emerald:  spl 0,<-50
stone:    mov <cnt+102-300,<cnt+100
         add inc,stone
cnt:      djn stone,<-3799

	end flu
