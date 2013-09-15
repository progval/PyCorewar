;-----------------------------------------------------------------------------
;redcode
;name     Nematode v1.3e+
;author   Jonathan Stott <jstott@poly.phys.cwru.edu>
;strategy A paper/stone blend with defensive imp rings to help it along
;strategy Really needs to be pspaced with a fast bomber to be effective.
;strategy [07/24/96 release]
;assert   CORESIZE==8000
;-----------------------------------------------------------------------------

; Paper constants
ASTEP   equ     100              ; No, this is not a good constant to use.
BSTEP   equ     225              ; Nor is this.

; Ring constants
D3      equ     2667             ; distance between the 3 points
D7      equ     1143             ; distance between the 7 points
SKIP7   equ     (jtbl+200)       ; where to drop the 7-pt ring

;--------------------------------------------------------------------------

        org     start

;--------------------------------------------------------------------------

start   spl     imp7,           <0770   ; random decrements of core
        spl.a   1,              <1640
        spl.a   1,              <2410
        spl.a   1,              <3180
        spl.a   silk2,          <3950

;--------------------------------------------------------------------------

silk    spl.a   @0,             {ASTEP  ;split forward, dec't because I can
        mov.i   }silk,          >silk   ;copy (main)

cel2    spl.a   @cel2,          {BSTEP  ;split forward, dec't because I can
cel2a   mov.i   }cel2,          >cel2   ;copy (secondary)

;--------------------------------------------------------------------------

        mov.i   bomb,           {bomb           ;clear (self)
        mov.i   bomb,           {silk           ;clear (behind self)
        mov.i   bomb,           >bomb           ;clear (matched paper)
bomb    dat     #cel2+1+1,	#(cel3-bomb)    ; suicide

;--------------------------------------------------------------------------

j1      for     16
         dat    0,       0              ; spacer
        rof

;--------------------------------------------------------------------------

imp7    spl.a   1,              <4720   ; split 7 processes + 1 suicide
        spl.a   1,              <5490   ; more random decrements
        spl.a   1,              <6260

vec     jmp.a   *jtbl,          }0      ; vector launch a 7-pt impring

imp     mov.i   0,              D7      ; the actual code

imp1    mov.i   imp,            *jtbl+1 ; start it, then suicide on dat's

jtbl    dat     imp1,           0       ; vector table for all 7 points
        dat     SKIP7+0*D7,     0
        dat     SKIP7+1*D7,     0
        dat     SKIP7+2*D7,     0
        dat     SKIP7+3*D7,     0
        dat     SKIP7+4*D7,     0
        dat     SKIP7+5*D7,     0
        dat     SKIP7+6*D7,     0

;--------------------------------------------------------------------------

k       for     (MAXLENGTH-CURLINE-24)
          dat   1,      1               ; decoy code
        rof

;--------------------------------------------------------------------------

j2      for     16
          dat   0,      0               ; spacer
        rof

;--------------------------------------------------------------------------

silk2   spl.a   @0,             {ASTEP  ;split forward, dec't because I can
        mov.i   }silk2,         >silk2  ;copy (main)

cel3    spl.a   @cel3,          {BSTEP  ;split forward, dec't because I can
cel3a   mov.i   }cel3,          >cel3   ;copy (secondary)

;--------------------------------------------------------------------------

rlnch2  spl.a   c2,             >c2+8   ;standard 3-pt ring.
        spl.a   rimp2+1*D3,     >c2+12  ; decrement a few bytes of core
rimp2   mov.i   rimp2,          D3
c2      jmp.a   rimp2+2*D3,     >c2+16

        end

;--------------------------------------------------------------------------
