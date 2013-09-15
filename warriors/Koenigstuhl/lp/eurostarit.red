;redcode-lp
;name Eurostar Italia
;author LAchi
;strategy Eurostar
;assert MAXLENGTH % 2 == 0 

SPAZIO_VUOTO equ (MAXLENGTH - 95 - 2) / 2
UN_OTTAVO equ (CORESIZE - MAXLENGTH - MINDISTANCE * 2) / 16
INIT_SALGO01 equ (fine_guerriero-salgo01)+MINDISTANCE
INIT_SCENDO01 equ (inizio_guerriero-scendo01)-MINDISTANCE
INIT_SALGO02 equ (fine_guerriero-salgo02)+MINDISTANCE+UN_OTTAVO
INIT_SCENDO02 equ (inizio_guerriero-scendo02)-MINDISTANCE-UN_OTTAVO
INIT_SALGO03 equ (fine_guerriero-salgo03)+MINDISTANCE+UN_OTTAVO*2
INIT_SCENDO03 equ (inizio_guerriero-scendo03)-MINDISTANCE-UN_OTTAVO*2
INIT_SALGO04 equ (fine_guerriero-salgo04)+MINDISTANCE+UN_OTTAVO*3
INIT_SCENDO04 equ (inizio_guerriero-scendo04)-MINDISTANCE-UN_OTTAVO*3
INIT_SALGO05 equ (fine_guerriero-salgo05)+MINDISTANCE+UN_OTTAVO*4
INIT_SCENDO05 equ (inizio_guerriero-scendo05)-MINDISTANCE-UN_OTTAVO*4
INIT_SALGO06 equ (fine_guerriero-salgo06)+MINDISTANCE+UN_OTTAVO*5
INIT_SCENDO06 equ (inizio_guerriero-scendo06)-MINDISTANCE-UN_OTTAVO*5
INIT_SALGO07 equ (fine_guerriero-salgo07)+MINDISTANCE+UN_OTTAVO*6
INIT_SCENDO07 equ (inizio_guerriero-scendo07)-MINDISTANCE-UN_OTTAVO*6
INIT_SALGO08 equ (fine_guerriero-salgo08)+MINDISTANCE+UN_OTTAVO*7
INIT_SCENDO08 equ (inizio_guerriero-scendo08)-MINDISTANCE-UN_OTTAVO*7 

	org start 

inizio_guerriero
	dat.f  #       1, #       1 

for SPAZIO_VUOTO + 1
	dat.f  $       0, $       0
rof 

start
	spl.a  $scan02
	spl.a  $scan03
	spl.a  $scan04
	spl.a  $scan05
	spl.a  $scan06
	spl.a  $scan07
	spl.a  $scan08 

n for 8 

scan&n
	seq.i  @scendo&n, *salgo&n
	jmp.a  $clear&n
	add.x  #(-scendo&n), $salgo&n
	jmp.a  $scan&n
clear&n
	mov.i  $bomb&n  , <scendo&n
	mov.i  $bomb&n  , }salgo&n
	djn.ab $clear&n , #MAXLENGTH
	mov.ab #MAXLENGTH, $      -1
	jmp.a  $scan&n
salgo&n
scendo&n
	dat.f  #INIT_SALGO&n, #INIT_SCENDO&n
bomb&n
	dat.f  $       0, $       0 

rof 

for SPAZIO_VUOTO
	dat.f  $       0, $       0
rof 

fine_guerriero
	dat.f  #       0, #       0
	end 

