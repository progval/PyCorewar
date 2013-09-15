;redcode
;name Mini-Raidar
;author unknown :-)
;strategy smaller faster decrement resistant
;assert 1

len equ (last-first)
paway equ 185
jaway equ 400
pwide equ 33
pval  equ 42
pdis1 equ first-paway-targ1
pdis2 equ last+paway-targ2+pwide
jdis1 equ first-jaway-targ1
jdis2 equ last+jaway-targ1

targ1   dat #pdis1
targ2   dat #pdis2
dst     dat #pwide
first   mov #pwide, @scan   ; <
        mov #pdis2, @scango ; <
        mov #pdis1, targ1
uploop  mov pbomb,  <targ1
        mov pbomb,  <targ2
        djn uploop, dst
scan    mov #pwide, dst
        mov #pdis1, @uploop ; <
        mov #pdis2, targ2
scango  cmp <targ1, <targ2
        jmp panic,  0       ; <
        djn scango, @scan   ; <
        jmp scan,   0       ; <
panic   mov #len,   @scan   ; <
        mov #jdis1, @uploop ; <
        cmp @targ2, pbomb
        mov #jdis2, @uploop ; <
pan     mov @dst,   <targ1
        djn pan,    @scan   ; <
        jmp @targ1, 0       ; <
pbomb   dat #pval
last    end uploop

