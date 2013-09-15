;redcode-94b quiet
;name Assassin XII
;author Andy Nevermind
;strategy CMP scanner, Coreclear+DJN
;assert 1
org     scan
magic   dat.f   #65,    #65
scan    cmp     98,   123
        jmp     find
        add.f     magic,    scan
        jmp     scan
find    sub     #55,    scan
bonk    mov.i   clear,   >scan
        djn     bonk,   #100
clear   spl.b   #0,  <-1        
        mov     2,      <-11    
stream  djn.f   -1,     >1      
        dat.f   <-21,    #10    

        end

