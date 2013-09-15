;redcode
;name Trident^2 '88
;author John K W
;assert CORESIZE == 8000
;strategy The name comes from 9, or 3^2 imps...
;strategy This might could be optimized a lot... let's see...
;strategy I guess this version is the happy medium. :)

displacement equ (1)
BOOT_DIST equ   (evol+3600)
BOOT    equ     (BOOT_DIST+1716+displacement) ;4148
S       equ     24
DECSTEP equ     1624
istep   equ     889 ;381
impoff  equ     254
COFF    equ     S+5
ADDOFF  equ     31

;************* Trident^2

start
evol
bootme  mov     jclr,   BOOT_DIST+COFF
        mov     jclr,   BOOT_DIST+COFF+2
        mov     pump+3, BOOT+3+ADDOFF

        mov     imp,    BOOT+impoff
        mov     imp,    BOOT+impoff+istep
        mov     imp,    BOOT+impoff+istep*2

spl1    spl     1,      0
        mov     <ptr1,  <dst1
        mov     spl1,   0
        mov     <ptr2,  <dst2
        spl     1,      0
        mov     <ptr1,  <dst1
dst1    spl     @0,     #(BOOT_DIST+8)
        spl     1,      0

dst2    jmp     @0,     #(BOOT+3)

for 69
dat <1, #1
rof

ptr1    dat     <0,     #stone+8
ptr2    dat     <0,     #pump+3

pump    spl     0,      <DECSTEP-displacement
        add     2+ADDOFF,      1
        jmp     impoff-istep*21+1, <DECSTEP-displacement
        dat     #istep, #DECSTEP

imp     mov     0,      2667

stone   spl     0,      2
        spl     0,      <-10
        mov     <-S*11-2, S*11+2
        add     inc,    -1
        djn     -2,     <-1350
        mov     COFF-5,   <COFF+2-5
        jmp     -1,     <-12
inc     dat     #-S,    #S

jclr:   dat     <1,     <-(S+10) 

end start


 

