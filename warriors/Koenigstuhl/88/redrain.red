;redcode quiet
;name RedRain
;author Wayne Sheppard
;assert CORESIZE==8000
add #3039,1
jmz -1,-1
mov 2,@-1
jmp -3
