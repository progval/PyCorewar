;redcode-94
;name The Marsupial Lion
;author Christian Schmidt
;strategy Claw without a qscanner
;assert 1

sStep	  equ    2987
sDist     equ    12
sStart    equ    (sScan+(sStep*10))
tDecoy    equ    (sScan-1195)

          sub    sAdd,     sScan
sScan	  seq    sStart,   sStart+sDist
	  slt.ab #40,      sScan
sBack	  djn    -3,       #1700
sLen	  mov    #8,       #0
	  mov    sScan,    sScan-3
	  mov    sBomb,    }sScan-3
	  mov    sBomb,    >sScan-3
	  djn    -2,       sLen
	  jmn.b  sBack,    sBack
	  add.a  #(8001/21)+1,cBomb
	  mov    @-1,      {cBomb
	  jmp     -2,      0
cBomb	  spl    #1,       #4
sAdd	  dat    -sStep,   -sStep
sBomb	  spl    -1,       0

for 30
        dat    0,        0
rof

tStart  mov    <tDecoy+0,{tDecoy+2
        mov    <tDecoy+3,{tDecoy+5
        mov    <tDecoy+6,{tDecoy+8
        jmp    sScan  ,  <tDecoy+10

end tStart

