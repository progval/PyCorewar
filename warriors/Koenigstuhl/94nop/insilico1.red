;redcode-x
;name in_silico 1
;author Ray Hann
;strategy GA derived redcode
;assert 1

      MOV      <-1,      @-2
      MOV       -1,      #-1
      ADD      #2,       -2
      MOV       -1,       -1
      MOV      @3,      <-4
      SPL      <-3,       2
      SPL      <-3,      @1
      MOV      @1,      #3
      DJN      <1,      @-2
      MOV      #-3,      <-3
      SUB       -1,      @-4
      SUB      <1,      <3
      SPL      <0,      <-1
      JMZ      #-2,      <-2
      DJN      <3,       -4
      JMN      <2,       2
      MOV      #-3,      <3
      ADD       -3,      #-2
      SPL      @-3,      <-4
      SUB      <2,      <1
      DJN      <-1,      <-4
      MOV      <-1,      @3
      JMP      #-3,      #-3
      JMP      #-4,      @-3
      SPL      <-3,       -3
      MOV      #-2,      <-4
      ADD      @-2,      <2
      MOV      @-1,      <1
      JMN      @-1,      #-4
      SPL      @3,      #1
      MOV      #3,      #-4
      SPL      @-4,      <1
      MOV      @2,      #0
      MOV      <-4,      @0
      JMP      #-2,      @-2
      JMN      <0,      <0
      SPL       2,      #-2
      SUB      @2,      #-3
      MOV      #-1,      <-4
      MOV      <-2,      <-3
      SPL      #1,      #3
      MOV      #1,       -1
      SPL       1,      <1
      JMP      #-1,      @1
      JMZ      @-1,      @2
      JMP      <-4,      <-2
      MOV       -4,      <-1
      MOV      #1,       -1
      SPL       0,      #0
      SPL      <-2,      #2
      END

