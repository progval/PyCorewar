;redcode
;name dirty clear
;author bjoern guenzel
;assert 1

gate    dat #0,bptr+1

for 5
        dat 0,0
rof

jptr    spl #1,>gate
        mov *bptr,>gate
        djn.f *jptr,>gate
        dat }gate,>gate
protect mov #1,1          ;I was too lazy to think of something effective... 
                          ;I hope you enjoy... :-)
        dat #protect-jptr,bptr+1-gate
bptr    dat #0,bptr-gate  ;bomb never hits this

        end     jptr
