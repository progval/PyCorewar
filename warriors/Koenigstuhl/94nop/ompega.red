;redcode
;BDECWT Round1
;name ompega
;author Steven Morrell
;strategy  Blatant Impfinity rip-off
;strategy  A little more stone and a little less imp.
;assert CORESIZE == 8000
 
for 0

Notes: This is the same version on the hill.  The only warrior of
Anton's that I have seen win is Blur 2, and only on a good day.
Besides, I couldn't get my other idea to work yet.

rof

org start
 
step equ 2234
impnum equ 2667
 
impoff equ (first+1000)
stoneoff equ (first+2000)
bootoff equ (first+3000)
impdooff equ (first+4000)
djnoff equ 3901
 
first:
start:
   mov stone+6,stoneoff+20
   mov stone+5,stoneoff+18
   mov }stone,>stonep
   mov imp,impoff
impdop:
   mov impdo+2,impdooff+2
   spl 1
   mov {impdop,<impdop
   mov {bootp,<bootp
   mov {bootp,<bootp
stonep:
   jmp bootoff,stoneoff
boot2:
   spl 1,<1500
   mov }stone-bootoff+boot2,>stonep-bootoff+boot2
   spl impdooff-bootoff+boot2,<2500
   jmp stoneoff-bootoff+boot2,<3500
stone:
   SPL #0,<djnoff
   SPL #-step,<step
   MOV >-step,step+18-1
   ADD -2,-1
   DJN.f  -2,<djnoff-stone
   dat -15
   dat -19
imp:
   mov.i #-4,impnum
impdo:
   spl #0,<-10
   add.a #impnum,1
   djn.f impoff-impdooff+impdo-(8*impnum),<-12
bootp:
   mov boot2+4,bootoff+4
 
for 74
   dat 1,1
rof
