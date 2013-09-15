;redcode-b verbose
;name     Light Sprain
;author   Dave Hillis
;strategy - p^3: 4 components
;strategy - This warrior was written to experiment with some 
;strategy - ideas for writing p-space warriors. The components 
;strategy - are pure copies taken from published warriors and,
;strategy - regretably, I don't remember who the original authors
;strategy - are. "Self Modifying Code" by Ben Ford was one source ...

;assert (CORESIZE == 8000)  && (MAXLENGTH >= 100)

 org think

; **** P-SPACE BRAIN ****

STORE equ 456 ; state storage location

;w0 equ dwarf
;w1 equ clear
;w2 equ scissor
;w3 equ paper

w0 equ silk
w2 equ sboot;w2
w7 equ scissor;w7
w5 equ dwarf;5

think ldp.a #0, in
 ldp.a #STORE, table
 mod.ba *in, table
 stp.b *table, #STORE
    ;          LL         WW         TT
table   jmp    }0,  # 1061 ;  0: action   2 :   8  11  11
        spl #  w2,  # 2212 ;  1: action   2 :   2   0   7
        spl #  w2,  #  450 ;  2: action   2 :   8   2   0
        spl #  w5,  # 2583 ;  3: action   5 :   9   7   3
        spl #  w2,  # 1353 ;  4: action   2 :   1   9   3
        spl #  w5,  # 2285 ;  5: action   5 :  10   3   5
        spl #  w2,  # 2092 ;  6: action   2 :  12   6   7
        spl #  w5,  #    7 ;  7: action   5 :   7   7   7
        spl #  w0,  #  932 ;  8: action   0 :   9   8   2
        spl #  w0,  # 1058 ;  9: action   0 :   5   8   8
        spl #  w7,  #  220 ; 10: action   7 :  12  10  10
        spl #  w2,  # 1482 ; 11: action   2 :   0  12  12
        spl #  w7,  # 1480 ; 12: action   7 :  11  10  10
        spl #  w0,  #  107 ; 13: action   0 :   3   9   2
        spl #  w2,  #  947 ; 14: action   2 :  11   9   2


in      spl    #w2          , 13       ; must have non-zero b-field in
        spl    #0           , 14       ;  the previous cell
        dat    0            , 15


; ***** PAPER *****

d1      equ     4496    ; 4496  771 2333 4195
d2      equ     1283    ; 1283  748 1737 6234

silk    spl     2,      <-1500
        spl     1,      <-1608
        spl     1,      <-1716

slk0    spl     @   0,  <  d1
        mov     }slk0,  >slk0
        mov      sdat,  }3307
        mov     {slk0,  <slk1
slk1    djn.f   @   0,  <  d2
sdat    dat     $   1,  $   1

; ***** SCAN *****

boot    equ     1430    ; boot distance
sboot   mov     <last,  {last
for     8
        mov     <last,  {last
rof

last    djn.f    boot,  #scan1+9

sinc    equ     5393    ; 5397 5393
slen    equ     (sbmb-scan1 + 3)

scan1    jmz.f    sjmp1,   5000
smov    mov      sbmb,  >scan1
sadd    add     #sinc,  #sinc
sjmp1    jmz.f    smov,  @sadd
        slt.b    sadd,  #slen
        mov.b    sadd,   scan1
        jmn      smov,   sadd
        jmp      smov,  }smov
sbmb    spl     #   0,  {   0

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
