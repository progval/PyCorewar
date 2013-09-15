;redcode-94x
;name Evolving Magic
;author Christian Schmidt
;Strategy qbombing evolved-style paper
;assert 1

xOff   EQU    528 
xSep   EQU    140 

pGo  spl     #0,      <295
     spl     69,      <532
     mov.i   }-2,     }-1
     mov.i   {463,    <551
     mov.i   }-4,     }-3
     mov.i   {329,    <422
     mov.i   {721,    <315
     mov.i   }32,     <571

start
i for 11
     mov.i   {xOff+(i*xSep), <xOff+(i*xSep*2)
rof
     djn.f   pGo,     <377

     end     start

