;redcode-94x
;name Squirm13
;author Philip Thorne
;strategy tworm6, different engine.
;strategy i.e. silk-worm with chaotic core-copy
;strategy John Metcalf 2002 Tournament Round 1, Warrior 2
;assert CORESIZE==800

STEP    EQU 351

bomb    dat <1,         <-1
start   spl 1
        spl 1

                spl  sqm

                mov      bomb,  <-150
                mov      bomb,  <-153
                mov      bomb,  <-156
                mov      bomb,  <150
                mov      bomb,  <155    ; +ve overlap was worse. test set?

    for 7
                dat 0, 0
        rof

sqm     spl STEP,   0
        mov >sqm,   }sqm
                ;mov bomb,   <-30
                ;mov 7,         <-30    ; better than bomb. random bomb?
                djn -1,         <40             ; 40 sensitive to test set. c-copy
                djn -1,         {-50

end start

