;redcode
;name Seed

;strategy b-scanning troll, core-clear
;assert CORESIZE==8000
find equ (enter-3)
next equ (-23)
enter spl @find   ,#0
more  add #1+next ,find
      jmz more    ,<find
      jmz enter   ,enter
      spl 0       ,<1
      mov @2      ,enter
      end more
