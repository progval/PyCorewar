;redcode-94x
;name Dettol Test 487
;author Steve Gunnell
;strategy Betadine derivative
;assert CORESIZE==800 && MAXLENGTH==20

STEP   equ 23
COUNT  equ 335
SPACE  equ 4
GAP1   equ 0
GAP2   equ 6
REPEAT equ 2
DECOY  equ 234
BEGIN  equ (scn-STEP*COUNT)

gate dat   BEGIN  ,BEGIN-SPACE
     for  GAP1
     dat.f $0    ,$0
     rof
     dat   #-10   ,bot+3-gate
clr  spl   #-10   ,bot+3-gate
bom  mov   @bot  ,>gate
     for  REPEAT
     mov   @bot  ,>gate
     rof
bot  djn.f bom    ,{clr
     for  GAP2
     dat.f $0    ,$0
     rof
     dat   STEP   ,STEP
     add   -1     ,gate
scn  sne   @gate ,*gate
     djn.f -2     ,<DECOY
     jmp   clr    ,<gate

     end  scn
