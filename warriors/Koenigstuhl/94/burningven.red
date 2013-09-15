;redcode
;name Burning Vengeance
;author Michal Janeczek
;strategy p^3 -> HSA / dclear dodger
;assert 1

      org    start

; --- scanner

ePtr  dat    -1     , MINDISTANCE+11

      dat    0      , 0
      dat    0      , 0
      dat    0      , 0
      dat    0      , 0
      dat    0      , 0

eWipe mov    eSpl   , <ePtr
      mov    >ePtr  , >ePtr
      jmn.f  eWipe  , >ePtr
eInc  sub.f  #-11   , ePtr    ; 11 / 9
      sne    *ePtr  , >ePtr
      sub.x  #-10   , ePtr    ; 11 / 10 - 1
      sne    *ePtr  , <ePtr
      jmz.f  eInc   , <ePtr
      sne    eSpl+1 , >ePtr
      mov.x  ePtr   , ePtr
      slt    ePtr   , #eSpl+5-ePtr
      jmp    eWipe  , <ePtr
      djn    eInc   , #15
      jmp    eInc   , }eWipe
eSpl  spl    #1     , {1

      for    54
      dat    0      , 0
      rof

; --- dodger

dodge jmz.f  #1     , }cptr
      nop    }cptr  , }cptr
      mov    <cptr  , {cptr
      djn    -1     , #4
cptr  djn    100    , cdat+1

      spl    #0     , {-7
      mov    2      , >-8
      djn.f  -1     , >-9
cdat  dat    1      , 12

; --- scanner setup

scan  div.a  #2     , @1
      sub.ba #1     , ePtr
      jmp    eInc+1 , 1

; --- switcher

pkey  equ    16

start ldp.a  #0     , res
      ldp.a  #pkey  , tab
      mod.ba *res   , tab
      stp.b  *tab   , #pkey  ; S L W T
tab   jmp    }0     , 204    ; 0 4 1 0
      spl    #scan  , 205    ; 1 0 2 1
      spl    #scan  , 206    ; 2 1 3 2
      spl    #scan  , 87     ; 3 2 3 3
      spl    #dodge , 40     ; 4 0 5 4
      jmp    #dodge , 89     ; 5 4 5 5

res   spl    #1     , 5
      spl    #1     , 7
      jmp    #1     , 6

