;redcode
;name cute
;author John K. Lewis
;strategy pcode best non-pcode code.
;strategy thanks to Ian Sutton, Ian Oversby, and Franz for code.  :)
;assert 1


stscan  equ     (hit1-step*500)
step    equ     15      ;\ these MUST be the same or the one shot will be out
qbstep  equ     15      ;/ of sync and we will scan ourself too quickly after
                        ;  booting.


org prev

plc     equ     253             ; for the P-Space table


;;------------------------------------------------------------

prev    LDP.AB  #0,     #0      ; Results from previous round
        LDP.A   #plc,   table
        SNE.AB  #0,     prev    ; Did we lose?
        ADD.A   #1,     table
        SNE.AB  #2,     prev    ; Was it a draw?
        MOV.A   #0,     table
        MOD.A   #3,     table
        STP.AB  table,  #plc

table   JMP.B   @0,     bscan ; Run this on draw
        DAT.F   $0,     boot
        DAT.F   $0,     boot
bscan   mov }bpoint,>bpoint
        mov }bpoint,>bpoint
        djn -2,#8
        jmp scanner+4001
bpoint  dat		1,4000
ptr     dat     stscan+step, stscan
        dat     0,0
hit1    dat     0,0
        dat     #-85, 16
        dat     #-85, 16
bombs   spl     #-85, 16
        dat     0,0
nxt     add     incr, ptr
scanner sne     *ptr, @ptr
        jmp     nxt
        sub     #14, ptr
incr    spl     #step*2, >step*2
cc      mov     @dj, >ptr
        mov     @dj, >ptr
dj      djn.b   cc, {bombs
        dat     0,0
        dat     0,0
hit2    dat     0,0

fcp EQU 3039
scp EQU 2365
tcp EQU 777
len EQU 9

boot
        spl 1,<-3000  ;letz get 9 processes together
        mov -1,0
        mov -1,0
        mov -1,0

        spl     @frog,  >-1000 ;lets boot the silk way
        mov     }-1,    >frog  ;
        dat     >-300,  <300   ;now die ... boot process die ...


frog    spl     @0,     <fcp-len
        mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     2,      <-1
        jmp     -1,     <-10
        dat     <2667,  <2667*2

end
