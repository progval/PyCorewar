;redcode-94m test
;name   :-=
;author Robert Macrae
;assert CORESIZE==8000
;strategy Bite Failure, then bury everything else.

; Alone, I scan Failure 50% of the time, but other warriors will get in
; the way up to 90% of the time if all are 100 long. Allowing for enemies
; capturing processes from Failure, lets say we start the clear at 1.5c
; 25 times from 500 battles, so I then need a 4% survival rate for 1 win!

; Target is 16 long. Approximating bombing as strips of 4 bombs, a 4%
; survival rate corresponds to 1100 strips randomly distributed around
; core (I think) so each enemy must throw an average of 110 or fewer strips.

; I am probably at risk for 2000 cycles or so -- after this Silks should
; be largely stunned -- so the average warrior must execute only 440
; MOVs in the first 2000 cycles. This is optimistic for pure Silks, but
; close enough for :-= to have a chance!

; mwt series:
; 1.2 is Failure-based -- weak.
; 1.3 is broader spectrum -- 15% success.
;     1.3 was stunned 12% of the time, but killed 15%.
;     Sounds as if a 1.33c coreclear would be handy?
; 1.4 used Pinkcc, and scored 1x 5-way tie.
; 1.5 uses 2x0.66c SSSS clear, aiming to S-carpet imps.
; 1.6 ditto, but 0.75c for even more SPLs...  [BUG -- actually 0.66!]
;     Leads to a two-way between Aulder Man and Fleas 2!
;     -- almost certainly this is only a suicide-failure!
; 2.3 As 1.6 but scans more locations, and keeps scanning them!
; 2.4 Precision-tuned to Failure.
; 2.5 Puts fastest scans at the end, starts carpet after Failure,
;     and 0.8c scan if Q^2 misses.

; Portmanteau
; 1.0 Tweaks a couple of cycles out of locator code, makes suicide more
;     certain and DAT-carpets more tightly. Corrects 0.66c Bug.
;     However, the fangs can trap processes from damaged silks. Is there a
;     way to avoid this?
; 2.0 Only a single bite. Maybe "The Count" would be a better name...

        ORG start

; ----------------------------------------------

QS      EQU 100              ; Not a key parameter in MW... yet :-)
QD      EQU 4000             ; Ditto.
QB      EQU (start+14*QS)    ; Ditto.
CR      EQU (fnd-which)
datz    EQU (table-3)

        dat     9*QS,  1*QS     ; can get 28 values from this table
table:  dat     5*QS,  2*QS     ;
        dat    13*QS, 17*QS     ;

