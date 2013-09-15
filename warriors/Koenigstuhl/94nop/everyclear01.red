;redcode
;name Everclear v 0.1
;author J.A-Worth
;strategy 2pass clear
;assert 1
org start
	dat #100, #4
start 	spl 0, <-50
	mov @-2, }-2
	dat <-53, <-51 
	spl #100, #5
	dat #0
