;redcode
;name Cleaver
;author Wayne Sheppard
;strategy Bomber/Bscanner/Impscanner
;assert 1

dist equ 2376
look equ dist*2
imp equ 2667

start add #look,loc
mov bomb,@loc
loc jmz -2,@hit
add #dist,loc
cmp #imp,@loc
jmp loc-1,<1000
sub #8,loc
hit mov s,<loc  ;will hit itself here eventually
add #imp+1,loc
djn -2,#200
s spl 0,<-10
mov 2,<-2
jmp -1,<-12
bomb dat <-11,<dist
end start
