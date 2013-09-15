;redcode-94x verbose
;name  Blue Funk
;author Steven Morrell
;contact morrell@math.utah.edu
;strategy  Stone like Emerald without the in-memory/in-register problem
;strategy  Imp added for fun
;assert CORESIZE==55440
;macro

step equ -12988

for 149 ;decoy
         dat <imp,<34117
rof

emerald   SPL #-step,<step
stone     MOV >-step,step-1
          ADD emerald,stone
cnt       DJN.f  stone,<emerald-50

boot spl @0,-200
     mov emerald,>boot
     mov emerald+1,>boot
     mov emerald+2,>boot
     mov emerald+3,>boot
     spl b
     spl ab
     spl aab
     spl aaab
bbab spl imp2
imp1 jmp >0,imp
bbb  spl bbbb
aaab spl imp4
imp3 jmp >0,imp+12794
aab  spl aabb
bbbb spl imp6
imp5 jmp >0,imp+25588
aabb spl imp8
imp7 jmp >0,imp+38382
ab   spl abb
     spl abab
     spl impA
imp9 jmp >0,imp+51176
abab spl impC
impB jmp >0,imp+8530
abb  spl abbb
     spl imp1
impD jmp >0,imp+21324
abbb spl imp3
imp2 jmp >0,imp+34117
b    spl bb
     spl bab
     spl baab
     spl imp5
imp4 jmp >0,imp+46911
baab spl imp7
imp6 jmp >0,imp+4265
bab  spl babb
     spl imp9
imp8 jmp >0,imp+17059
babb spl impB
impA jmp >0,imp+29853
bb   spl bbb
     spl bbab
     spl impD
impC jmp >0,imp+42647


imp  mov.i #3044,34117

end boot
