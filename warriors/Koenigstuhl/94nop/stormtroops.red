;redcode-94
;name Stormtroops
;author Franz
;strategy stone(.5c)
;assert 1
step            EQU 2365
gate            EQU incr-100

                ORG where

incr            DAT step*2,step*2
where           SPL #0,<step
stone           ADD incr,where
                MOV.I <gate-1,*where
                MOV.I <gate-1,@where
djntrain        DJN stone,<gate
                
                END
