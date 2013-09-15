;redcode 
;name +1 Stormbringer
;strategy optimized Imprimis 3 originally by Dan Nabutovsky, P. Kline 
;strategy Re-optimized with several bugs fixed 
;strategy Added decoy generator and booted stone. 
;author Steve Gunnell
;assert CORESIZE == 8000 

d equ 889 
STEP equ 5189 
GATE equ 5591 
LEAP equ (inc + 301) 
DECOY equ (inc - 3121) 
GAP equ 10 

inc dat #0-STEP,#STEP 
stone spl 0 
stone1 mov <cnt-STEP-2,<cnt+STEP-1 
add inc,stone1 
cnt djn stone1,<GATE 
from dat #0 
boot mov <from ,<dest 
mov <from ,<dest 
dest spl @0 ,LEAP 
mov <from ,<dest 
sub dest ,dest 

for GAP 
dat #0 
rof 

start: spl boot ,<DECOY 
mov <from ,<dest 
mov <from ,<dest 
spl 1 ,<DECOY+1 
spl 16 ,<DECOY+2 
spl 8 ,<DECOY+3 
spl 4 ,<DECOY+5 
spl 2 ,<DECOY+9 
jmp i+d*0 ,<DECOY+17 
jmp i+d*1 ,<DECOY+18 
spl 2 ,<DECOY+10 
jmp i+d*2 ,<DECOY+19 
jmp i+d*3 ,<DECOY+20 
spl 4 ,<DECOY+6 
spl 2 ,<DECOY+11 
jmp i+d*4 ,<DECOY+21 
jmp i+d*5 ,<DECOY+22 
spl 2 ,<DECOY+12 
jmp i+d*6 ,<DECOY+23 
jmp i+d*7 ,<DECOY+24 
spl 8 ,<DECOY+4 
spl 4 ,<DECOY+7 
spl 2 ,<DECOY+13 
jmp i+d*8 ,<DECOY+25 
jmp i+d*9 ,<DECOY+26 
spl 2 ,<DECOY+14 
jmp i+d*10 ,<DECOY+27 
jmp i+d*11 ,<DECOY+28 
spl 4 ,<DECOY+8 
spl 2 ,<DECOY+15 
jmp i+d*12 ,<DECOY+29 
jmp i+d*13 ,<DECOY+30 
spl 2 ,<DECOY+16 
jmp i+d*14 ,<DECOY+31 
jmp i+d*15 ,<DECOY+32 

DAT #0 
DAT #0 
DAT #0 
DAT #0 
DAT #0 
DAT #0 

i mov 0,d 

end start 
