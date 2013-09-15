;redcode-94
;name nIMPy v.0.92.8b
;author W. Henchy
; <willio@coffebite.com>
;strategy Nimbus Spiral 
;history: v.0.1    : Didn'work right..
;         v.0.1.4z : Fixed the bug
;         v.0.28.9b: Added split so it doesn't kill itself
;         v.0.35.9a: Became sIMPy
;         v.0.56.8x: Became zIMPy
;         v.0.79.8z: Became nIMPy
;         v.0.80.6a: Fixed a few bugs
;         v.0.91.2y: Added Nimbus Launch, so it would actually RUN :)
;         v.0.92.8b: Made nIMPy's spiral = 63 point, 2 process (like an
;                    average nimbus spiral...)
;assert CORESIZE == 8000

nIMP equ 127

imp:    mov 0,nIMP
boot:   spl 1
        spl 1
        spl 1
        spl 1
        spl 1
        mov -1, 0
        spl 1
        spl 2
spread: jmp @spread, imp
        add #nIMP, spread
end boot
