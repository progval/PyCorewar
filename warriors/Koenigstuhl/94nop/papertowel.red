;redcode-94 verbose
;name Paper Towel v0.4
;author David Boeren
;strategy Another paper test
;assert CORESIZE == 8000

pdest1  equ   3740
pdest2  equ  -1278                   ;pmars optimized
ptarg   equ    933                   ;pmars optimized

tdest1  equ   3488
tdest2  equ   1860
tdest3  equ   3740

        org start
start   SPL.B     towel,       #0

paper   SPL.B         1,       #0    ;\.
        MOV.I        -1,       #0    ;-> generate 6 processes
        SPL.B         1,       #0    ;/.

silk1   SPL.B        @0,  <pdest1
        MOV.I       }-1,      >-1
        MOV.I     pbomb,   }ptarg
        MOV.I    {silk1,   <silk2
silk2   JMP.B        @0,  >pdest2
pbomb   DAT.F     <2667,    <1143

for 50
        DAT.F        #0,       #0
rof


towel   SPL.B         1,       #0    ;\.
        MOV.I        -1,       #0    ;-\ generate 10 processes
        MOV.I        -1,       #0    ;-/.
        SPL.B         1,       #0    ;/.

silka   SPL.B        @0,  }tdest1
        MOV.I       }-1,      >-1
        MOV.I     tbomb,     {123
silkb   SPL.B        @0,  }tdest2
        MOV.I       }-1,      >-1
        MOV.I     tbomb,    >1001
        MOV.I     tbomb,    }2042
        MOV.I    {silkb,   <silkc
silkc   JMP.B        @0,  >tdest3
tbomb   DAT.F     >2667,    >5334
        end


