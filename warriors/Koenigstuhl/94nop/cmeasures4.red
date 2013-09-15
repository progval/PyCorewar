;redcode-b
;name CounterMeasures V4
;strategy A quick SPL/DAT clearer
;strategy     V2   - Added a algorithm to disperse a salvo of bombs first
;strategy     V3   - Improved attack against paper
;strategy     V3.3 - Modified bomb + first-pass coreclear
;strategy     V3.7 - Fixed a really stupid mistake :)
;strategy     V4   - Found better constants...
;author Chris Arguin
;assert CORESIZE==8000

;Inc = 1601, 1569  1;8;1
;Inc = 5091, 5000  4;4;2

INCSIZE         equ     5091
BOMBSDROP       equ     5000
STARTDROP       equ     fini+1
PROGSIZE        equ     fini-bomb

        org     disp
bomb    dat.a   #MINDISTANCE, #BOMBSDROP                ; Init bombs throw
stun    spl.a   0, #STARTDROP                           ; Init stunner
disp    mov.i   stun, *bomb                             ; Drop first bomb
        add.a   #INCSIZE, bomb                          ; Add increment
        djn     disp, bomb                              ; Loop till done
        mov.a   #-1, bomb                               ; Re-Init for clear
        mov.ab  #(CORESIZE-PROGSIZE-200), bomb          ; Set ending
        mov.i   bomb, stun                              ; Set Stun->Kill
        mov.ab  #STARTDROP+CURLINE, stun                ; Reset it
clr     mov.i   bomb, {bomb                             ; Drop first clear
        mov.i   stun, >stun                             ; Drop first Stun
jumper  djn     clr, bomb                               ; Continue till done
        mov.ab  #STARTDROP+CURLINE, stun                ; Reset Starting Dist.
        mov.a   #-1, bomb                               ; Re-Init for clear
        mov.ab  #(CORESIZE-PROGSIZE-200), bomb          ; Re-Set ending
        spl     fini, <bomb-1                           ; Start Gate
        jmp     clr, <bomb-1                            ; Continue
fini    jmp     0, <bomb-1                              ; Gate
        end


