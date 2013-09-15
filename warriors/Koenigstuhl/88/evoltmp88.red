;redcode
;name Evoltmp 88
;author John K W
;assert CORESIZE == 8000
;strategy Hmmm... let's see... I could submit a one shot scanner...
;strategy Or maybe a b-scanner like b++?  Or I could submit something
;strategy similar to Pergament... oh wait, I've got an idea!  How
;strategy about an imp/stone??! ;-)
;strategy Not exactly evoltmp... but, uh, you get the idea.

;I translated the Impfinity boot to the '88 code
;language, and then added a juliet-storm-ish stone.
;End game is a pretty good gate, which should(?) beat
;most any other imp/stone...
;
;Beats Pacman, stasis, irongate, blue funk, cannonade,
;emerald5... and everything on KOTH's 88 Hill except for
;Gisela 3G6 and K-test...  Also beats just about every
;non-paper I've got except for Sphinx.29.  That warrior
;has a superior gate to mine... which gets me in trouble.
;The only general warrior class which could really kill this
;would be an anti-imp paper...  But seeing as most people
;seem jaded on the easy of creating a modern silk, I VERY
;seriously doubt I'll be up against a paper.
;
;All in all, I've got more confidence of a win in this
;round than I have in the last two...

BOOT_DIST equ (bootme+3625)
COFF    equ     10
S       equ     24

jclrp   dat     <2667,  <-(COFF+10)
jclr    dat     <2667,  <-11
impinc  dat     #istep+1, #1

bootme  mov     jclr,   BOOT_DIST+COFF+2-5
        mov     jclrp,   BOOT_DIST+COFF+2+2-5

        mov     instr, impoff
        mov     impinc,impoff-10

j FOR 4
        mov     <psrc, <pdst
ROF

for 8
        mov     <pptr1,  <pptr2
rof

        spl     @pdst, <-500-15-1*2
        jmp     @pptr2

for 62/4
spl 0, @1
spl 0, #1
spl 0, <1
spl 0, #1
rof
spl 0, <1
spl 0, #1

psrc    dat     #0,     #pend
pdst    dat     #0,     #pmpof+pend-pump

istep   equ     2667 ;1143
impoff  equ     (BOOT_DIST+S*3+104)
point   equ     (pump-pmpof+impoff)
pmpof   equ     (impoff-100)

pump    spl     0,      0
        add     point-10, ptr
prime   mov     point,  @1
ptr     jmp     pump-pmpof+impoff-(istep+1)*2, point-1

pend
instr   mov     0,      istep

pptr1   dat     #0,     #inc+1
pptr2   dat     #0,     #BOOT_DIST

stone
        spl     0,      2
        spl     0,      <-10
        mov     <-S*10-2, S*10+2
        add     inc,    -1
        djn     -2,     <-1350
        mov     COFF,   <COFF+2
        jmp     -1,     <-12
inc     dat     #-S,    #S

end bootme
