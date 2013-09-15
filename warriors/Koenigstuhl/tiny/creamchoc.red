;redcode-tiny
;name Cream and Chocolate
;author LAchi
;strategy .66c bishot -> clear
;strategy 1.0 Based on an idea of Paul-V Khuong
;strategy     citing John Metcalf.
;strategy 1.1 Replaced clear with the evolved one in
;strategy     Evolution Strikes Back by Corrado Cau.
;strategy 1.2 Slight change suggested by John Metcalf.
;assert CORESIZE==800

FIRST equ 34
WIDTH equ 404
STEP equ 8 

s1
jmn.f  bomb, @bptr
add.f  #inc,  bptr
jmz.f  s1,   *bptr
b
djn.f  bomb,  bptr
for 5
dat 0,0
rof 

inc
bptr
dat.f  $FIRST,  $FIRST+WIDTH
dat.f  $    10, *  -390
bomb
spl.f  #    20, $    -5
mov.i  $    -1, }    -3
mov.i  $    -2, >    -4
djn.a  $    -2, <    -3 


for 2
	dat 0,0
rof 


;    [ Decoy Maker ]
deco:mov   >bptr+260,{bptr+352
  mov   >bptr+452,{bptr+556
  djn.f s1,     {bptr+649 

end deco 

