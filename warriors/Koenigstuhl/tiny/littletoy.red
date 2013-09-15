;redcode-94nop
;name Little Toy
;author Christian Schmidt
;strategy qbomb -> paper
;assert 1

xOff   EQU    528 
xSep   EQU    140 


pGo  spl     2,      <647
     spl     2,      {494
     spl     1,      <86

s1   spl     @0,     <458
     mov     }-1,    >-1
     mov     }-2,    >-2
s2   spl     @0,     <130
     mov     }-1,    >-1
     mov.i   #1,     {1
     mov.i   #610,   <1
     djn.f   -3,     <630

start
i for 8
     mov.i   {xOff+(i*xSep), <xOff+(i*xSep*2)
rof
     djn.f   pGo,    <377

        end start

