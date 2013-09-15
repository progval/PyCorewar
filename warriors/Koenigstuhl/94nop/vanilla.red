;redcode-94
;name Vanilla 1.1
;author Robert Macrae
;strategy  6-word Paper with fast launcher. 
;assert CORESIZE == 8000

        spl     1
        mov     -1,       0
        spl     1                       ; Get 6 processes

launch  spl     2340,     0             ; Launch multiple copies
        mov     >launch,  }launch
        mov     bomb,     {600          ; Throw in a bomb for luck
        mov     >launch,  }launch       ; Complete launch 

paper   spl     1910,     0             ; Start of paper proper
        mov     >paper,   }paper
        mov     bomb,     {bomb         ; (Forget why) 
        mov.f   <paper,   {800          ; Lazy bomb + redecrement paper
        jmz     @paper+1, @paper+1      ; Repeat if paper && paper+1 OK

bomb    dat     >paper,   <2667
        dat     >0,       <2667         ; Ballast, so I don't waste time
        dat     >0,       <2667         ; launching colourless space.
