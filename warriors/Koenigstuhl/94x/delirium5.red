;redcode-94
;author Franz
;name Delirium 5
;strategy P-spacer with StampII(silk)/brutal(vampire)
;strategy runs on the big/normal hill in '94ICWS
;url http://www.azstarnet.com/~franz
;assert CORESIZE==55440 || CORESIZE==8000

FOR (CORESIZE==55440)
opt EQU 23435
INSTALLT EQU 20000
INSTALLC EQU -30000
INSTALLP EQU -29700
INSTALLB EQU 40000
INSTALLA EQU 30000
ROF

FOR (CORESIZE==8000)
opt EQU 2365
INSTALLT EQU 2000
INSTALLC EQU -3000
INSTALLP EQU -2700
INSTALLB EQU 4000
INSTALLA EQU 3000
ROF

_RES EQU #0
_STRAT EQU #(PSPACESIZE/2+13)

                ORG boot
boot
result  ldp.ab _RES, wlt
strat   ldp.a _STRAT, choice
wlt     sne.ab #1, #0
        jmp win                 ; win has occured
        add.a #1, choice        ; loss or tie has occured
        mod.a #4, choice
        stp.a choice, _STRAT
choice  jmp @0, brutal          ; _STRAT = 0, choose strat1
        nop 0, brutal           ; _STRAT = 1, choose strat1
        nop 0, stamp           ; _STRAT = 2, choose strat2
        nop 0, stamp           ; _STRAT = 3, choose strat2
win     mov.ab choice, #0       ; reset index becuase of win
        mod.ab #2, win          
        sub.ba win, choice      
        jmp choice-1


brutal          MOV trapper,trapper+INSTALLT
                MOV tr2,tr2+INSTALLT
                MOV tr3,tr3+INSTALLT
                MOV tr4,tr4+INSTALLT
                MOV coreclr,coreclr+INSTALLC
                MOV cc2,cc2+INSTALLC
                MOV cc3,cc3+INSTALLC
                MOV bomb,bomb+INSTALLB
                MOV adder,adder+INSTALLA
                MOV pit,pit+INSTALLP
                MOV p2,p2+INSTALLP
                MOV p3,p3+INSTALLP
                MOV p4,p4+INSTALLP
                MOV p5,p5+INSTALLP
                JMP trapper+INSTALLT
bomb            SPL bombstart-INSTALLT+pit-opt+INSTALLP,bombstart-INSTALLT+opt
bombstart       DAT #0,#0
trapper         MOV bomb-INSTALLT+INSTALLB,@bomb-INSTALLT+INSTALLB
tr2             ADD adder-INSTALLT+INSTALLA,bomb-INSTALLT+INSTALLB
tr3             JMZ trapper,bombstart
tr4             JMP coreclr-INSTALLT+INSTALLC,<trapper-80
                DAT #0,#0
coreclr         SPL 0,<coreclr-80
cc2             MOV 2,<coreclr-2
cc3             JMP -1,<coreclr-80
adder           DAT #(-1)*opt,#opt
                DAT #0,#0
pit             SPL 0,<pit-80
p2              SPL -1,<pit-80
p3              STP #-324,#1
p4              SPL -3,>-1
p5              JMP pit,{-2
                


stamp spl     1,      <-300
      spl     1,      <-300
      spl     1,      <-300   ;generate 8 parallel processes

silk1 spl.a   silk,   2120    ;split    this is the bootup proc
      mov.i   }silk1, >silk1  ;copy     it dies of really soon
      dat     0,      0       ;die here

silk  spl.a   @0,     2221    ;split
      mov.i   }silk,  >silk   ;copy
      add.ab  #33,    silk    ;add to counter
      mov.i   }-2300, }2300   ;bomb
      mov.i   }-1150, }1150   ;bomb
      mov.i   }-575,  }575    ;bomb
      mov.i   }-287,  }287    ;bomb
      jmp.a   silk,   {silk   ;repeat the thing resetting pointer



                END
