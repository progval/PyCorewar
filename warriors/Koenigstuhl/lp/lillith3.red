;redcode
;name Lillith III
;author Andy Nevermind
;strategy I've never been able to get a vamp to work right
;strategy before, so maybe this'll work. :) Vamp pit clears
;strategy with anti-imp bomb while the main vamp process does
;strategy an endless mod-4 bombing loop. 
;assert 1

VSTEP equ -3044
SLOC  equ -24 

for 15
        dat #1, #1
rof
for 20
        dat #0, #0
rof

        sub vstep,fang
bite    mov fang,@fang
        jmp -2,<-200    
fang    jmp  pit, -fang 
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
vstep   dat #VSTEP,#-VSTEP
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
ibm     dat <2667,<5334
        dat #0,  #0
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
        dat  #0,  #0
for 16
        dat  #0,  #0
rof
pdat    dat #-20,  #bite-105
pit     mov ibm,   <pdat
        spl  -1,  <bite-199 
        jmp -2 ,  <bite-199 
for 15
        dat #0, #0
rof
for 10
        dat #1, #1
rof

end bite
