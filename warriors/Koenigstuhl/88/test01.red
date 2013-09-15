;redcode
;name .T.E.S.T. V0.1
;author P.E.M & E.C
;strategy Double impact
;assert 1

pas     equ     2376+1
debut   equ     -1
offset  equ     -1000
data    equ     15
dec     equ     0
ddestb  equ     4000-1
nbbomb  equ     499

; This is Clown
mov1    mov     jump, debut+pas
        mov     bomb, <mov1
loop    add     #pas, mov1
        djn     mov1,#nbbomb
bomb    spl     0, <-8+dec
        mov     data, <-10+dec
jump    jmp     -1,<-10+5334+dec

src     dat     #0
desta   dat     #offset
destb   dat     #offset+ddestb


inc     dat     <-9-2668+dec,<-9+dec

start   
        mov     <src,<desta
        mov     <src,<desta
        mov     <src,<desta
        mov     <src,<desta
        mov     <src,<desta
        mov     <src,<desta
        mov     <src,<desta

        mov     #0,src
        mov     <src,<destb
        mov     <src,<destb
        mov     <src,<destb
        mov     <src,<destb
        mov     <src,<destb
        mov     <src,<destb
        mov     <src,<destb
        spl     @desta
        spl     @destb
        add     #5+data,desta
        add     #5+data,destb
        mov     inc,@desta
        mov     inc,@destb

        mov     inc, desta      ; against vamps
        mov     inc, destb      ; against vamps
        dat     #0
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
        dat     #fin
fin     dat     <-2667,<2668
        end     start
