;redcode-lp
;name Recycled paper
;author Beppe Bezzi
;assert CORESIZE==8000
;strategy 2 processes replicator
;strategy for round 2 of Corewar Maniacs Tournament

for 0
Replicators aren't bad in lp hill. Obviously we cannot use silk, but an
economic 'old style' paper can work.
Recycled easily kill clears and bombers, and i think i'll meet many of them :-)
rof

org boot

boot   spl       1,   0

paper   mov     #10,    #0
ptr     add     #3792,  #-1555
        mov     <paper, <ptr
        mov     <paper, <ptr
        mov     <paper, <ptr
        mov     <paper, <ptr
        mov     <paper, <ptr
        spl     @ptr,   <-10
        jmz     @0,     paper
for 80 
        dat     0,0
rof


;Let's give q^2 something to bite :-)
for MAXLENGTH-CURLINE
        dat     1,1
rof

end

