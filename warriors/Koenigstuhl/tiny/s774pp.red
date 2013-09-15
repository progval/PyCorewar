;redcode-94x
;name s774++
;author Michal Janeczek
;strategy .66c backward scanning oneshot
;assert CORESIZE==800

  add   3     , @4
p sne   -67   , -73
  djn.f -2    , <75
  spl   #-26  , <-26
  mov   @2    , >p
  mov   @1    , >p
  djn.f -2    , {2
  dat   -199  , 7
  spl   #-114 , 8

  end   p
