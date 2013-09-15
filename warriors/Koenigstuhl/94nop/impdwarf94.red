;redcode-94
;name Imp-Dwarf
;author James Cook
;strategy moving mod-8 dwarf
;assert (CORESIZE == 8000)

spl b
a spl ab
aa spl aab
aaa jmp bomb1
aab jmp bomb2
ab spl abb
aba jmp addb
abb jmp copy
b spl bb
ba spl bab
baa jmp copy
bab jmp copy
bb spl bbb
bba jmp copy
bbb jmp copy

dat #6, #7
dat #6, #7
copy mov.i {-2, <-2
bomb1 mov.i -3, -4
bomb2 mov.i -4, <-1
addb add.ab #5419, -2
end

