;redcode-94
;name Sample Bomber
;author Chris Arguin
;assert CORESIZE==8000

        org     start

s       dat     #5333, #5333    ; Start in thirds, don't hit MY third
start   mov.i   -1, 2666        ; Bomb Address
        add.ab  #2666, start    ; Get ready to hit next location 
        slt     #0, s           ; If we aren't at about to kill ourselves
        jmp     start           ; Return to hit again
        div.ab  #2, start       ; Increase hitting area
        mov.ba  start, start+1  ; Decrease Increment size
        mov.b   start+2, 0      ; Get ready to calculate
        add.b   start, -1       ; Find out maximum size
        mov.b   -2, s           ; Set the guard paramater  
        mov.b   start, -2       ; Reset a paramater
exuent  jmp     start

        end
