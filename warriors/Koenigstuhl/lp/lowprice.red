;redcode-lp
;name low price
;author bjoern guenzel
;strategy mod 4 scanner - no time for making up something original :-(
;strategy written for Beppe's Tournament 1996, round 2
;assert MAXPROCESSES==8

steps   equ clear
step    equ (4*23)
bdist   equ (4*500)     

gate    dat <0,>2500
clbmb   dat >2667,>last-gate+3
bmb     jmp #clear-hit,>-1

        dat 0,0         ;scanned
        dat 0,0

loop    sub.f steps, scan
scan    sne.i hit,hit+step
hit     djn.f loop,>gate ;scanned       
        mov.i bmb,@scan
        mov.i bmb,*scan
        jmp *hit,>gate

        dat 0,0         ;scanned

clear   spl #-2*step,>-2*step
        mov.i clbmb,>gate
last    jmp -1,}gate

        dat 0,0         ;scanned
        
        for 12
        dat 0,0
        rof

source  dat last+1,bmb+1

boot z  for 10
        mov.i {source,{bptr
        rof

        for 3
        mov.i <source,<bptr
        rof

bptr    spl last+bdist+1,bmb+bdist+1
        mov.i #0,-1
        dat 0,0         ;scanned

        for 12
        dat 0,0
        rof

z       for (MAXLENGTH-CURLINE)/4

        dat >1,>1
        dat #z,#z
        dat 0,0
        dat #1,#1
        
        rof

        end boot

