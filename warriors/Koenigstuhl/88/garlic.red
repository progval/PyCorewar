;redcode
;name garlic
;author Stefan Strack
;strategy vampires are afraid of it
;strategy Submitted: @date@
;assert 1

scan    jmz scan,<ptr
        sub @ptr,<ptr
        add #10,@ptr
ptr     mov 2,<-100
        jmp ptr
