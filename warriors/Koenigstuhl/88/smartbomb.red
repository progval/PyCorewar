;redcode
;name Smartbomb 4.1
;author Devin Kilminster
;strategy mod 4 mutagen on-axis scanner (access ~133% c)
;strategy mod 2 coreclear
;strategy 100% c imp gate
;strategy longer scan time
;assert 1

scan            add offset, target
target          cmp <-2, <-4002
                slt #100, target
                jmp scan, #111
                mov bomb, <target
count           djn -1, #16
                add swap, target
                jmp 1, #111
                mov #16, count
                djn scan, #240
                spl 2, <scan-1
                jmp 0, <scan-15
                mov offset, <-2
                jmp -1, <-3
offset          dat #412,#412
bomb            spl -1, #0
swap            dat #4000-412,#4000-412+16
