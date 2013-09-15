;redcode-b
;name Wanderer v0.2
;author Ian Oversby
;strategy v0.1  Imp / stone
;strategy v0.2  Changed stone
;assert 1
 
        SPL.B   bstart
        SPL.B   1
        MOV.I   -1, 0
        SPL.B   1
        MOV.I   -1, 0
        MOV.I   -1, 0
        SPL.B   2
        JMP.B   imp, <-1000
        ADD.A   #1143, -1
        DAT.F   #0, #0
imp     MOV.I   #0, 1143
	 
bstart  MOV stone+3, <boot
        MOV stone+2, <boot
        MOV stone+1, <boot
        MOV stone, <boot
        JMP @boot
 
boot    DAT #0, #2157
 
        SPL   #2714, #6998	;guessed constants!
stone   ADD   cons, mix
mix     MOV   <-100, <5
cons    DJN.F stone, <-1087

        end

