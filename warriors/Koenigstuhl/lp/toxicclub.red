;redcode-lp
;name Toxic Club
;author Christian Schmidt
;strategy .8c HSA-style scanner
;assert 1
;optimax scn

step equ 6557
ptr equ (scan-8)

        dat      19,  19
diff    jmp  #-step, #-step
        spl  #0, 0
wipe    mov    diff, >ptr
w2      mov   *wipe, >ptr
        djn.a  wipe,  length

loop    sub    diff, @s2
scan    sne (step*2) - 1, (step*2) - 7
        sub    diff,  scan
s2      seq   *scan, @scan
        slt.a   #20,  scan
timer   djn    loop, #1400


length  sub.ba #0,  #-7
tweak   mov.ab @s2, @wipe
t2      jmn    *w2,  timer
        djn.a  <tweak, {t2

end scan

