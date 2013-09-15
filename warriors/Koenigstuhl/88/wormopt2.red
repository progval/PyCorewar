;redcode
;name worm optima 2
;author Campbell Fraser
;strategy Simple linear 'dat' attack with low profile.
;assert 1

SHIFT	equ 6000

	mov ONE,ONE+SHIFT
	mov TWO,TWO+SHIFT
	mov B,B+SHIFT
	mov P,P+SHIFT
	jmp ONE+SHIFT
ONE   	mov B, <P
TWO   	jmp -1,<P
    	dat #1
    	dat #2
B:  	dat #-9
    	dat #3
    	dat #4
    	dat #5
    	dat #6
P:  	dat #-31
	dat #7
	dat #8
        dat #9
        dat #10
        dat #11
        dat #12
        dat #13
        dat #14
        dat #15
        dat #16
        dat #17
        dat #18
        dat #19
        dat #20
        dat #21
        dat #22
        dat #23
        dat #24
        dat #25
        dat #26
        dat #27
        dat #28
        dat #29
        dat #30
        dat #31
        dat #32
        dat #33
        dat #34
        dat #35
        dat #36
        dat #37
        dat #38
        dat #39
        dat #40
        dat #41
        dat #42
        dat #43
        dat #44
        dat #45
        dat #46
        dat #47
        dat #48
        dat #49
        dat #50
        dat #51
        dat #52
        dat #53
        dat #54
        dat #55
        dat #56
        dat #57
        dat #58
        dat #59
        dat #60
        dat #61
        dat #62
        dat #63
        dat #64
        dat #65
        dat #66
        dat #67
        dat #68
        dat #69
        dat #70
        dat #71
        dat #72
        dat #73
        dat #74
        dat #75
        dat #76
        dat #77
        dat #78
        dat #79
        dat #80
        dat #81
        dat #82
        dat #83
        dat #84
        dat #85
        dat #86
        dat #87
        dat #88
        dat #89
        dat #90
        dat #91
