;redcode-94
;author Maurizio Vittuari
;name Phq
;assert CORESIZE==8000
;strategy New version! This one likes brainwashes...

step1   equ     3743    ; unoptimized replicator costants
step2   equ     1567    ; see CoreWarrior issue 3
step3   equ     1349


;       ****** QSCAN ROUTINES ******

start
s1 for 4
        sne start+400*s1,start+400*s1+100
        seq start+400*s1+200,start+400*s1+300
        mov #start+400*s1-found,found
rof
        jmn which,found
s2 for 4
        sne start+400*(4+s2),start+400*(4+s2)+100
        seq start+400*(4+s2)+200,start+400*(4+s2)+300
        mov #start+400*(4+s2)-found,found
rof
        jmn which,found
s3 for 4
        sne start+400*(s3+8),start+400*(s3+8)+100
        seq start+400*(s3+8)+200,start+400*(s3+8)+300
        mov #start+400*(s3+8)-found,found
rof
        jmn which,found
s4 for 4
        sne start+400*(s4+12),start+400*(s4+12)+100
        seq start+400*(s4+12)+200,start+400*(s4+12)+300
        mov #start+400*(s4+12)-found,found
rof

; just missed a line... :(

s5 for 3
        sne start+400*(s5+16),start+400*(s5+16)+100
        seq start+400*(s5+16)+200,start+400*(s5+16)+300
        mov #start+400*(s5+16)-found-100,found
rof

found   jmz rabbit,#0
        add #100,-1
which   jmz -1,@found
        add #10,found
for 4                           ; bombing enemy
        mov m3,<found
        mov m2,<found
        mov mp,<found
        mov m1,<found
rof
        spl @found,{100         ; So... why not ?

;       ****** REPLICATOR ******

rabbit  spl     1,      <200    ;create 11 processes
        mov     -1,     0
        spl     1,      <300
        mov     -1,     0
s1      spl     step1,  #0
        mov.i   >-1,    }-1
        mov.i   bomb,   }1942
s2      spl     step2,  #0
        mov.i   >-1,    }-1
        mov.i   bomb,   }1842   ;I've changed > with } so many times
        mov.i   bomb,   >1900   ;that I can't remember if this version
        mov.i   bomb,   }2000   ;is the one actually on the hill...
        mov.i   <s2,    <s3
s3      jmp     @0,     }step3
bomb    dat     <2667,  <5334   ;anti-imp bomb

;       ****** BRAINWASHING CORE-CLEAR ******

m1      mov     m3,     {m3
mp      stp     <0,     #20     ; brainwashing instruction
m2      djn.f   m1,     }m3+1   
m3      dat     }bomb,  <2667
end start 
