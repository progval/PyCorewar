;redcode-b verbose
;name 3-clear 0.6
;author Ilmari Karonen
;date June 13, 1996
;strategy Cclr + djn (reverse djn version)
;strategy Simple and easy to adapt to different situations.
;comments 'd-clear' converted into a multipass cclr!
;history 0.1 - Works.. (SPL/SPL/DAT[/DAT]...)
;history 0.2 - Starts spl again after SPL/SPL/DAT/DAT.
;history 0.3 - Fixed a VERY stupid bug!
;history 0.4 - Test: splits less, clears faster?
;history 0.5 - Back to SPL/SPL/SPL/DAT[/DAT]...
;history 0.6 - Switched to backward djn.. hmm? Added more space.
;planar clear, stun
;size 3
;speed ~1c
;assert 1

        org     split
tail    equ     (kill+1)
toe     equ     (head+MAXLENGTH)
space   equ     (MINDISTANCE)


head
bomb    dat     #stun, #toe+space
        dat     0, 0
stun    spl     #start-bomb, #tail-bomb
start   spl     #split-bomb, #tail-bomb
split   spl     #kill-bomb, #tail-bomb
loop    mov.i   *bomb, >bomb
        mov.i   *bomb, >bomb
        djn.f   loop, <bomb-space
kill    dat     #kill-bomb, #tail-bomb

for MAXLENGTH-CURLINE
        dat     0, 0    ; free space
rof

        end
