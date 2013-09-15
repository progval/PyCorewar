;redcode-94x
;name   Vector (13 point, 2 layer spiral)
;author T.Hsu
;assert (CORESIZE == 55440) && (VERSION >= 60)

imp_size    equ     34117               ; 13 point, 2 layer imp spiral
imp_point   equ     26

A_fld       equ     imp+(imp_point+1-2*cnt)*imp_size
B_fld       equ     imp+(imp_point+0-2*cnt)*imp_size
cnt         for     (imp_point)/2
            jmp     A_fld,B_fld
            rof
imp_vector  spl     1              ,#0
            spl     1              ,#0
            mov.i   -1             ,#0
            mov.i   -1             ,#0
            spl     <0             ,#imp_vector
            djn.a   @(imp_vector-1),#0

imp         mov.i   #0,imp_size

            end     imp_vector

