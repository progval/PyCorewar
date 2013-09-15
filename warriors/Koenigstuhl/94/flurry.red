;redcode-94
;name Flurry
;author Anton Marsden
;strategy QS -> Barrage | CIA
;assert CORESIZE==8000

ORG start

STEP  equ   3119
A  equ   (c-1)
SPYOFF   equ   STEP*1400

eye   equ   (A-SPYOFF)
spy   equ   (A+SPYOFF)

gate: 
spy0: dat.f  >-SPYOFF,>-SPYOFF
      dat.f  $-1,$15
cb    spl.ab #-2,$15
      dat.f  $0,$0
      dat.f  $0,$0
s     spl.a  #spy0,>4000
loop  add.f  $c,@2
ip    mov.i  @1,@spy
      mov.i  @0,*spy
      jmz.b  $loop,$eye
c     spl.b  #STEP,>-STEP
      mov.i  @2,>gate
      mov.i  @1,>gate
b0    djn.b  $c+1,{cb

FOR 19
      dat.f  $0,$0
ROF

start:       
q FOR 4
      sne.i  $s+400*q,$s+400*q+100
      seq.i  $s+400*q+200,$s+400*q+300
      mov.ab #s+400*q-f,$f
ROF
      jmn.b  @0,$f

q FOR 4
      sne.i  $s+400*(q+8),$s+400*(q+8)+100
      seq.i  $s+400*(q+8)+200,$s+400*(q+8)+300
      mov.ab #s+400*(q+8)-f,$f
ROF
      jmn.b  @0,$f

q FOR 4
      sne.i  $s+400*(q+4),$s+400*(q+4)+100
      seq.i  $s+400*(q+4)+200,$s+400*(q+4)+300
      mov.ab #s+400*(q+4)-f-100,$f
ROF
      
      jmz.b  $sw,$f       
      add.ab #100,$f        
f:    sne.i  $d,$0
      djn.b  $-2,#4
      mov.i  $b,@f
      mov.ba @1,$f
      add.f  $inc,$f
      mov.i  *1,@f
      mov.i  $b,*f
      djn.b  $-3,#12

ptr:  spl.a  *1,>2*2667
      mov.i  *s,$spy
      mov.i  $1,$-1
b:
inc:  dat.f  >8,>-8

sw:   ldp.ab #0,#0
      jmz.f  $ptr,<sw

ASTEP EQU 3510; mod-10
BSTEP EQU 2365; mod-5
CSTEP EQU 3315; mod-5

p:    spl.b  $1,>2000
      spl.b  $1,>4000
      spl.b  $1,>6000

s1:   spl.b  @s1,}ASTEP
      mov.i  }s1,>s1
s2:   spl.b  @s2,}BSTEP
      mov.i  }s2,>s2
      mov.i  {s2,<s3
s3:   jmp.b  @s3,>CSTEP
      dat.f  >1,}1
      dat.f  }1,>1
      stp.b  >0,#1
jump: jmp.b  $-1,$1
d:
END

