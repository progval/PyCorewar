;redcode
;name Vagabond
;author P.Kline
;strategy stone & replicator ala 'Smooth Noodle Map'
;strategy using multi-process imp-killing paper and back-up core-clear
;strategy with some decent anti-vamp and a 'mov 0,2667' decoy
; boot a paper into core
; boot the stone into core
; after so many loops through stone, start paper and anti-vamp launcher
;assert 1

step    equ 239
sboot   equ (-2100+2)
pxw     equ (pxav-100)

start   mov <copysf,<copyst
        mov <copypf,<copypt
        mov inc,stone-step-step-1+sboot
        mov <copypf,<copypt
        mov <copysf,<copyst
        mov <copysf,<copyst
        mov <copypf,<copypt
        mov <copysf,<copyst
        mov <copysf,<copyst
        mov <copypf,<copypt
        mov <copypf,<copypt
        mov <copysf,<copyst
        mov <copysf,<copyst
        mov <copypf,<copypt
        mov <copysf,<copyst
        mov <copysf,<copyst
        mov <copypf,<copypt
        jmp @copyst
 
inc      mov step,<-step         ; gets dropped on 'stone' for core-clear
                                 ; after one add, it bombs itself so further
                                 ; adds don't mess up the core-clear
st       spl 0,stone-step-step
stinc    add stone-step-step-1,stone
stone    mov <st-(600*step),(600*step) ; after 600 loops, start core-clear
cnt      djn -2,#250             ; countdown to paper
pl       spl 1                   ; generate 7 processes
         spl 1
         mov -1,0
         spl p1s-sboot+4000-1    ; start paper
         jmp px-sboot            ; start antivamp launcher
copysf   dat #0

p1s      mov p1b,<100            ; anti-imp bombing
p1a      mov #7,p1s              ; 7-process paper
         mov <p1s,<p1n           ; create child
p1n      spl @p1n,<-1333         ; start child while decrementing
         mov p1b,<p1n            ; anti-imp bombing
         jmz @0,@p1a             ; if i'm ok, go again
p1b      dat <2667,<5334
copypf   dat #0
copypt   dat #copypf+4000-1
copyst   dat #copysf+sboot
         dat #0
        
px      mov #0,pxf            ; antivamp launcher
        mov <pxf,<pxn         ; make a copy and start him
pxn     spl @0,1289+40
        add #889/7+269,pxn
        jmp px
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
        dat #1
                             ; antivamp bomber
        add <pxw,pxav        ; add 7 cons. locations to p2av
        mov #pxw-pxav,pxav   ; reset p2av's b-operand to p2w
pxav    mov #0,pxw           ; extract the a-operand (the pit location)
        spl 0,<pxw+2667      
        mov pxb,<pxw         ; bomb from that offset
pxb     dat <2667,<5334
        dat <2667,<5334
pxf     dat #0
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        mov 0,2667
        end start
