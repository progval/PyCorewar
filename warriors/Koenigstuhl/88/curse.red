;redcode
;name Curse
;author Doug Ratcliffe Jr.
;strategy You'll find out soon enough what my strategy is.
;assert 1
start     jmp splcarpet-1
dat0      dat #425897,#-50
spl0      spl 0, #-50
 
          mov #-50, 38
splcarpet mov spl0, <37
          jmn splcarpet, @36
          mov #-50, 35
datcarpet mov dat0, <34
          jmn datcarpet, @33
tg1       jmp splcarpet-1
end start
