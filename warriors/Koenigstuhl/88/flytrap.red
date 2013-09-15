;redcode
;name MARS FLYTRAP
;author Jon Blow
;blojo@soda.berkeley.edu
;assert 1
;;; MARS FLYTRAP
;;;
;;; Performs somewhat well against MICE.
;;; Makes pretty patterns versus CHANG1.
;;;
;;;   - blojo@soda.berkeley.edu


safety  equ 64                  ; So we don't hit ourselves
step    equ 16                  ; Distance between bomb targets
jumpd   equ 813                 ; How far we jump per step
len     equ (last - index)      ; Length of the necessary program

start   sub jmpmsk, delta
        jmp loop
jmpmsk  jmp 0
bomb    jmp maw                 ; This is the expendable part of the flytrap,
target  dat #-1                 ; which we do not need to copy, and so we
index   dat #0                  ; don't.

delta   jmp 16
orgjmp  jmp maw-bomb            ; dist. from BOMB to MAW
        mov #-1, target         ; must be = to target's initial value
        mov orgjmp, bomb
loop    sub #step, target
        add delta, bomb
        mov bomb, @target
	slt #safety, target
        jmp loop
        mov #len, index
        mov #-jumpd, target
cploop  mov @index, <target
        djn cploop, index
        add #2, target
        mov #0, (jumpd + len +2) * 5 + 2
        jmp @target
maw     spl 0
last    jmp maw

        end start
