;redcode-94x
;name Little HoT
;author Christian Schmidt
;strategy modified HoT-paper
;assert CORESIZE==800

pstep1 	EQU 	220
pstep2 	EQU 	374
pstep3 	EQU 	-156

ibh     spl 	1,0
        spl 	1,>-200
        spl 	1,>-100

    	spl     @0,     <pstep1
   	mov     }-1,    >-1
      spl     @0,     <pstep2
      mov     }-1,    >-1
      spl     @0,     <pstep3
      mov     }-1,    >-1
	mov     >100,      <635
	mov     >200,      <467

