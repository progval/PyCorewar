;redcode verbose
;name SimpleScan 2
;author Campbell Fraser
;strategy +------------------------------+
;strategy | Program posted to net.       |
;strategy +------------------------------+
;assert 1 
LEN       equ 9
 
NEXT      add INC, POS
POS       cmp -2, 3998
EXIT      slt #LEN, POS
          jmz NEXT, <SB
CLEAR     mov INC, @SB
DROP      mov SB, @POS
          add SWAP, POS
          jmp POS
SWAP      dat #4000, #4000
SB        spl 0, NEXT-10
INC       dat #-46, #-46
	  end NEXT
