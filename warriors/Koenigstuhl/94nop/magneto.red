;redcode-94nop
;name Magneto
;author Roy van Rijn
;strategy Slightly changed oneshot from R4 (witch was a great succes!)
;strategy And the name is like the scheme suggested ;-)
;assert 1

sOff    equ     (21*sStep-1)
sStep   equ     10
sDelet  equ     205
gate1   equ     (gate-5)

sPtr    spl     {sOff,       >3910+sOff-sDelet
for 3
	dat 0,0
rof
	dat     -5,   100
gate    dat     -5,   jump-gate1+5
        spl     #-5,  jump-gate1+5
sOne    mul.f   #3,    sPtr
        sne.i   *sPtr, @sPtr
        djn.f   sOne,  >sPtr
sBomb   spl     #-10,#10
        mov     @jump,>gate1
        mov     @jump,}gate1
jump    djn     sBomb+1,{gate+1

for 17
dat 0, 0
rof

tDecoy    equ    (-1310)
tStart    mov    <tDecoy+0,{tDecoy+2
          mov    <tDecoy+3,{tDecoy+5
          mov    <tDecoy+6,{tDecoy+8
          djn.f  sOne+1  ,<tDecoy+10
end tStart

