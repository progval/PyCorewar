;redcode-94 test 
;name Bugtown Rap 9
;author Steve Gunnell
;assert CORESIZE == 55440

STEP equ 52435 
BOOT equ 722 
STARTA equ pit-BOOT-(STEP*6284) 
STARTB equ (STEP*6284) 
KILL equ 0 
GAP1 equ 0 
GAP2 equ 1 
GAP3 equ 10 
GAP4 equ 2 

ptr jmp STARTA ,STARTB 
step dat -STEP ,STEP 
dat #ptr-5 ,incr-ptr+5 
wipe spl #ptr-5 ,incr-ptr+5 
bomb jmp.i #1 ,#1 

for GAP1 
dat 0 ,0 
rof 

head mov.i bomb ,*ptr 
mov.i ptr ,@ptr 
sub.f step ,ptr 
jmn.b head ,ptr 

for GAP2 
nop 0 ,0 
rof 

spl #0 ,#0 
write mov @incr ,>ptr 
for KILL 
mov @incr ,>ptr 
rof 
incr djn.f write ,{wipe 
jmp write+1,ptr-5 

for GAP3 
dat 0 ,0 
rof 

start mov.i }boot1 ,>boot1 
mov.i }boot1 ,>boot1 
mov.i }boot1 ,>boot1 
mov.i }boot1 ,>boot1 
mov.i }boot1 ,>boot1 
mov.i }boot2 ,>boot2 
mov.i }boot2 ,>boot2 
mov.i }boot2 ,>boot2 
spl.b @boot2 ,0 
mov.i }boot2 ,>boot2 
for GAP2 
mov.i }boot2 ,>boot2 
rof 
mov.i }boot2 ,>boot2 
mov.i }boot2 ,>boot2 
for KILL 
mov.i }boot2 ,>boot2 
rof 
mov.i }boot2 ,>boot2 
mov.i }boot2 ,>boot2 

boot1 sub.f #ptr ,#ptr+BOOT 
boot2 sub.f #head ,#head+BOOT 
dat.f $0 ,$0 

for GAP4 
dat 0,0 
rof 

spl #1 ,1 
spl #1 ,1 
pit spl #1 ,1 

for MAXLENGTH-CURLINE 
spl #1 ,1 
rof 

end start 

