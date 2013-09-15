;name PBeat v1.0
;author Philipp Offermann
;strategy special brainwash for Electric Head
;could be made faster, but I don't think that it would score more
;anyway, it is my first scanner ;-)
;url http://home.t-online.de/home/offermann
;assert CORESIZE==CORESIZE

	org copy

elhead  EQU 100
cca     EQU (-4000)
PSTATE  EQU 250
neupos  EQU (CORESIZE/2)+50

cdaten          dat.f   leer,neupos
copy            mov.i   }cdaten,>cdaten
		djn.b   copy,#ganzende-leer+1
		spl.a   neupos+cdaten+start-leer
		jmp.a   start
leer            dat.f   0,0
pirat           stp     #0,#PSTATE
adder           dat.f   elhead,-elhead
counter         dat.f   leer+100,leer-100
start           seq.i   leer,@counter
		jmp.a   bomben
test2           seq.i   leer,*counter
		jmp.a   vorbomben
		add.f   adder,counter               
		jmp.a   start
vorbomben       mov.ab  counter,counter
bomben          add.ab  #cca,counter
		mov.ba  counter,counter
loop            mov.i   pirat,<counter
		mov.i   pirat,}counter
ende            djn.b   loop,#100
clear           mov.i   leer,>counter
		mov.i   leer,{counter
ganzende        jmp.a   clear
		end
