;redcode-94
;name Babbo Natale
;author Maurizio Vittuari
;strategy test based on Taking Names engine
;assert CORESIZE == 8000

step    equ    98
soap    equ     2

for 100-23
        dat.f   0,      0
rof

spl3    stp     #soap,  #0      ;era uno spl    -3
clrptr  dat     last+2
jmp4    jmp     -4,     <-1
bomb    dat     <-2666, <2667   ;{2667
reset   dat     #step-4,#step
spl2    spl     -2,     <1
spl1    spl     -1,     <2
attack  mov     jmp4,   *comp
compptr mov     spl3,   {comp
        mov     spl2,   {comp
        mov     spl1,   {comp
        mov     spl0,   {comp
        sub     reset,  @compptr

scan    add     spl0,   @compptr
comp    sne     2*step, 3*step
        add     spl0,   @compptr
        seq     *comp,  @comp
        slt     #100+step,@compptr
ctr     djn     scan,   #2500
        jmn     attack, -1

spl0    spl.i   #(2*step),#(2*step)
clear   mov     bomb,   >clrptr ;era reset
last    jmp     -1
end     comp
