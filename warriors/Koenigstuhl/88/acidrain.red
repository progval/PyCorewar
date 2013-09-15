;redcode
;name Acid Rain 1.0
;author James Jesensky
;assert 1
start mov i1, <where1
      mov i2, <where1
      mov i3, <where1
      mov i4, <where1
      mov i5, <where1
      mov i6, <where1
      mov i1, <where2
      mov i2, <where2
      mov i3, <where2
      mov i4, <where2
      mov i5, <where2
      mov i6, <where2
      mov i1, <where3
      mov i2, <where3
      mov i3, <where3
      mov i4, <where3
      mov i5, <where3
      mov i6, <where3
      mov i1, <where4
      mov i2, <where4
      mov i3, <where4
      mov i4, <where4
      mov i5, <where4
      mov i6, <where4
      mov i1, <where5
      mov i2, <where5
      mov i3, <where5
      mov i4, <where5
      mov i5, <where5
      mov i6, <where5
      mov i1, <where6
      mov i2, <where6
      mov i3, <where6
      mov i4, <where6
      mov i5, <where6
      mov i6, <where6
      mov i1, <where7
      mov i2, <where7
      mov i3, <where7
      mov i4, <where7
      mov i5, <where7
      mov i6, <where7
      mov i1, <where8
      mov i2, <where8
      mov i3, <where8
      mov i4, <where8
      mov i5, <where8
      mov i6, <where8
      spl @where1
      spl @where2
      spl @where3
      spl @where4
      spl @where5
      spl @where6
      spl @where7
      spl @where8
      dat #0, #0
where1  dat #500, #500
where2  dat #1501, #1501
where3  dat #2502, #2502
where4  dat #3503, #3503
where5  dat #4504, #4504
where6  dat #5505, #5505
where7  dat #6506, #6506
where8  dat #7507, #7507
i1   mov 0, 1
i2   jmp -1
i3   spl 2
i4   djn -1, -3
i5   mov <-2, <-2
i6   mov #900, -1
