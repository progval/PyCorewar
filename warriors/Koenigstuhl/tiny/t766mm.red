;redcode-94x
;name t766--
;author Michal Janeczek
;strategy Tinyshot clone, backward scanning
;assert CORESIZE==800

  add   4    , @5
  mov   7    , @p
p sne   -166 , @-180
  djn.f -3   , <-91
  spl   #-34 , <-34
  mov   @2   , >p
  mov   @1   , >p
  djn.f -2   , {2
  dat   -92  , 7
  spl   #-99 , 8

  end   p-1

