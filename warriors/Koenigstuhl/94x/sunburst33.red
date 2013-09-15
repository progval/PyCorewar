;redcode-94x
;name Sunburst 33
;author Jay Han
;assert CORESIZE==55440

p1          equ 27790
s1          equ 68
p2          equ 6914
s2          equ 55423

loop        add inc, confuse
confuse     mov <p1, p2
mutate      jmp loop, <loop-3
clear       mov @confuse, <ptr+1
            djn clear, loop-2
                        mov #inc-confuse, confuse
inc         dat #s1, #s2
ptr         spl 0, loop-2

            end confuse

