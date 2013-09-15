;redcode-94
;name Seven-Eleven
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Familiar-looking 80% f-scanner with
;strategy tweaked bombs and step sizes.

; 1.0   Switches to SPL #0,{0. This gives away far too many draws;
;       so change clear to DAT #0,{0.
; 1.1   Tries a run of 17 self scans, with minor pickup vs papers.
; 1.1g  tries NO decoy; strangely this seems better than an tuned
;       anti-QS one? I expected a decoy at -100 to be very effective.
; 1.1gi Finally try different steps.


tPtr      dat    100      ,4100-4        ; widely-spaced pointers

          dat    0,0
          dat    0,0
          dat    0,0
          
tWipe     mov    tSpl     ,<tPtr         ; positive wipe of opponent from x-2
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr         ; first check at x
          
tScan     sub.x  #-11     ,tPtr          ; increment and look
          sne.f  *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan        ; increment and look
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan        ; swap pointers for attack
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr  ; self-check
          djn    tWipe    ,@tScan        ;   go to attack x-1
          djn    *pScan   ,#17           ; after 13 self-scans
          jmp    *pScan   ,}tWipe        ;   switch to dat-wiping

          dat    0,0

tSpl      spl    #0,{0
          dat    0,{0
          
          dat    0,0
tEnd      dat    0,0
      
      for 70
          dat    0,0
      rof
         
          end    tScan+1
