;redcode
;name Muttaburrasaurus
;author Steve Gunnell
;strategy Kenshin and Spraypaper 
;assert 1 

org pgo 

pgo ldp.ab #0, #0 
ldp.a #39, ptab 
jmn.b pgood, pgo 
nop.f }ptab, }-1000 
stp.ab ptab, #39 
pgood mod.a #3, ptab 
ptab jmp.a @0, paper 
dat.f 0, boot 
dat.f 0, boot 

;------------------------------ 

STEP equ 2831 
START equ 1883 
LEAP equ (head+4436) 
bptr equ (head-2) 

boot spl LEAP ,head 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
mov.i >boot ,}boot 
sub.f boot ,boot 
dat.f 0 ,0 

head slt #START ,#tail-bptr+5 
mov.a head ,bptr 
trash mov *tail ,}bptr 
add.a #STEP ,@hptr 
jmz.f trash ,*head 
hptr jmn.a @hptr ,head 
jmp @hptr ,}tail 
tail spl #0 ,}0 
jmp #0, }0 
dat 0, 0 

;------------------------------ 

step equ 4492 

paper spl 1, 1 
mov -1,0 
mov -1,0 
mov -1,0 
spl first+5334-4745*3 , first 
mov.i >-1, }-1 
spl first+2667-4745 , first 
mov.i >-1, }-1 
first spl 4745 , 0 
mov.i >-1, }-1 
top spl @0, step 
mov.i }-1, >-1 
mov.i bomb, >top-step-step-step 
for 3 
mov.i bomb, >top-step-step 
rof 
bomb dat #1, #1 


