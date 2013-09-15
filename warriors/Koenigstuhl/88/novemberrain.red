;redcode
;name Cold as November Rain...
;author John Metcalf
;strategy scanner
;assert CORESIZE==8000

        bdist equ (adj-1398)
        step equ (-70)
        dist equ 5

        mov 3,         @2       ; reflection

        dat #(boot*3039), #1
        dat #(boot*3039), #1
        dat #(boot*3039), #1

adj     mov #1,        lptr
lptr    mov scan,      @loop
        mov sbmb,      <ptr
loop    sub inc,       scan
scan    cmp dist-step, -step
        jmn adj,       scan
        jmn @lptr,     @-1
sbmb    spl 0,         <clr+step
clr     mov inc,       <-2
        djn clr,       <-3753
inc     dat <step,     <step
        ptr equ inc+1

        jmn @-5,       @-1      ; reflection

boot    mov inc,       bdist+10
brep    mov <from,     <boot
        mov <from,     <boot
        mov <from,     <boot
        mov <from,     <boot
        mov <from,     <boot
        djn brep,      #2
from    jmp bdist+4,   inc

        dat #(boot*3039), #1
        mov <3,        <-4      ; reflection
        z for 7
        spl last-z*2,  @1
        spl last-z*3,  #1
        spl last-z*4,  <1
        spl last-z*5,  @1
        spl -z,         1
        spl last-z*6,  #1
        spl last-z*7,  <1
        spl last-z*8,  @1
        spl last-z*9,  #1
        spl -z,         1
        rof
last    spl -22,       <1
        spl -33,       @1
        spl -44,       #1
        spl -55,        1
        end boot

