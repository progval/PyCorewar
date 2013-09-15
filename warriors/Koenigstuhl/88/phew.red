;redcode
;name Phew
;author Simon Duff
;(sduff@cs.rmit.edu.au)
;strategy CMP scan the core. When it finds something, check to make
;strategy that it isn't me, then SPL 0 bomb that area, until the next
;startegy DAT 0, 0. From here, run a reverse core-clear.
;strategy Forgive this lame attempt - its 3:00 at night and I just finished
;startegy a week of exams - and this is how I decided to take a break!
;url mailto:sduff@cs.rmit.edu.au
;assert CORESIZE==8000

bomb        EQU   start-1       ;this should point to dat 0 , 0
start       ADD   #3039,loc     ;increment location to scan
loc         JMZ   start,-1
            CMP   #-1,@loc      ;scan the location
            SLT   #20,loc       ;dont get me!
            JMP   start         
kill        MOV   split,@loc    ;bomb what is found
            CMP   <loc,bomb     ;if the next location is a dat 0,0
            JMP   kill          ;then bomb more of the core(enemy!)
split       SPL   0
            MOV   1,    <1
            DAT   #42,  #-2
            END   start

