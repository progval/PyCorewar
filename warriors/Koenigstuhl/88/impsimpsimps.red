;redcode
;name  Imps!  Imps!  Imps!
;author  Steven Morrell
;strategy  Imps make winning (or at least tying) the game too easy.
;strategy  Version e: stealthioer code, no decoys
;strategy  Maybe try adding a stone later.
;assert CORESIZE==8000

imp     mov 0,1143

start   spl 0

p       mov imp,10
        add #260,p
        spl 1
        spl 1
        spl 1
        spl 1
        spl 2
        jmp @p
        add #1143,p

        end start

;Steven Morrell (morrell@math.utah.edu)
