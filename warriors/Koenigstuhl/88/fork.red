;redcode 
;name fork
;author J.Layland
;assert 1 
; not the crushing blow I hoped for, but I might as well submit something...
 
bomb equ -3044 
bdist equ 500
 
boot4
mov s1, s1+0+bdist
mov s2, s2+0+bdist
mov s3, s3+0+bdist
mov s4, s4+0+bdist
spl s1+0+bdist
 
boot3
mov s1, s1+2000+bdist
mov s2, s2+2000+bdist
mov s3, s3+2000+bdist
mov s4, s4+2000+bdist
spl s1+2000+bdist
 
boot2
mov s1, s1+4000+bdist
mov s2, s2+4000+bdist
mov s3, s3+4000+bdist
mov s4, s4+4000+bdist
spl s1+4000+bdist
 
boot1
mov s1, s1+bdist+6000
mov s2, s2+bdist+6000
mov s3, s3+bdist+6000
mov s4, s4+bdist+6000
jmp s1+bdist+6000
 
s1      mov bomb, <-12
s2      jmz -1, -1-3044  
s3      mov bomb, <-14
s4      jmp -1, -1-3044
 
 
last    END boot4
