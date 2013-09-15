;redcode-imt2
;name Ring Thing
;author Simon Duff (sduff@cs.rmit.edu.au)
;strategy Continuously Launching 3pt Imp Rings
;strategy   A Field driven Imps by the way
;assert CORESIZE==80

	ORG	start

        spl     imp-(CORESIZE/3)
start   spl     -1        
        spl     imp+(CORESIZE/3)+1
imp     mov.i   #((CORESIZE/3)+1),    *0

