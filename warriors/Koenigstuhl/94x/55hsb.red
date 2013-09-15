;redcode-x2
;name 55HSB
;author Robert Macrae
;assert CORESIZE==55440

; 0.75c carpet, to make 0,0 instructions less effective.
; spiral clear will catch 13pt imps, but leaves some gaps.
; HSB adds brainwashing!

tPtr      dat    300 ,27000              ; widely-spaced pointers
          dat    0,0
          dat    0,0
          dat    0,0
          dat    0,0
          
tWipe     mov    tSpl     ,<tPtr         ; positive wipe of opponent
          mov    >tPtr    ,@tPtr
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr
          
tScan     sub.x  #-12     ,tPtr          ; increment and look
          sne    *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan        ; increment and look
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan        ; swap pointers for attack
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr  ; self-check
          djn    tWipe    ,@tScan        ;   go to attack
          djn    *pScan   ,#13           ; after 13 self-scans

bw        mov    bb,      <bPtr          ; Brainwash
          jmn.b  bw,      bPtr 

step13  equ 34117  ;  13pt 

spiral  mov    db,         }tPtr         ; Default to 13 pt
        add.a  #step13-2,  tPtr
        jmp    spiral,     }tPtr
bb      stp    >0,         #0
db      dat    tSpl-tPtr,  1

          dat    0, 0
tSpl      spl    0, 0
          dat    0, 0
bPtr      dat    0, #tPtr 
tEnd      dat    0, 0

      for 81
          dat    0,0
      rof
       
      end    tScan+1