P:      add.f  table,table  ; point into table. Nudge with }{>< and djn.f.
slow:   add.ab *P,fnd       ; adds an element A column (usually)
fast:   add.b  @P,@-1       ; adds an element B column (usually)

which:  sne.i  datz,@fnd    ; which half of scan hit?
        add.ab #QD,fnd

; ----------------------------------------------
; Vamp Failure

; Failure is a tough target because it executes in so many parallel
; streams, and I need them all. If I can get word 22 within 42 cycles, then
; this bomb-pattern will catch or kill every process within 100 cycles
; or so. Its best to do this quickly to prevent enemies adopting orphan
; processes and stunning my pit!

bite
         sub.ab #37,      fnd   ; Inline, as only 42 cycles available.
         sne    @fnd,     datz  ; 37 rather than 64 to shave later ADDs.
          add.ab -2,      fnd
         sub.ab #32,      fnd
         sne    @fnd,     datz
          add.ab -2,      fnd
         sub.ab #16,      fnd
         sne    @fnd,     datz
          add.ab -2,      fnd
         sub.ab #8,       fnd
         sne    @fnd,     datz
          add.ab -2,      fnd
         sub.ab #4,       fnd
         sne    @fnd,     datz
          add.ab -2,      fnd
         sub.ab #2,       fnd
         sne    @fnd,     datz
          add.ab -2,      fnd
         sne    <fnd,     datz       ; < shaves a cycle on final scan
          add.ab #1,      fnd

         add    #22,   fnd   ; Most urgent instruction to nobble
setup    sub.ba fnd,   fnd   ; Set up fang

         mov.i  fnd,   >fnd  ;        Precision Incision :-=

         add    #8,   fnd
         mov    datz, @fnd
         djn.b  -2,   #5     ; kill 5 papers
         add    #9,   fnd
         mov    datz, @fnd   ; and 6th
         sub.ab #65,  fnd
         mov    datz, @fnd   ; and launcher

         add.b  fnd,  gate   ; start carpet *after* enemy.
         jmp    self         ; now all we need is the clear to survive!

fnd:     jmp    pit, QB      ; Fang


         dat    #gate-10, clr-gate+7    ; just in case clr is decremented
gate     dat    #4000, 200
wipe5    dat    #7500, 2                ; SUICIDE
wipe4    dat    #7500, clr-gate+5
wipe3    dat    #7500, clr-gate+7       ; S-carpet imps at 1.5c is deadly
wipe2    spl    #7990, clr-gate+7       ; as whole core is carpetted before
wipe1    spl    #7900, clr-gate+7       ; the imp rebuilds itself.

         for 3                          ; from 6 -- smaller target.
           dat    0,       0
         rof

self     spl    #-500, -500             ; may as well point away?
pit
clr      spl    #-500, >-20             ; I should end up with more
         mov    @3, >gate               ; processes than Failure...
         mov    @2, >gate               ; so he suicides first.
         mov    @1, >gate
         djn.b  -3, {wipe1

         for 2
           dat  0,  0
         rof

; ----------------------------------------------
;                  Q^2 from Obvious
; ----------------------------------------------

; Q^2 with fastest scans last to sneak within the 42-cycle limit

start:

        seq.i  QB+QS*14,QB+QS*14+QD
        jmp    P, 0                     ; BBEE

        seq.i  QB+QS*4,QB+QS*4+QD
        jmp    }slow, 0                 ; EE
        seq.i  QB+QS*3,QB+QS*3+QD
        jmp    }slow, {P                ; DE

        seq.i  QB+QS*7,QB+QS*7+QD
        jmp    slow, 0                 ; BE
        seq.i  QB+QS*6,QB+QS*6+QD
        jmp    slow, <P                ; BD
        seq.i  QB+QS*22,QB+QS*22+QD
        jmp    slow, >P                ; BF
        seq.i  QB+QS*11,QB+QS*11+QD
        jmp    slow, {P                ; AE
        seq.i  QB+QS*15,QB+QS*15+QD
        jmp    slow, }P                ; CE
        seq.i  QB+QS*10,QB+QS*10+QD
        djn.f  slow, P                 ; AD

        seq.i  QB+QS*5,QB+QS*5+QD
        jmp    >fast, 0                 ; B
        seq.i  QB+QS*9,QB+QS*9+QD
        jmp    >fast, {P                ; A
        seq.i  QB+QS*13,QB+QS*13+QD
        jmp    >fast, }P                ; C

;        seq.i  QB+QS*8,QB+QS*8+QD
;        jmp    P, <P                    ; BDE
;        seq.i  QB+QS*24,QB+QS*24+QD             ; KO to avoid self scan!
;        jmp    P, >P                    ; BEF   ; KO to avoid self scan!
        seq.i  QB+QS*12,QB+QS*12+QD
        jmp    P, {P                    ; ADE
        seq.i  QB+QS*32,QB+QS*32+QD
        jmp    P, }P                    ; CEF
        seq.i  QB+QS*20,QB+QS*20+QD
        djn.f  P, P                     ; AADD

        seq.i  QB+QS*2,QB+QS*2+QD
        jmp    fast, 0                 ; E
        seq.i  QB+QS*1,QB+QS*1+QD
        jmp    fast, <P                ; D
        seq.i  QB+QS*17,QB+QS*17+QD
        jmp    fast, >P                ; F

        seq.i  QB+QS*0,QB+QS*0+QD
        jmp    which, 0                ; 0

;        seq.i  QB+QS*19,QB+QS*19+QD
;        jmp    }slow, }P                ; FE

;        seq.i  QB+QS*2,QB+QS*2+QD               ; Duplicates a faster scan
;        djn.f  }slow, P                 ; DD    ; Duplicates a faster scan
;        seq.i  QB+QS*10,QB+QS*10+QD             ; Duplicates a faster scan
;        jmp    <fast, 0                ; BB     ; Duplicates a faster scan
;        seq.i  QB+QS*18,QB+QS*18+QD
;        djn.f  <fast, P                ; AA
;        seq.i  QB+QS*36+CR,QB+QS*36+QD+CR         ; CR corrects for the gap
;        jmp    }fast, 0                ; BBBBG    ; between fnd and which.
;        seq.i  QB+QS*26+CR,QB+QS*26+QD+CR
;        jmp    }fast, >P               ; BBG
;        seq.i  QB+QS*34+CR,QB+QS*34+QD+CR
;        jmp    }fast, {P               ; AAG
;        seq.i  QB+QS*42+CR,QB+QS*42+QD+CR
;        jmp    }fast, }P               ; CCG
;        seq.i  QB+QS*52+CR,QB+QS*52+QD+CR
;        djn.f  }fast, P                ; AAAAG
;        seq.i  QB+QS*16+CR,QB+QS*16+QD+CR
;        djn.f  }fast, }slow            ; G

         jmp    setup, pit       ; may as well bite something?

         end
