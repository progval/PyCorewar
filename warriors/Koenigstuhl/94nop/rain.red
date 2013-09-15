;redcode
;name Rain
;author W.A-Worth
;assert 1
;41 Wilkies

        org boot

boot	spl clear1
	spl clear2
	spl clear3
	dat 0
clear1  spl 0, }-1
	mov 1, }-1
	dat }-2, }-2
	dat #0,#0
	dat #100, #0
clear2 	spl 0, }-1
	mov 2, }-2
	dat }-3, }-3
	dat #0,#0 
	dat #100, #0
clear3	spl 0, }-1
	mov 3, }-3
	dat }-4, }-4
	dat #0, #0
	dat #100,#0
