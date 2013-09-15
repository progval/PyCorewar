;redcode-94
;name Six-Shooter
;author Chris Stubbs
; <chris@stubbs.cjb.net>
;assert 1
org start
frontdat dat 6
frontbomb dat 6
start mov.i backbomb, <backdat
mov.i frontbomb, >frontdat
jmp start
backbomb dat -6
backdat dat -6
