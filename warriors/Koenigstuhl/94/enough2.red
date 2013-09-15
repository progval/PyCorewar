;redcode-94
;name Enough is enough!
;author John Metcalf
;strategy had enough of tweaking the scanner and switcher :-(
;strategy p-switcher, switch between scan and paper
;assert (CORESIZE==8000)
 
        org    pThink
 
; -=> Switcher <=-
 
        paper  equ (silk-silk)
        scan   equ (silk-sAtk)
        wSize  equ 9
 
pThink: ldp.a  {pBoot-323,     #1
        ldp.a  <pBoot-322,     pVect    ; pKey equ -1
        add.a  pThink,         pMod
pMod:   mod.a  #5,             pVect
        sub.x  *pVect,         @pBoot-wSize+2
 
        for    wSize
        mov    <pBoot,         {pBoot
        rof
 
pBoot:  spl    }wSize,         #silk+wSize
        stp.a  pBoot,          #1
                                        ; State Lose5  Win6  Tie7
pVect:  dat    #paper,  <-104  -210*3   ;   (0)     4     2     6
        dat    #paper,  #-50   -210*11  ;   (1)     0     2     1
        dat    #paper,  #-176  -210*29  ;   (2)     1     2     1
        dat    #scan,   #-185  -210*12  ;   (3)     0     5     3
        dat    #scan,   #-53   -210*23  ;   (4)     3     5     4
        dat    #scan,   #-89   -210*21  ;   (5)     4     5     5
        dat    #scan,   #-167  -210*17  ;   (6)     2     5     6
 
; -=> Scanner <=-
 
        sStp   equ 903
 
sAtk:   mul.x  {sJmp-1,        }sAlt
sPtr:   slt.ba #9,             #0
        mov.b  @3,             sAtk
sAdj:   mov    sSpl,           >sAtk
sAdd:   add    #sStp,          sPtr
sJmp:   jmz.f  sAdd,           @sPtr
sAlt:   jmn    sAtk,           sPtr
        jmp    sAdj,           }sAdj
sSpl:   spl    #0,             {0
 
; -=> Paper <=-
 
        pStep1 equ 2852
        pStep2 equ 5213
        x      equ 6580
        y      equ 2951
 
silk:   spl    *0,             >1803
        spl    1,              >3109
        spl    1,              {2506
pap1:   spl    @0,             >pStep1
        mov.i  }pap1,          >pap1
        mov.i  #y,             <1
        mov    -1,             {x
        mov.i  {pap1,          <pap2
pap2:   djn.f  @0,             >pStep2
        end

