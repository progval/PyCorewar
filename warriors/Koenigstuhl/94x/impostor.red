;redcode-94x
;name impostor
;author na'ndor sieben
;contact nandor.sieben@asu.edu
;assert CORESIZE==55440

offset   dat #16238 ,#-16238
gt       spl 0
         sub offset,1
         mov <0,0
         jmp -2,0

        dat #0
        dat #0

start spl gt
launch
SPL 32
SPL 16
SPL 8
SPL 4
SPL 2
JMP impstart+0
JMP impstart+29179
SPL 2
JMP impstart+2918
JMP impstart+32097
SPL 4
SPL 2
JMP impstart+5836
JMP impstart+35015
SPL 2
JMP impstart+8754
JMP impstart+37933
SPL 8
SPL 4
SPL 2
JMP impstart+11672
JMP impstart+40851
SPL 2
JMP impstart+14590
JMP impstart+43769
SPL 4
SPL 2
JMP impstart+17508
JMP impstart+46687
SPL 2
JMP impstart+20426
JMP impstart+49605
SPL 16
SPL 8
SPL 4
SPL 2
JMP impstart+23344
JMP impstart+52523
SPL 2
JMP impstart+26262
JMP impstart+1
SPL 4
SPL 2
JMP impstart+29180
JMP impstart+2919
SPL 2
JMP impstart+32098
JMP impstart+5837
SPL 8
SPL 4
SPL 2
JMP impstart+35016
JMP impstart+8755
SPL 2
JMP impstart+37934
JMP impstart+11673
SPL 4
SPL 2
JMP impstart+40852
JMP impstart+14591
SPL 2
JMP impstart+43770
jmp impstart+17509
impstart MOV 0,29179
end start
