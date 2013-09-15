;redcode-b
;name Toxin IVa
;author Edgar
;strategy silk ... shorter boot, new constants
;assert CORESIZE==8000

step1   equ 3217   
step2   equ 2701

        org boot

false   for 25
        cmp -false,-false*3
        rof
boot    spl 1,}2000
        spl 1,}4000
        spl 1,}6000
        mov <bp,{bp
bp      spl 2000,bom+1
head    spl step1,0
        mov >-1,}-1   
        spl step2,0
        mov >-1,}-1
        mov bom,}2000
        mov bom,}4000
        mov bom,}6000
bom     dat <1,<1
decoy   for (MAXLENGTH-CURLINE)
        nop decoy*2,decoy*3
	rof

        end
