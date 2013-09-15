;redcode-b
;name Le vamp
;version 6
;author Matthieu Walraet
;strategy vamp stun clear gate quick
;strategy redcode on http://bach.iie.cnam.fr:2000/walraet/levamp.html
;assert !(CORESIZE % 5)

per     EQU 3315

        JMP tic ,       <gate
        JMP tic ,       <gate
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45
        DAT #44 ,       #45     
        JMP tic ,       <gate
        JMP tic ,       <gate
        JMP tic ,       <gate
gate    DAT #44 ,       #45
        JMP tic ,       <gate   ;impact
        JMP tic ,       <gate
        JMP tic ,       <gate

bob     JMP tic-2,      #2
toc     DAT #-per,      #per
        DAT #0  ,       #0      ;impact

bou     ADD toc ,       bob
        MOV bob ,       @bob
        DJN bou ,       #8000
        JMP fin ,       <gate
        DAT #0  ,       #0      ;impact
fin     SPL att1,       <gate
        MOV #-6,        bo
        SPL att2,       <gate
        JMP tic,        <gate
        SPL 0   ,       #45     ;impact
        SPL 0   ,       #45
tac     MOV bo  ,       <a
tic     SPL 0   ,       <gate
tuc     JMP tac ,       <gate
        SPL 0   ,       #45     ;impact
bo      DAT #2  ,       #-30
att2    JMP att2,       <gate
att1    MOV bo  ,       <a
        JMP att1,       <gate
        SPL 0   ,       #45     ;impact
a       DAT #1  ,       #4000
        SPL 0   ,       #45
        SPL 0   ,       #45
        SPL 0   ,       #45
        SPL 0   ,       #1      ;impact
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1
        SPL 0   ,       #1


        END bou
