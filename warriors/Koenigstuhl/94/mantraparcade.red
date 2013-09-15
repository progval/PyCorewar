;redcode-94 verbose
;name Mantrap Arcade
;author   Dave Hillis
;strategy - pswitcher: 4 components
;assert 1
org think 

STORE equ 156   ; state storage location
w0 equ pboot    ;paper from Nomolos, Ian Oversby
w1 equ dwarf    ;from Patel's Virus, Ben Ford
w2 equ scanb    ;mini Blur from Fire and Ice, David Moore
w3 equ slDodger ;(CLP) from Alladin's cave, P. Kline

;--------
; Paper
;--------

pdist   equ 4000    
dist0   equ 5689
dist1   equ 1021
dist2   equ 3607
range1  equ 4723
range2  equ 6892

pboot   spl.b   1,  <-300
for 6
    mov.i   <pptr,  {pptr
rof
pptr    jmp.b   pdist,  #bomba+1

    mov.i   -pdist+5,   #0
    mov.i   -1, #0
    mov.i   -1, #0
silk    spl.b   @0, <dist0
    mov.i   }-1,    >-1
silk1   spl.b   @0, <dist1
    mov.i   }-1,    >-1
    mov.i   bomba,  }range1
    mov.i   bomba,  >range1
    mov.i   {silk1, <silk2
silk2   jmp.b   @0, <dist2
bomba   dat.f   <2667,  <5334

; ***** DWARF *****
; from Patel's Virus

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

;;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

think   ldp.a #0, in
    ldp.a #STORE, table
    mod.ba *in, table
    stp.b *table, #STORE
table   jmp    }0,  #  430 ;  0: action   3 :  14   5  16
    spl #  w1,  # 1415 ;  1: action   1 :   7   4  11
    spl #  w2,  #  247 ;  2: action   2 :   7   9  13
    spl #  w2,  #  456 ;  3: action   2 :   8  14   6
    spl #  w3,  # 2141 ;  4: action   3 :  13  16  17
    spl #  w1,  #  583 ;  5: action   1 :   7   5   7
    spl #  w2,  #  456 ;  6: action   2 :   8  14   6
    spl #  w1,  # 1144 ;  7: action   1 :   8   5  10
    spl #  w0,  # 1749 ;  8: action   0 :   5  15   3
    spl #  w2,  # 2158 ;  9: action   2 :  14  16  16
    spl #  w0,  # 2373 ; 10: action   0 :   5  10  15
    spl #  w3,  # 1207 ; 11: action   3 :   7   0   1
    spl #  w0,  # 2054 ; 12: action   0 :   6  14   2
    spl #  w1,  #  785 ; 13: action   1 :   1   3  11
    spl #  w2,  # 1238 ; 14: action   2 :   6  14  14
    spl #  w0,  # 1239 ; 15: action   0 :   7  15  15
    spl #  w1,  # 2419 ; 16: action   1 :   3   5   7
    spl #  w2,  # 1006 ; 17: action   2 :  14   3  16

in  spl #  w3,      16 
    spl #   0,      17 
    spl #   0,      18 

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;;;;;;;;;;;;;
;             ;
;  mini Blur  ;
;             ;
;;;;;;;;;;;;;;;

dist equ 2942 ;boot distance
step equ 2891 ;scan pattern; -723 might be better
time equ 2210 ;number of SPLs copied

scanb   mov <boot, <top
     for 8
       mov <boot, <top
     rof
boot   jmp start+dist, top+9

top    mov.b  2, #dist+9
       mov   sp, >top
       add #step, #-step*time
start  jmz.f -2, @-1
       jmn  top, *top
sp     spl   0, 0
       mov    2, >top-3
       djn.f -1, >top-3
       dat    0,  5-top
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

slDodger  mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -3,#6
btDodger  jmp    pescape+300,pescape+1
                                    ; code from "Curious Little Program"
                                    ; after "Cowboy"
pescape   equ    (pb+1)
plen      equ    (pescape-p1)
pstep     equ    (5093)
p1        mov    pb       ,@pfence  ; build fences
          mov    pb       ,*pfence
ploop     add    pincr    ,psnare   ; snare opponent
          mov    psnare   ,@psnare
pfence    sne    pb-56    ,pb+26    ; monitor fences
          djn.f  ploop    ,>p1-pstep
pmove     add    preset   ,psnare   ; adjust snare for new base
          mov    pb       ,pescape  ; set copy pointers
pcopy     mov    >pescape ,}pescape ; make copy
          jmn.b  -1       ,pescape  ;
preset    jmp    p1+pstep ,-p1-pstep; jump to new location
psnare    jmp    ptrap-2000,+2000
ptrap     mod.x  #10      ,#1       ; allow only one process
          stp.ab #0       ,#0       ; complete brainwash
          ;nop.ab #0       ,#0       ; complete brainwash
          djn.b  -1       ,-1
pincr     mov    1        ,-1       ; opponent dies
pb        dat    pstep+p1-pescape,-plen

end 

