;redcode-94
;name T-1 vX
;author Ross Morgan-Linial
;assert CORESIZE==8000

;strategy A small scanner that starts a coreclear
;strategy at the location it first finds something.

ptr     DAT     #0,             #0
ccptr   dat.f   -5,             100
        dat.f   -5,             cctail-ccptr+10
        spl     #-5,            cctail-ccptr+10
start   ADD.AB  #-421,          ptr             ;step through
                                                ;locations
        JMZ.A   start,          @ptr            ;check for nonzero A-field
        SLT.ab  #cctail-ptr,    ptr             ;check for self-finding
        JMP     start,          ptr
        MOV     ptr,            ccptr-5
        SUB     #cctail-ptr+5,  ccptr-5
cclear  spl     #-10,           10      
        mov.i   @bptr,          >ccptr-5
        mov.i   @bptr,          >ccptr-5
cctail
bptr    djn.b   -2,             {ccptr+2

 END     start
