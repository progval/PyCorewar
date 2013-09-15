;redcode
;name Night Crawler III
;author Wayne Sheppard
;wsheppar@st6000.sct.edu
;strategy Forward decrement
;assert CORESIZE==8000
;Night Crawler is an improvement over the standard imp/stone.
;The features:
;  -quick startup, bombing starts immediately
;  -small ring lets stone run faster 
;  -small ring can gate crash slow coreclears
;  -small profile stone is smaller target for scanners
;  -large decoys to confuse scanners
;  -forward decrementing, might disable Paratroop attack

imp equ impcopy+1700  ;imp start
hide equ 1600         ;stone location 
stone             
spl 0,<-1001      ;Stone is only four lines long
mov <21,1+2234    ;Bombs at light speed
sub 1,-1          ;mod 2 pattern
djn -2,<-2234     ;converts to addition coreclear
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536  
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
dat <stone,<6536
start
mov stone+3,hide         ;Copy stone 
mov stone+2,<start       ;to a safe place
mov stone+1,<start
;spl start+hide-3,<4000   ;additional SPL caused imps to start too slow
mov stone,<start
spl start+hide-3,<3950  ;Split to stone
ring
spl 9,<4050              ;binary ring startup is the fastest
spl 5,<4100              ;7 process 3-point spiral
spl 3,<4150
mov impcopy,imp          ;use one process to copy imp away from decoy
jmp start+hide-3,<4200   ;then jmp to stone
jmp imp,<4250
spl 2,<4300
jmp 2667+imp,<6350
jmp 5334+imp,<4400
spl 4,<4450
spl 2,<4500
jmp 1+imp,<4550
jmp 2668+imp,<4600
spl 2,<4650
jmp 5335+imp,<4700
jmp 2+imp,<4750
impcopy mov 0,2667
end start
