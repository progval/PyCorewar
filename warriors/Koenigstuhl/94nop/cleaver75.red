;redcode-94
;name Cleaver/75
;author Wayne Sheppard
;strategy .75c bomber/scanner with active imp scan
;strategy
;assert 1
 
mod10 equ -70 
starta equ hit-1+mod10
startb equ starta+mod10*2
irun equ loc-15
      ;hit here
hit   mov bomb,*loc ;not in main loop, executed only when mod doesnt find imp
      mov bomb,@loc 
loc   mov starta,@startb
      sub s,loc
      jmz.f -3,*loc     ;check a-pointer
      mod i127,*loc     ;see if multiple of 127
      jmn.f hit,*loc    ;if not, bomb it and continue bombing
      jmp scc           ;jump to SpiralCC
i127  dat 127,127
      dat 0 ;hit here
scc   add.x {loc,*loc   ;get impnumber into A
      mov *loc,scc      ;move increment to where I can use it
      jmn.f 0,{loc      ;back up to start of imp
      mov s,*loc        ;spiral SPL
      add scc,loc
      djn -2,#400
s     spl #mod10*3,<mod10*3  ;Then CC and GATE
      mov 1,<-2
bomb  dat <mod10*3-1,mod10
