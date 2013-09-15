;redcode-94
;name     Pattel's Virus
;author   Ben Ford
;strategy p^3: clear / scissor / paper / stone
;assert   CORESIZE == 8000  && MAXLENGTH >= 100

 org think

; **** P-SPACE BRAIN ****

STORE equ 256 ; state storage location

w0 equ dwarf
w1 equ clear
w2 equ scissor
w3 equ paper

think ldp.a #0, in
 ldp.a #STORE, table
 mod.ba *in, table
 stp.b *table, #STORE
    ;          LL         WW         TT
table jmp }0, 226 ; =(22*10)+ 6=(25* 9)+ 1=(20*11)+ 6
;initial state
 dat w0, 650 ; =(65*10)+ 0=(72* 9)+ 2=(59*11)+ 1
 dat w0, 101 ; =(10*10)+ 1=(11* 9)+ 2=( 9*11)+ 2
 dat w1, 886 ; =(88*10)+ 6=(98* 9)+ 4=(80*11)+ 6
 dat w1, 653 ; =(65*10)+ 3=(72* 9)+ 5=(59*11)+ 4
 dat w1, 104 ; =(10*10)+ 4=(11* 9)+ 5=( 9*11)+ 5
 dat w2, 889 ; =(88*10)+ 9=(98* 9)+ 7=(80*11)+ 9
 dat w2, 656 ; =(65*10)+ 6=(72* 9)+ 8=(59*11)+ 7
 dat w2, 107 ; =(10*10)+ 7=(11* 9)+ 8=( 9*11)+ 8
 dat w3, 630 ; =(63*10)+ 0=(70* 9)+ 0=(57*11)+ 3

 dat w0, 226 ; =(22*10)+ 0=(25* 9)+ 1=(20*11)+ 6
;unreachable

in dat 0, 10 ; must have non-zero b-field in the
previous cell
paper spl 2, 9
 spl 2, 11
 spl 1, >-400

; ***** PAPER *****

p1 equ 2333
p2 equ 1737

 spl @0, >p1
 mov }-1, >-1
 mov {-2, <1
 spl @0, >p2
 mov.i #2*p1, }-p1


; ***** CLEAR *****

CDIST   equ     2500

clear mov.ab #clend+3, @kdst
 add     #cstart-2-gate, kdst
 mov cbmb, >kdst
 mov cbmb, >kdst
ksrc spl @kdst, cstart
 mov >ksrc, >kdst
 mov >ksrc, >kdst
 mov >ksrc, >kdst
 mov >ksrc, >kdst
 spl @kdst, cstart
 mov >ksrc, >kdst
 mov >ksrc, >kdst
 mov >ksrc, >kdst
 mov >ksrc, >kdst
kdst div.f #0, think+CDIST+gate-cstart

gate equ (cstart-5)
; dat 0, 0
; dat 0, 0
; dat <-2666, <2667
cbmb dat <-2666, <2667
cstart spl #0, <gate-2666
 mov cbmb, >gate
 mov cbmb, >gate
 djn.f -1, {gate
 spl #0, <gate-2666
 mov cbmb, >gate
 mov cbmb, >gate
clend djn.f -1, {gate

; **** SCISSOR ****

STEP equ 5379
SDIST equ (think+5923+sclr-scan)
sgate equ (scan-2)

scissor mov *sclr, @sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
 mov {sclr, <sptr
sptr mov.ab #5000, @SDIST
 mov {sclr, <sptr
sjmp djn.f @sptr,  sptr

 dat 0, 0
 dat 0, 0

scan add #STEP, #STEP
mv mov sclr, >scan-1
pscan jmz.f scan, @scan
 slt scan, #sclr+1-scan
chg mov.i @pscan, @mv
chk jmn scan, scan
 mov.f dclr, >chk
 djn.f <chg, {chg
dclr dat 381, sclr+1-sgate
sclr spl #0, {0

; ***** DWARF *****

dstep equ 81
dhop equ 5277
dtime equ 1677
dbmb equ (dend+4)

dwarf mov   dend, @dptr
 mov {dwarf, <dptr
 mov {dwarf, <dptr
dptr mov   datb, *5421
 mov {dwarf, <dptr
 mov {dwarf, <dptr
djmp djn.f @ dptr,  dptr

 dat 0, 0

 spl #0, <dhop+2 ; combines with datb to form a gate
dloop mov dbmb, {(dstep*dtime)+1
 mov dbmb, @dloop ; hit by datb to start clear
 sub #dstep, dloop
dend djn.f dloop, <dhop-2
; DAT 0, 0
; DAT 0, 0
; DAT 0, 0
datb dat <dhop+1,>1

end

