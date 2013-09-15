;redcode
;name Triac
;author Planar
;strategy p-switcher for round 4 of the Maniacs Tournament
;assert CORESIZE == 8000


HSAboot equ     start+2500
Carboot equ     start-2500


history equ     35
strat   equ     40
ptable  equ     3*81


        org     start

        jmp     won, 0
table:  jmp     lost, 0
        jmp     won, 0
        jmp     tied, 0

start:  ldp.ab  #0, table
hist:   ldp.ab  #history, #0
str:    ldp.ab  #strat, #0

        jmp     @table

lost:   ldp.b   hist, #0
        add.ab  #1, lost
burn:   stp.b   lost, hist
        jmp     won

tied:   ldp.b   hist, #0
        add.ab  #2, tied
        stp.b   tied, hist

won:    mul.ab  #9, hist
        mul.ab  #3, str
        add.b   str, hist
        add.b   table, hist
        mod.ab  #81, hist
        add.ab  #ptable, hist
        stp.b   hist, #history
        ldp.ba  hist, disp
        mod.a   #3, disp
        stp.ab  disp, #strat
disp:   jmp     @0, paper
        dat     1,  btCarb
        dat     1,  btHSA


;; Boot and launch HSA

btHSA   mov.i   btm, HSAboot
i FOR 9
        mov.i   {btHSA, <btHSA
ROF
        jmp     HSAboot+kill-btm

;; [Mini He Scans Alone]

step EQU 9
ptr EQU (bomb-5)

bomb: spl    #1,{1
kill: mov    bomb,<ptr              ; starting point
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #step+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill


decoy:
i FOR 13
        spl     #1, 1
        stp.b   >0, #1
ROF
        

;; Boot and launch Carbonite

btCarb  mov.i   dbomb+4, Carboot
i FOR 4
        mov.i   {btCarb, <btCarb
ROF
        jmp     Carboot-3

;; [Carbonite]

startCarb equ startC

dbomb	dat	>-1, >1
startC	spl	#0, <-100           ; starting point
	mov	dbomb, tar-197*3500
tar	add	#197, -1		; gets bombed to start coreclear
	djn.f	-2, <-1151



;; deactivate decoy and launch TimeScape
paper:  mov.i   #decoy, }0
        djn.b   paper, #26
erase:  mov.i   #burn, }0
        djn.b   erase, #disp-burn

;; [Timescape (1.0)]

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

        spl     1,              <-200       ; starting point
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

end
