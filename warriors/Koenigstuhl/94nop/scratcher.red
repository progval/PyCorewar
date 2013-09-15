;redcode-94
;assert CORESIZE==8000 && MAXPROCESSES==8000 && MAXCYCLES==80000
;assert MAXLENGTH==100 && MINDISTANCE==100
;name scratchers
;author nandor sieben
;macro
lab     for 20
        mov scratch , scratch+lab*8000/20
        rof
lab     for 20
        spl  scratch+lab*8000/20
        rof
scratch djn.A   #0 , <-10

