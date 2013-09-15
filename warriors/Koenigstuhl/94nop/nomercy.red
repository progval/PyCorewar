;redcode-94
;name No Mercy
;author Brandon McKenzie
;assert 1

start add  #2050,  cntra       ;scanner
seq.f  @cntra, #0
jmp  -2                                ;end of scanner
mover for  10
mov  14, @cntra+(mover-1);bomb placement
rof
spl  @cntra+1
jmp  start
cntra dat  0,  0
dat  0,  0                              ;beginning of the bomb code
sub  #1,  -1
mov  -2,  @-2
add.a #1, 2
add.b #1, 1
mov -5, 5
seq.a #4, -1
jmp -6
spl 3
dat 0, 0                                  ;end of bomb
end

