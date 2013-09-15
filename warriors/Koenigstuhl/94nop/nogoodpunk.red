;redcode-94
;name no-good-punk
;author Franz
;strategy 50% of c stone, modulo 5,non-selfsplitting,2365 step increase
;assert CORESIZE==8000

opt             EQU 2365
INSTALLS        EQU 3000

boot            
ps              FOR 13
                MOV.I bomb1+ps-1,bomb1+ps-1+INSTALLS
                ROF
                JMP stone+INSTALLS

bomb1           MOV opt,>opt
bomb2           SPL 0,-opt+1
adder           DAT opt*2,opt*2
where           DAT 1,1+opt
sb              DAT 0,0
stone           ADD.F adder,where
                MOV.I bomb1,*where
                MOV.I bomb2,@where
                DJN stone,#1600
                DAT 0,0
                SPL 0,<adder-80
                MOV adder,<adder-10
                JMP -1,<adder-80
                
p               FOR 73
                SPL #p,#-p+50
                ROF
                END boot
