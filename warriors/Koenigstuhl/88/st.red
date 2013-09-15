;redcode
;name st
;author Lukasz Grabun
;assert 1

step  equ     3315
of    equ     -6
cor   equ     -10

start spl     0		, <cor
smov  mov     <of  	, <of*2
      add     inc       , smov
      djn     smov      , <-4000
inc   dat     <step     , <step
end   start
