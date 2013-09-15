;redcode-94
;name Damage Inflicted
;author Robert Macrae
;assert CORESIZE == 55440
;strategy DClear/Imp, Scanner

; One day I will learn to write a decent Silk. 
; In the meantime, just hope that David has gone for 
; something aggressive...
; sadly, there is little reason for him to do so.

; The idea was to have these aggressive components 
; appearing occasionally from behind a robust silk/imp;
; the combination should have been quite tough to handle.
; However, the SI never materialised so I have to rely
; on David 1) Not playing a strong Silk/Imp, and 
; 2) Not playing a scanner that can beat my 64proc, 2point 
; imp. Most scanners can :-(

; How about a wimpy Silk + Stone/Imp + bomb-dodger, please?


; ----------------------------------------------------
; Stalker for big core

; with overlapping scans, trail will always (?) be detected but 
; here it is after 5800 cycles -- academic, I suspect.


vStep     equ    (266)
vGate     equ    (vPtr-3)
vOffs     equ    (vClr+2-vStep*30-20)

vPtr      mov    }vFlag   ,>6000        ; } resets 5-line scan to 4-line
          mov    vIncr    ,>vPtr
vNext     add    vIncr    ,vScan        ; standard 3-line .66c scan
vScan     sne    vStep    ,vStep+21     ;
vFlag     djn.f  vNext    ,<16616       ; djn-stream - back at last!

vSet      mov.ab vScan    ,vPtr         ; set pointer to begin carpet
          jmn    {vFlag   ,vPtr         ; { turns 3-line scan into 4-line
vIncr     spl    #vStep   ,#vStep
          mov    vClr     ,>vGate       ; dclear to finish
          djn.f  -1       ,>vGate

          dat    0,0                    ; Mod 7 pattern

vClr      dat    >(55440/2)+1    ,2-vGate

    i for 13
        dat 0,0
      rof

vBoot     spl 1, vClr+1
      i for 6
          mov <vBoot, <vBp  ; (up in Imp splits)
        rof 
         djn vOffs-9, #2
             

    i for 14
        dat 0,0
      rof


; ---------
; P^3 Brain

w0      EQU vBoot       ; Stalker
w1      EQU boot       ; D/I   

PSTATE  EQU 1278


think   ldp.a    #0      ,in
        ldp.a    #PSTATE ,table
        mod.ba   *in     ,table
        stp.b    *table  ,#PSTATE

                        ; S  L T W
table   jmp }0   ,0748  ; 00 1 0 8
        dat #w0  ,0210  ; 01 3 1 0  
        dat #w0  ,0662  ; 02 5 2 2  
        dat #w1  ,0949  ; 03 4 3 9  
        dat #w1  ,0213  ; 04 6 4 3  
        dat #w1  ,0225  ; 05 0 5 5
        dat #w0  ,0556  ; 06 7 6 6 
        dat #w1  ,0227  ; 07 2 7 7 
        dat #w0  ,0558  ; 08 0 8 8 
        dat #w1  ,0669  ; 09 3 9 9
        dat #w0  ,0430  ; 10 7 1 0       

in      dat  0,9   ; L must have non-zero b-field in the previous cell
        dat  0,10  ; W
        dat  0,11  ; D


             for 53
		   dat 0,0
             rof


; ----------------------------------------------------

; DClear with 64p 2 point imp. Vulnerable to scanners,
; but good against stone/imps.

half  equ (55440/2)

             for 12
		   dat 0,0
             rof

boot
   i for 6 
      mov    <bp, {bp	
     rof
      mov    ptr,  ptr+half-700
      mov   imp,		imp-200
      mov   imp,		imp-200+half
bp    spl    bomb+1+half-700, bomb+1     
      spl   *bp,        >4000
vBp	spl   1,		vOffs
	spl   1,		>5000
	spl   1,		>6000
	spl   1,		>7000
	spl   1,		>8000
	spl   2,		>9000
 	jmp   imp-200,		}0
 	jmp   imp-200+half,	}0	
imp   mov.i #0,         half+1


             for 18
		   dat 0,0
             rof


ptr             dat >0, 1000

             for 3
		dat 0,0
             rof

dc              spl #0,     }ptr
                spl #0,     }ptr
                mov.i bomb, >ptr
                mov.i bomb, >ptr
                djn.f -1,   >ptr
bomb            dat -500,  bomb-ptr+2




      end   think
