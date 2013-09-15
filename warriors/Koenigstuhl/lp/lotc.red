;redcode-lp
;name Lord of the Core
;author Christian Schmidt
;strategy p-switching:
;strategy - The 8 Kings *light*
;strategy - Viper's Bugloss
;strategy - Muffineer
;strategy - Eve 15
;assert 1

;########################   17 instr.

STEP  equ    5266
INIT  equ    (sbmb+STEP)
sdat  equ    (sptr-1)
sAwa  equ     3290

sptr  jmp     #STEP,     #INIT
sadd  add.ab  {0,        }0
scanx  jmz.f   sadd,      @sptr
sbmb  mov     @0,        @sptr
schk  jmz.a   sadd,      sbmb
      spl     #0,	       0
      mov     sdat,      <schk

for 10
dat 0, 0
rof

sgat  dat     sptr,      sptr+sAwa
sGo   mov     }sgat,     >sgat
for 6
      mov     }sgat,     >sgat
rof
      spl     scanx+sAwa
      jmp     scanx


;########################   7 instr.

iAwa equ    4174
train equ    7903

pGo  mov.i  imp,  *2
     spl    imp
     spl    iAwa
     djn.a  #0,  <train
     djn.f  #0,  <train
     jmp.ba #0,  <train
imp  mov.i  #-1,  1

for 82
dat 0, 0
rof

;########################   16 instr.

mStep1  equ   5229
mStep2  equ   3704
mAdd	  equ   963
mOff	  equ   (mHit+mAdd)

mRef    mov    #9,      #9
mGo     mov    <mRef,   <mBck
mPtr    mov    <mAdd,   }mOff
        add.ab {0,      }0
mHit    mov    mBmb,    @mPtr
        jmn    mGo,     mRef
        spl    @mRef,   <mStep2
mBck    jmz    @0,      mStep1
mBmb    dat    }7506,   >7279

;########################   12 instr.

dAwa1   equ     5896
dAwa2   equ     7075
dAwa3   equ     4047
dStep   equ     2081
dOff    equ     2550
dDist   equ     2812

dGo     spl     1,              0
        mov.i   {0,             #0
        mov     <dBoot1,        {dBoot1
        mov     <dBoot2,        {dBoot2
        mov     <dBoot3,        {dBoot3
        jmp     *dBoot1,        }0

dBoot1  dat     dGo+dAwa1+dDist,      dDwarf+3
dBoot2  dat     dGo+dAwa2+dDist,      dDwarf+3
dBoot3  dat     dGo+dAwa3+dDist,      dDwarf+3

dDwarf  mov     {dOff,          1-dStep
        sub.x   #dStep,         dDwarf
        jmp     dDwarf,         }dDwarf

;########################   25 instr.
STORE equ    301
w0    equ    dGo       ;The 8 Kings
w1    equ    sGo       ;Viper's Bugloss
w2    equ    mGo       ;Mufeenier
w3    equ    pGo       ;Eve15

think ldp.a #0, in
 ldp.a #STORE, table
 mod.ba *in, table
 stp.b *table, #STORE

table jmp }0, 226
 dat w0, 650
 dat w0, 101
 dat w1, 886
 dat w1, 653
 dat w1, 104
 dat w2, 889
 dat w2, 656
 dat w2, 107
 dat w3, 630

 dat w0, 226 

in dat 0, 10 
 spl 2, 9
 spl 2, 11

      end  think

