;redcode 
;name Artagel v3
;author Simon Hovell
;strategy: bomber with gate
;assert 1

Artagel:spl 0, <-20     
        mov 3,1-3359            
        add #-3359,-1   
        jmp -2,<-23
        dat <-21,<1     ;1 inserted to slow down djn start,<loc bombers 
	end Artagel	;a bit
