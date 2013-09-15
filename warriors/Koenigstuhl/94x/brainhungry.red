;redcode-x2
;name The Brain Hungry
;author Leonardo H. Liporati
;assert CORESIZE == 55440
;strategy F-scan all core positions mod 2.
;strategy Drop brainwash bombs (STP/DJN) on non-zero positions.
;strategy Start a perpetual foreword DAT coreclear after that.
;strategy
;strategy It looks like that Black Box suicides when brainwashed.
;strategy Any warrior with a brainwash, I tested, scores well against BBox.
;strategy Look below how this program scored on X2 hill.
;
;Program "TBH2" (length 16) by "Leo"
;(contact address "liporati@freemail.com.br"):
;has challenged the Experimental 2 hill.
;
;Program "Black Box v1" (length 195) by "JKW"
;(contact address "sr1899@hotmail.com"):
;TBH2 wins: 247
;Black Box v1 wins: 2
;Ties: 1
;
;Program "TBH2" (length 16) by "Leo"
;(contact address "liporati@freemail.com.br"):
;TBH2 wins: 108
;Ties: 34
;
;Your overall score: 220.000000
;

incr   equ 16238 ; scan mod 2

next   add    #incr       , #last+incr
start  jmz.f  next        , @next
       slt.ab #last-next+1, next
more   djn    next        , #(last-next)/2+1
       jmz.b  clear       , more

attack mov    wash        , >next
       mov    last        , @next
       jmp    next        , <next

ptr    dat    #0          , #last+2
s1     dat    #-20        , #last+2-ptr
clear  mov    @ptr2       , >ptr
       mov    @ptr2       , >ptr
       mov    @ptr2       , >ptr
ptr2   jmp    clear       , s1

wash   stp.ab #CORESIZE/16, #CORESIZE/16
last   djn.f  wash        , wash

       end start

