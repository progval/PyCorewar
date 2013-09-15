;redcode-94
;name       The Core Clear
;author     David van Dam
;date       21 april 1996
;strategy   Spl/Dat/... & Spl/Spl/Dat/... Core Clear
;strategy
;strategy   Crushes mod 4/5 Dat bombers
;strategy   Scores 145.0 Wilkies (2000 fights)
;assert     CORESIZE==8000

            org     start

gate1       dat     bomb1   ,   500     ; 1: 1/1	
gate2       dat     -4040   ,   4045    ; 2: 2/2

        for 17
            dat     0       ,   0
        rof

start       
bomb1       spl     #bomb2-gate1 , 45   ;20: 5/4

            mov     *gate1  ,   >gate1  ; 1: 1/1
            mov     *bomb2  ,   >gate2  ; 2: 2/2
            djn.f   -1      ,   {gate2  ; 3: 3/3

        for 17
            dat     0       ,   0
        rof

            dat     0       ,   0       ; 1: 1/1
bomb2       dat     #1      ,   45      ; 2: 2/2
            spl     #-40    ,   45      ; 3: 3/3


        for MAXLENGTH-CURLINE
            dat     0       ,   0
        rof

            end

