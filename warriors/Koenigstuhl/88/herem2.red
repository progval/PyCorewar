;redcode
;name Herem II
;author Anders Ivner
;assert CORESIZE==8000

step    equ     2376

boot    mov     <spt,           <dpt
        mov     <spt,           <dpt
        mov     <spt,           <dpt
        mov     <spt,           <dpt
        mov     <spt,           <dpt
        mov     <spt,           <dpt

        mov     const,          const+4008
        mov     glue,           glue+4012
        mov     gate,           gate+4016

spt     jmp     @dpt,           const
dpt     dat             #const+4000


start   add     const+8,        pt
        mov     glue+12,        @pt
pt      mov     <4003,          @1
        djn     start,          <-100
        mov     gate+16,        <-10
        jmp     -2

const   dat     #step,          #step
glue    spl     0,              <-20
gate    dat     <-22,           <-21

        dat             #1
        dat             #1

        for     MAXLENGTH-CURLINE
        dat             #1
        rof

        end     boot
