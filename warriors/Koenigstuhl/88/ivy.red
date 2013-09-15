;redcode
;name Ivy3.4
;author Damon Gallaty
;contact dgal@cad.gatech.edu
;group B
;strategy Sprout copies, each copy sprouts new ones.
;assert 1

source    dat #14
dest      dat #1914
start     mov temp1,source
          mov temp2,dest
loop      mov <source,<dest
          mov <source,<dest
          jmn loop,source
          add #2,dest
          spl @dest
          add #20,temp2
          jmp start
temp1     dat #14
temp2     dat #1914
          end start
