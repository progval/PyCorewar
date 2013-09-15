;redcode-94nop
;name thylacine
;author Simon Wainwright
;strategy stone & imps
;assert CORESIZE==8000

        impboot      equ  stoneboot+3965
        impstep      equ            2667

pGo     mov          imp,        *impjmp
        spl            1                
        spl            1                
        mov     <stonjmp,       {stonjmp
        spl            1                
        spl            1                
        spl            1                
        spl       impadd                
impjmp  jmp      impboot,         }-2000

imp     mov.i   #impstep,             *0

impadd  add.f   #impstep,         impjmp
stonjmp jmp    stoneboot,      stonend+1

        stoneboot    equ        pGo+1000
        stonestep    equ            6215 

stone   spl   #stonestep,    <-stonestep
loop    mov   >stonestep,    1-stonestep
        add        stone,           loop
stonend djn.f       loop,         <-3000
        end
