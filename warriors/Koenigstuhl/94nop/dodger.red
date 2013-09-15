;redcode-94 quiet
;name dodger
;author Beppe
;assert 1
;strategy bomb dodger

org     start

length  equ     (last-start)
decaway equ     -1500
destp   equ     4
destp1  equ     (destp+1)*b
b       equ     12
out     equ     500
trigg1  equ     trigg-out
decoy1  equ     decoy-out

trigg   dat     0,      -500
decoy   dat     0,      -120
start


startk

;...
wait1   sne     }watch1,>watch1 ; scan for bombs
	jmz.f   wait1,  }watch1 ; 
;br-eak
	sne     datzero,{watch1
	mov.ba  watch1, watch1

;b-reak
flee    
	nop     }watch1,}watch1
x       mov     bomb,   {watch1
	mov     {x,     {watch1
	mov     {x,     {watch1
	mov     {x,     {watch1
	mov     {x,     {watch1
	mov     {x,     {watch1
last    jmp     *watch1

;...
watch1    dat    200,5200
datzero   dat    0,0
;-break
c0      spl     #4000,  {last
c2      mov     bomb,   >last
jump    djn.f   -1,     >last
	jmp     -2,     >last
	dat     {5335,  10
bomb    dat     {5335,  10

end
