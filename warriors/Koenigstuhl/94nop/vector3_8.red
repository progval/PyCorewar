;redcode-94
;name Vector (3/8 spiral)
;author T.Hsu
;assert CORESIZE == 8000

imp_size    equ     2667                ; 3 point, 8 process imp spiral
imp_prc     equ     8

imp_A_fld   equ     imp+(imp_prc+1-2*cnt)*imp_size
imp_B_fld   equ     imp+(imp_prc+0-2*cnt)*imp_size
cnt         for     imp_prc/2
            jmp     imp_A_fld,imp_B_fld
            rof
imp_vector  spl     1              ,#0
            spl     1              ,#0
            spl     <0             ,#imp_vector
            djn.a   @(imp_vector-1),#0

imp         mov.i   #0,imp_size

            end     imp_vector
