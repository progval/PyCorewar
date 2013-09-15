;redcode-94m
;name Tiberius NQ
;author Franz
;strategy silk+coreclear
;strategy CC Paper is back with vengeance
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000 || CORESIZE==55440

FOR CORESIZE==55440
fcp EQU (3030*3)
scp EQU (2365*2)
tcp EQU (777)
ROF
FOR CORESIZE==8000
fcp EQU 3030
scp EQU 2365
tcp EQU 777
ROF

        org boot

boot
        spl 1,>-3000  ;letz get 9 processes together
        mov.i -1,#0
        mov.i -1,#0
        mov.i -1,#0

frog    spl     @0,     <fcp
frogc   mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     >6000,      <frogc
        mov     >2000,      <frogc
        jmp     -2,     >-10
datz    end
