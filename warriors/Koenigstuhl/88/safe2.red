;redcode
;name Safe v2.0
;author Marcus Williams
;assert 1 
bomb    dat #0,#0
 
; Search for SPL #0,#2
 
start   jmz 0,<-1
 
; Copy Core clear across to 'safe' place
 
        mov loc4,@bomb
        mov loc3,<bomb
        mov loc2,<bomb
        mov loc1,<bomb
        jmp @bomb
 
; Core clear code
 
loc1    spl 0,#3 
loc2    mov 3,@loc4
loc3    add #1,loc4
loc4    jmp loc2,#1
        end start
