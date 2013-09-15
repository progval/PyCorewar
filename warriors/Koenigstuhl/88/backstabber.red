;redcode
;name Backstabber
;author Anders Ivner
;strategy Brief scanner.
;contact d91andiv@und.ida.liu.se
;assert 1

; Oh well, I don't know. I guess this one has as much chance as anything
; else.

dist    equ     19
step    equ     3094

start   add     const,          scan
scan    cmp     -dist,          0
        slt     #20+dist,      scan
        jmp     start

        mov     #19+dist,       cnt
        mov     scan,           @loop
loop    mov     glue,           <scan+11
cnt     djn     loop,           #0
        djn     start,          #20             ;how many times?

        spl     0,              <-3
clr2    mov     gate,           <-2
        jmp     -1,             <-5
        dat             #0
gate    dat     <-4,            <-5
const   dat     #step,          #step
glue    spl     -1,             1

        end     start
