;redcode-94x
;author David Houston
;name Tiny clear
;assert 1 

	org start 

start:  spl #-1, -5 
mov *ptr, <ptr 
       djn.f -1, <start-5 
bomb:   dat -4, -5 
ptr:    dat -4, start - 26 

