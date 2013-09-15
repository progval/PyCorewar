;redcode-b
;assert CORESIZE==8000
;name RingWorm_v1.4
;author Calvin Loh
;strategy 9-point imp ring/spiral(?) with 27 processes( JMP-ADD launch )
;strategy and paper
step    equ     889
imp     mov     imp,    imp + step
start   spl     1
        spl     1
        mov     -1,     0
        spl     1
        mov     -1,     0
launch  spl     2
        jmp     @0,     imp
        add.ab  #step,  -1
silk    spl.a   @0,     800    
        mov.i   }silk,  >silk  
        spl.a   silk,   {silk
end     start
