;redcode
;name Acid Rain
;author W.A-Worth & Justin Kao
;strategy Incidentally, try to kill the #$@#! Dust test which refuses to die...
;assert 1
;109 Wilkies

        org boot

ptr     dat 0,  100
bomb    dat {1, <20
clear1  spl #0, >ptr
        mov bomb,>ptr
        djn.f -1,>ptr
clear2  spl #0, >ptr
        mov bomb,>ptr
        djn.f -1,>ptr
clear3  spl #0, >ptr
        mov bomb,>ptr
        djn.f -1,>ptr

        for     50
        dat     0,      0
        rof

boot	spl clear1
	spl clear2
        jmp clear3
