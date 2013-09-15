;redcode-lp
;name Gelatinous Blob
;author Michal Janeczek
;strategy KOFACOTO Round 2 entry
;strategy   - modified paper from Tempest
;strategy   - 4 process imp spiral (?)
;strategy   - 2 line core clear
;assert 1

clear mov 2        , <-130
      jmp clear    , <clear-130

      for 13
      dat <clear*3 , <1
      rof

      add #7       , 7
      mov 5        , <3
paper mov <-2      , <3
      jmn -2       , @-3
      spl @-4      , <2159
      jmz @0       , 3039
      dat <5334    , <2667

start spl paper    , <2000
      spl clear    , <2500
      spl 4        , <3000
      spl 2        , <3500
      jmp imp      , <4000
      jmp imp+2667 , <4500
      spl 2        , <5000
      jmp imp+5334 , <5500
      jmp imp+8001 , <6000

imp   mov 0        , 2667

      end start
