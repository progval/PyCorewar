;redcode-94
;name Barrage
;author Anton Marsden
;strategy QS -> Brainwashing paper
;assert CORESIZE==8000
 
ORG s
 
data EQU (s-1)
 
s:       
q FOR 4
      sne.i  $s+400*q,$s+400*q+100
      seq.i  $s+400*q+200,$s+400*q+300
      mov.ab #s+400*q-f,$f
ROF
      jmn.b  $w,$f
 
q FOR 4
      sne.i  $s+400*(q+8),$s+400*(q+8)+100
      seq.i  $s+400*(q+8)+200,$s+400*(q+8)+300
      mov.ab #s+400*(q+8)-f,$f
ROF
      jmn.b  $w,$f
 
q FOR 4
      sne.i  $s+400*(q+4),$s+400*(q+4)+100
      seq.i  $s+400*(q+4)+200,$s+400*(q+4)+300
      mov.ab #s+400*(q+4)-f-100,$f
ROF
 
f:    jmz.b  $p,#0       
      add.ab #100,$-1        
w:    sne.i  $data,@f
      djn.b  $-2,#4
      mov.i  $bomb,@f
      mov.ba @0,$f
      
      add.f  $inc,$f
      mov.i  $bomb,@f
      mov.i  $bomb,*f
      djn.b  $-3,#20
      jmp.b  $p,>1600
inc:  dat.f  $-5,$5
 
      dat.f  #0,#0
      stp.b  >0,#0
      dat.f  #0,@0
      dat.f  #0,*0
      dat.f  #0,}0
      dat.f  #0,{0
      dat.f  #0,<0
      dat.f  #0,>0
 
      dat.f  $0,@0
      dat.f  $0,*0
      stp.b  <0,#0
      dat.f  $0,{0
      dat.f  $0,<0
      dat.f  $0,>0
 
      dat.f  @0,@0
      dat.f  @0,*0
      stp.b  >0,#0
      dat.f  @0,{0
      dat.f  @0,<0
      dat.f  @0,>0
 
      dat.f  *0,*0
      dat.f  *0,}0
      stp.b  <0,#0
      dat.f  *0,<0
      dat.f  *0,>0
      
      dat.f  }0,}0
      dat.f  }0,{0
      dat.f  }0,<0
      dat.f  }0,>0
      
      dat.f  {0,{0
      dat.f  {0,<0
      dat.f  {0,>0
      
      stp.b  <0,#0
      stp.b  >0,#0
      dat.f  <0,<0
      dat.f  <0,>0
      dat.f  <0,<0
 
ASTEP EQU 3510; mod-10
BSTEP EQU 2365; mod-5
CSTEP EQU 3315; mod-5
 
p:    spl.b  $1,>3200
      spl.b  $1,>4800
      spl.b  $1,>6400
 
s1:   spl.b  @s1,}ASTEP
      mov.i  }s1,>s1
s2:   spl.b  @s2,}BSTEP
s2a:  mov.i  }s2,>s2
s3a:  mov.i  {s2,<s3
s3:   jmp.b  @s3,>CSTEP
bomb: dat.f  >1,}1
      dat.f  }1,>1
      stp.b  >0,#240
jump: jmp.b  $-1,$1
END
