;redcode
;name Ghost in the Core
;author Edgar
;strategy Since the rest is doubtlessly going to use
;strategy disgustingly complex pswitching engines,
;strategy so I'm going the opposite way, just for fun.
;strategy Switch time: min 3, max 4, total engine size 6 cells
;assert 1

org brain

db     DAT.F  >    -1, >     1
stone  SPL.B  #     0, <  -100
       MOV.I  $    db, $ -1499
       ADD.AB #   197, $    -1     
       DJN.F  $    -2, < -1151     

brain   ldp.a #1,switch
        stp.b *switch,#1
        jmz.a stone,switch   ;0
switch  jmp *0,1             ;isn't this cute? ;)			
        spl scan,2
        spl paper,0

for 10
        dat 0,0
rof

       SPL.B  #     1, {     1
       MOV.I  $    -1, <    -6     
       MOV.I  >    -7, >    -7     
       JMN.F  $    -2, >    -8     
scan   ADD.AB #    10, @    -2
       JMZ.F  $    -1, <   -10     
       SLT.B  @    -4, #    17     
       DJN.B  $    -6, @    -5     
       DJN.B  $    -4, #    16     
       JMP.B  $    -5, {    -8

for 4
        dat 0,0
rof

paper  SPL.B  $     1, <  -200
       SPL.B  $     1, <  -300     
       MOV.I  $    -1, $     0     
       SPL.B  @     0, }  1800     
       MOV.I  }    -1, >    -1     
       SPL.B  @     0, }  3740     
       MOV.I  }    -1, >    -1     
       MOV.I  { -1870, <  1870     
       MOV.I  {    -3, <     1     
       JMP.B  @     0, > -1922

i for (MAXLENGTH-CURLINE)
        spl #i,i*4
rof

end
