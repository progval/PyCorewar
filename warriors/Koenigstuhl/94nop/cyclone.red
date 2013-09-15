;redcode-94
;name Cyclone
;author Scott Manley
;strategy Huge Spiral, + Quick stone at launch.
;strategy Wilkinson Benchmark score 88.5
;strategy Percentage record 17/45/38
;assert CORESIZE==8000

step equ 127
targ   DAT -1,-21
inc    DAT 20,-20
stone  MOV targ,*targ
       MOV targ,@targ
       ADD.F inc,targ
       DJN stone, #199
imp    MOV 0,step
launch SPL 1 , > targ-110
       SPL 1 , > targ-130     
       SPL 1 , > targ-150    
       SPL 1 , > targ-170    
       SPL 1 , > targ-190    
       MOV -1,0  
       SPL 1 , > targ-210    
       SPL 2 , > targ-230
    
spread JMP @spread,imp
       ADD #step,spread
end stone

