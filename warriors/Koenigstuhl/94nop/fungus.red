;redcode-94
;name Fungus
;author Christian Ruppert
; <arc@gmx.li>
;assert CORESIZE>300
 
offs    equ     CORESIZE/2-173
 
bomb:   dat     bomb,   offs
start:  mov.ab  #(last-bomb),   seed
fungus: spl     sewer,  #0
loop:   mov     bomb,   bomb-1
        jmp     loop,   <loop
sewer:  mov     }bomb,  >bomb
seed:   djn     sewer,  #10
        spl     offs+start
loop2:  mov     bomb,   last
        jmp     loop2,  >loop2
last:   dat     #0,     #0
        end	start
