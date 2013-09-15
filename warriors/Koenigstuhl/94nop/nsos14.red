;redcode-94nop
;name NSos14
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy 0,8c bishot

ini equ 216
dist equ 3700
dc equ pok+5408

 org scan
pok dat ini, ini+dist
 dat 18, <2667
stun spl #20, >6300
loop mov stun, >pok
 mov stun, }pok
 djn.a loop, <stun
 for 3
 dat 0, 0
 rof
incr sub.f @0, @2 
scan sne.x }pok, >pok
 sub.f #pok, pok
scan2 sne.x *pok, @pok
 djn.f incr, *pok
 jmp stun, 0
 end

