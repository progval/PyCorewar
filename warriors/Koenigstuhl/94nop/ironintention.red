;redcode-94nop
;name Iron Intention
;author Christian Schmidt
;strategy cooperative paper/imp
;strategy which boosts an unbooted stone
;strategy added a Q^3 for some extra points
;assert 1

;------stone constants

uStp   equ    703
uTim   equ    1183

;------paper constants

pStep1 equ    (217*proc)
pStep2 equ    2344
pStep3 equ    335
proc   equ    9
iStep  equ    2667

;------uninvited's unbooted stone 

stone  spl    #0,       #0
uLp:   mov    uBmb,     @uPtr
uHit:  sub.x  #uStp*2,  @uLp
uPtr:  mov    {3582,    }uHit+2*uStp*uTim
       djn.f  @uHit,    }uPtr
uBmb:  dat    <uStp,    >1+6

for 9
       dat    0,        0
rof

;------cooperative paper/imp

pGo    spl    2
       spl    2
       spl    1
       mov    -1, 0

silk1  spl    @0,           <pStep1
       mov    }-1,          >-1
       sub.a  #(pStep1/proc),imp+pStep1
       spl    *imp,         <-325
silk2  spl    @0,           <pStep2
       mov    }-1,          >-1
silk3  spl    @0,           <iStep+1
       mov    }-1,          >-1
imp    mov.i  #stone,       iStep

for 30
dat 0, 0
rof

;------quickscanner (Q^3)

org qGo

qf 	 equ qKil
qs     equ 200
qd 	 equ 4000
qi     equ 14
qr     equ 8

qBmb	dat    {qi*qr-10, {1
qGo  	seq    qd+qf+qs, qf+qs
     	jmp    qSki, {qd+qf+qs+qi+2
     	sne    qd+qf+5*qs, qf+5*qs
     	seq    qf+4*qs, {qTab
	jmp    qFas, }qTab
     	sne    qd+qf+8*qs, qf+8*qs
     	seq    qf+7*qs, {qTab-1
     	jmp    qFas, {qFas
	sne    qd+qf+10*qs, qf+10*qs
     	seq    qf+9*qs, {qTab+1
	jmp    qFas, }qFas
	seq    qd+qf+2*qs, qf+2*qs
	jmp    qFas, {qTab
	seq    qd+qf+6*qs, qf+6*qs
	djn.a  qFas, {qFas
	seq    qd+qf+3*qs, qf+3*qs
      jmp    qFas, {qd+qf+3*qs+qi+2
	sne    qd+qf+14*qs, qf+14*qs
	seq    qf+13*qs, <qTab
	jmp    qSlo, >qTab
	sne    qd+qf+17*qs, qf+17*qs
	seq    qf+16*qs, <qTab-1
	jmp    qSlo, {qSlo
	seq    qd+qf+11*qs, qf+11*qs
	jmp    qSlo, <qTab
	seq    qd+qf+15*qs, qf+15*qs
	djn.b  qSlo, {qSlo
	sne    qd+qf+12*qs, qf+12*qs
	jmz    pGo, qd+qf+12*qs-qi

qSlo  mov.ba qTab,   qTab
qFas  mul.ab qTab,   qKil
qSki  sne    qBmb-1, @qKil
      add    #qd,    qKil
qLoo  mov.i  qBmb,   @qKil
qKil  mov.i  qBmb,   *qs
      sub.ab #qi,    qKil
      djn    qLoo,   #qr
      jmp    pGo,    <-4000
      dat    5408,   7217
qTab  dat    4804,   6613
dSrc  dat    5810,   qBmb-5

end

