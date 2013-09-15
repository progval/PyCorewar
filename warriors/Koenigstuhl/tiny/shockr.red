;redcode-94x 
;name Shock.r
;author Ben Ford
;strategy tiny q^4 -> paper 
;strategy based on Easter Egg by John Metcalf 
;assert CORESIZE==800 

qa  equ (240) 
qb  equ (421) 

q1a equ (qta-2*(qa-1)*(qb)) 
q1b equ (qta+(qa-1)*qb) 
q2a equ (qta-2*(qa)*(qb)) 

   sne     q1a,  q1b 
   seq     q2a, }qta 
   jmp     qta, {qta 
   jmz.f   pgo, <qta 

qta mul.x  # qa, # qb 
   sne    >558, @qta 
   mul.f  # -2,  qta 

qlo mov    <515, }qta 
   mov    }qlo, <qta 
   djn     qlo, # 17 

pg1 equ ( 70) 
pg2 equ (524) 

pgo spl    }  2, {700 
   spl    >  2, {650 
   spl       0, {600 

pa1 spl     pg1,   -1 
   mov    >pa1, }pa1 
   mov     bmb, }pa1 
   mov     bmb, {pa2 
   mov    <pa1, {pa2 
pa2 jmz     pg2, *  0 
bmb dat    > -1, > -1 

end 

