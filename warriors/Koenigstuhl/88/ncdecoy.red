;redcode
;name NC decoy
;author Wayne Sheppard
;assert 1
;strategy Small bomber with quick startup
;strategy launch small spiral
;strategy avoid long startup delays

imp     equ impcopy+1700+1  ;imp start
hide    equ 1600         ;stone location 

stone   spl 0,<-100       ;Stone is only four lines long
        mov <-41,1-2234   
        add 1,-1          ;mod 2 pattern
        jmp -2,<-2234     ;converts to addition coreclear
start   mov stone+3,hide         ;Copy stone 
        mov stone+2,<start       ;to a safe place
        mov stone+1,<start
        mov stone,<start
        spl start+hide-3,<4000   ;1st split to stone
        spl start+hide-3,<4000   ;2nd split to stone
        spl start+hide-3,<4000   ;3rd split to stone
ring    spl 9,<4050              ;binary ring
        spl 5,<4100              ;startup
        spl 3,<4150
        mov impcopy,imp          ;puts imp away from decoy
        jmp start+hide-3,<4200   ;4th split to stone
        jmp imp,<4250
        spl 2,<4300
        jmp 2667+imp,<6350
        jmp 5334+imp,<4400
        spl 4,<4450
        spl 2,<4500
        jmp 1+imp,<4550
        jmp 2668+imp,<4600
        spl 2,<4650
        jmp 5335+imp,<4700
        jmp 2+imp,<4750
impcopy mov 0,2667

FOR MAXLENGTH-CURLINE
        mov 0,2667
ROF

        end start
