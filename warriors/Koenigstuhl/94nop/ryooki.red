;redcode-94
;name     Ryooki
;author   T.Hsu
;strategy Just a simple paper
;assert   CORESIZE == 8000 && MAXLENGTH >= 100 && VERSION >= 60
;-----------------------------------------------------------------------------
;  1.0  Just an imp killing paper.
;  1.1  Use nop and jmz.f in the paper.
;  1.2  Use "mov 0,}0" instead of nop.  Use "spl @nxt" instead of "spl nxt".
;  1.3  Larger due to anti-vampire code.  Use labels instead of numbers.
;  1.4  "nop >0,0" is better than both "mov 0,}0" and "nop 0,}0".
;  1.5  Better constants
;  1.6  Split before copying, shorter

            org     boot_paper

nxt_paper   equ     -3024 ; -3376,-3365

boot_paper  spl     1 ,>4000
            mov.i   -1,#0
            mov.i   -1,#0

paper       spl     @paper,<nxt_paper   ; A-fld is src, B-fld is dest
copy        mov.i   }paper,>paper
            mov.i   bomb  ,>paper       ; anti-imp
            mov.i   bomb  ,}800         ; anti-vampire
            jmn.f   @copy ,{paper
bomb        dat     <2667 ,<2667*2

cnt         for     91
            dat     0,0
            rof
