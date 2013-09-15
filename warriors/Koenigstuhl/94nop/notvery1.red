;redcode-94b
;name Not Very Pretty 1.0
;author Ross Morgan-Linial
;assert CORESIZE==8000
;strategy FAST bomber -> two-pass coreclear -> imp gate
;version 1.0

org start

   start loop1
;first, a 50% of C bombing loop
add.i addto, indic
mov bomb, @indic
mov bomb, *indic	
djn loop1, #799
; now, a two-pass coreclear
spl 0, <-30    ;don't bomb here
mov *ptr, <ptr 
jmp -1, <-32
dat $0, $0
dat $0, $0
dat $0, $0     ;bomb here
   addto
dat #4730, #4730
   indic
dat #start+3999, #start+4
   bomb
dat <2666, <2667
   bomb2
spl #0, #0
dat $0, $0 ;bomb here
spl #-1, #start-3
dat <-31, #-11
   ptr
dat #-2, #start-1  ;this line will be overwritten by the clear

end

