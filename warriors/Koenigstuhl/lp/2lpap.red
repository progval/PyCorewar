;redcode
;name 2LPap
;author Leonardo H. Liporati
;assert MAXPROCESSES==8

pap1  mov #12, 0
cpy1  mov <pap1, <ptr1
      mov <pap1, <ptr1
      mov <pap1, <ptr1
      jmn cpy1, @pap1
      spl @pap1, <2376
ptr1  jmz @0, 3039
      dat <2667, <5334
      dat <2667, <5334
      dat <2667, <5334
      dat <2667, <5334
      dat <2667, <5334

for 55
      dat #0,#0
rof

start spl pap1

pap2  mov #12, 0
cpy2  mov <pap2, <ptr2
      mov <pap2, <ptr2
      mov <pap2, <ptr2
      jmn cpy2, @pap2
      spl @pap2, <2730
ptr2  jmz @0, 2151
      dat <-1, <1
      dat <-1, <1
      dat <-1, <1
      dat <-1, <1
      dat <-1, <1

for 20
      dat #0,#0
rof

end start



