;redcode
;name BT96-678
;author George Eadon
;strategy Aiiieee, I'm swamped this week... No time to write anything
;strategy decent. This is basically a stone using MOV.F & MOV.X in place 
;strategy of MOV.I. 
;strategy This warrior was designed for an environment where 'LDP JMP .I .BA
;strategy # and *' were illegal.
;strategy I'm guessing that decrements & MOV.F style bombing attacks are the
;strategy most likely opponents this warrior will face, so the limited
;strategy testing I was able to do was done against DJN streams & a version
;strategy of Tornado with MOV.I replaced with MOV.F
;assert 1

inc     dat     -412, 412
        spl     @0, 10
        spl     @0, 9
        spl     @0, 8
        spl     @0, 7
        spl     @0, 6
        spl     @0, 5
        spl     @0, 4
        spl     @0, 3
        spl     @0, 2
        spl     @0, 1
start   spl     @0, 0
        add.f   inc, pos
        mov.f   bomb, @pos         
pos     mov.x   {0, <0          ; BOMBED
        jmz     start+1, 0
        djn     start, -1
        dat     0, 0
bomb    dat     <4, <0

        end     start
