;redcode-94lp
;name Golden Gate 3.1
;author Franz
;strategy Airbag bomber falls to a d-clear
;strategy a bit better then the hill version
;rating 140 Wilkies
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000 && MAXPROCESSES>=8

opt EQU 2365
stbm EQU 2
INSTALL EQU 2335
check EQU align-78

        org boot

boot    

;boot the stone
p for 8
        mov }si,>si
rof

;set up the checkpoint
        mov.f #333,align-80+INSTALL
        mov.i gate,align-78+INSTALL

;set up bomb for coreclear
        mov dbomb,align+40+INSTALL

;set up 6 proccesses for the bomber
        spl 5,>1000
        spl 7,>3000
        spl 2,>4000
        jmp }ji,>-1500
        jmp }ji,>-2500
        spl 2,>-1000
        jmp }ji,>1500
        jmp }ji,>3500
        spl 2,>-3000
        jmp }ji,>-3500
        jmp stone+INSTALL,>-2000

;the boot pointers
si      dat stone,stone+INSTALL
ji      dat stone+INSTALL,0

;the bomb itself plus this is the checkpoint
gate    dat     opt+1,    -1

;bomb for the coreclear
dbomb   dat >2667,>50

;the stone itself, could not optimize and bombproof it any more
;and I don't think it can really be done
stone   mov.i check,<where
where   mov.i >stbm+opt,{stbm+(opt*2)+1
        add.f jump,where
        mov.i >check,{where
align   jmz.f stone,<check              ;this is the label used to align
                                        ;the whole warrior after boot

;fairly standard d-clear
jump    spl #opt*3+1, >opt*3+1
clr     mov.i align+40, >align-40
        djn.f clr, >align-40

        end
