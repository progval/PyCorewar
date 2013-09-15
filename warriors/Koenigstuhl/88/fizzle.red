;redcode-b
;name Fizzle
;author John Metcalf
;strategy Simple .5c dat bombing mod-2 b-scanner
;strategy From when I thought labels were for wimps :-)
;assert 1
add #2234, 1
jmz -1,    0
mov 2,     @-1
jmp -3,    0
end
