;redcode-imt2
;name Target Practice
;strat So named because that is what I expect 
;strat it to be in the coming tournament.
;strat But it is the best I could find so here it is.
;strat Basic D-clear with djn.f trap.
;author Brian Haskin
;assert 1

	spl #1, 1
	mov 2, >-4
	djn.f -1, >-5
	dat	1, 7
end

