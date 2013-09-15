;redcode
;name spreel
;author Andy Pierce
;(ajpierce@med.unc.edu)
;1992
;assert 1

leng  dat #0,#24           ; put prog length in B field
x     dat #0,#0
sor   dat #0,#0
dest  dat #0,#0

begin mov #21,bomb
      mov #21,insur
      mov leng,x
      mov #1610,dest        ; new prog is 1610 units forward (7x230)
      add leng,dest
      mov #-2,sor
      add leng,sor

loop  mov <sor,<dest
      slt leng,x
      djn loop,x
      add #4,dest
      spl @dest,0

      mov #-1593,x
kloop mov bomb,@x
      sub bomb,x
      slt insur,bomb
      djn kloop,bomb
      jmp begin

bomb  dat #0,#0
insur dat #0,#0
      end begin
