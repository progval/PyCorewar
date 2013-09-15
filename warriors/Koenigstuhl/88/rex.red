;redcode
;name Rex
;author Franz
;rating 66.08 wilkies
;strategy stone (in'88)
;assert CORESIZE==8000

opt EQU 3045
bomber          MOV <0,<0
start           SPL -1,<-20
starter         ADD bomb,bomber
bomb            DAT #(-1)*opt,#opt
                END start
