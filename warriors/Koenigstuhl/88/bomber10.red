;redcode-94
;name Bomber 10
;author Thomas Krooﬂ
; <Thomas.32@gmx.de>
;assert 1

start:  mov +3, +4000
        spl 3999
        jmp +2
        mov 0, +1
        sub #1, bomb
        mov #+300, @bomb
        mov #+200,         @bomb
        mov #-10,         reihe
        mov jumper,         -2
        mov #200,         target
        mov #-5,         bomb
        spl -7
        mov #20,         Zaehler
        mov @reihe,        @target
        add #1,         target
        add #1,         reihe
        djn Zaehler,         -3
        jmp +200
Zaehler: dat #0
target: dat #0
reihe:  dat #0
bomb:   dat #-5
jumper: jmp -2
	end

