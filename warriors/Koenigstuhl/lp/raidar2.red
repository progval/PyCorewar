;redcode-94lp
;name Raidar II
;author Unknown :-)
;assert 1

len equ (last-first)
paway equ 185
jaway equ 523
pwide equ 28
pval  equ 42
pdis1 equ first-paway-targ1
pdis2 equ last+paway-targ1
jdis1 equ first-jaway-targ1
jdis2 equ last+jaway-targ1

first   mov   #pwide, #pwide    ; {}   setup pickets
        mov.f ppos,   targ1
uploop  mov   pbomb,  >targ1
        mov   pbomb,  {targ1
        djn   @u,     @f        ; <>{}

scan    mov.ab @f,    @f        ; <>{} check pickets
        mov.f ppos,   @uploop   ; <>
scango  mov   *uploop,>pdis2+200
        sne   >targ1, {targ1
        djn   scango, first
f       jmz   scan,   first

panic   mov   #len,   first
        mov.a #jdis2, @uploop   ; <>{}
u       sne   <targ1, *uploop   ; >
        mov.a #jdis1, @uploop   ; <>{}
pan     mov   <first, {targ1
        jmn   pan,    @f        ; <>
targ1   jmp   pdis1,  <pdis2
ppos    dat   pdis1,  pdis2     ; <>{}
pbomb   dat   1,      1         ; <>{}
last    dat  19,19
end     uploop

