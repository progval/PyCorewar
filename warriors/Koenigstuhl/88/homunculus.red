;redcode
;name Homunculus
;author Pi Qan
;contact uranium@ugcs.caltech.edu
;group B
;assert 1
;strategy       Split and jump all over memory, hopefully
;strategy       into opponent's code.  Once in, it is very
;strategy       hard to kill, but easy to tie.

spl     0,      #0
add     #7,     1000
jmp     @999,   #0
