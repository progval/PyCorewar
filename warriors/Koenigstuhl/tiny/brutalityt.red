;redcode-b
;author Franz
;name Tiny Brutality
;strategy Vampire/Pittrapper/D-clear:
;strategy ----------------------------------------------------------------
;strategy 1) Quickscan
;strategy 2) boots up to 5 different locations in core, 2 data 1 coreclear
;strategy    1 trapper, 1 pit
;strategy 3) starts trapper (modulo 5, nonsplitting)
;strategy 4) when done calls coreclear(d) routine to kill the enemy
;strategy ----------------------------------------------------------------
;strategy the pit is a SPL only pit that tries to cripple the enemy asap
;strategy in spare time the pit builds a spl 0 carpet
;url http://www.azstarnet.com/~franz
;assert CORESIZE==800

opt EQU 215
pit EQU p1

SPLCAR EQU 200

		org trapper

gate            dat 0,pit+50
g               DAT >-25,>pit-4-gate
bomb            DJN.F pit-(trapper-1)-opt,<(trapper-1)+opt
		dat 0,0

coreclr         SPL   #0,>gate
cc2             MOV.I g,>gate
cc4             DJN.F -1,>gate
		dat 0,0

		dat 0,0

trapper         MOV bomb,@bomb
tr2             ADD p1,bomb
tr3             JMZ trapper,trapper-1
tr4             DJN.F coreclr,<trapper-81

		dat 0,0

p1              SPL #-opt,>opt
p2              SPL #1,>-100
p3              SPL -1,>-101
p4              MOV -1,<SPLCAR

		END

