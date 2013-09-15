;redcode verbose
;name Montage
;author Steven Morrell
;strategy  Stone and a bunch of imps and an imp gate.
;assert CORESIZE==8000

p1 equ (boot+300)
p2 equ (boot+302+2667)
p3 equ (boot+303)
p4 equ (boot+400)

stone   spl 0,<-50
        spl 0,<-51
        mov <3359,-3359
        add 2,-1
        djn -2,<-54
        dat <3359,<-3359

imp1    mov 0,2667
imp2    mov 0,2668
imp4    mov 0,1143
gate    jmp -3359,<3359-10

boot    mov stone+5,-200+5
        mov stone+4,<boot
        mov stone+3,<boot
        mov stone+2,<boot
        mov stone+1,<boot
        mov stone,<boot
        spl boot-200,<100
        mov gate,boot-200+6720
        mov imp1,p1
        mov imp2,p2
        mov imp2,p2+1
        mov imp2,p3
        mov imp2,p3+1
        mov imp4,p4
        spl b,<200
        spl ab,<300
        spl aab,<400
        spl aaab,<500
        spl aaaab,<600
        jmp p1,<700
aaaab   jmp p1+2667,<800
aaab    spl aaabb,<900
        jmp p1+5334,<1000
aaabb   jmp p1+1,<1100
aab     spl aabb,<1200
        spl aabab,<1300
        jmp p1+2668,<1400
aabab   jmp p1+5335,<1500
aabb    spl aabbb,<1600
        jmp p2,<1700
aabbb   jmp p2+2668,<1800
ab      spl abb,<1900
        spl abab,<2000
        spl abaab,<2100
        jmp p2+5336,<2200
abaab   jmp p2+4,<2300
abab    spl ababb,<2400
        jmp p2+2672,<2500
ababb   jmp p2+5340,<2600
abb     spl abbb,<2700
        spl abbab,<2800
        jmp p3,<2900
abbab   jmp p3+2668,<3000
abbb    spl abbbb,<3100
        jmp p3+5336,<3200
abbbb   jmp p3+4,<3300
b       spl bb,<3400
        spl bab,<3500
        spl baab,<3600
        spl baaab,<3700
        jmp p3+2672,<3800
baaab   jmp p3+5340,<3900
baab    spl baabb,<4000
        jmp p4,<4100
baabb   jmp p4+1143,<4200
bab     spl babb,<4300
        spl babab,<4400
        jmp p4+2286,<4500
babab   jmp p4+3429,<4600
babb    spl babbb,<4700
        jmp p4+4572,<4800
babbb   jmp p4+5715,<4900
bb      spl bbb,<5000
        spl bbab,<5100
        spl bbaab,<5200
        jmp p4+6858,<5300
bbaab   jmp p4+1,<5400
bbab    spl bbabb,<5500
        jmp p4+1144,<5600
bbabb   jmp p4+2287,<5700
bbb     spl bbbb,<5800
        spl bbbab,<5900
        jmp p4+3430,<6000
bbbab   jmp p4+4573,<6100
bbbb    spl bbbbb,<6200
        jmp p4+5716,<6300
bbbbb   jmp p4+6859,<6400

end boot
