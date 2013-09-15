;redcode-b quiet
;name Alien Kiss V1.1
;author bjoern guenzel
;strategy 0.5c stone, throwing info-bombs
;strategy V1.1: a little better against imps
;assert CORESIZE==8000

		org boot

size		equ 22	              ;size of programm
shift		equ 4000		;distance for booting
cycles	              equ 6
bombsize	equ 6
inbox		equ info-1
attack 	             equ info+bombsize+1
info		equ first-25


		
		mov.f #2936,(-2936-1)
first		mov.i info,*info	;throw info-bomb
		mov.i stun,@info	;throw stun bomb, just for better bombing speed
		add.f step,info
		jmz.a -3,inbox		;continue as long as inbox is empy

		mov.f inbox,attack	;prepare attack
		jmp 3,#0

		dat 0,0			;bombed
		dat 0,0

		mov.f #0,inbox		;reset inbox, with much luck kill an imp...
		mov.i stun,{attack	;attack
count		djn -1,#bombsize	;this comes from auntie
		mov.ab #bombsize,count
		djn first,#cycles
		jmp  clear

stun		spl #-1000,#0		;bombed

 		dat 0,0

clptr		dat #clear,clear+3
clbomb	dat #1,6
step		dat #2936,-2936
clear		spl #1,6
		mov *clptr,>clptr	;kind of Boeren-clear
last		jmp -1,<-7

;booting section
bootptr	dat #50,#0

boot		mov.i first-1,info+shift-1
		mov.ab #1+last+shift,boot
		
for size
		mov <bootptr,<boot
rof 

		spl @boot,23
		mov 0,boot
		mov 0,boot+1
		dat #1,#1

		end

