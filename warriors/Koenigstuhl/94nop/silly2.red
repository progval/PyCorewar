;redcode
;name Silly 2
;autor James Ojaste
;assert 1
imp     equ -5000
safe    equ 10

ammo    dat >imp, spl0
dest    dat >imp, >safe+200

start   mov @ammo, >dest        ; loop
        jmp start, >imp         ;
        
dat0    dat >imp, >spl0-ammo
spl0    spl 0, >dat0-ammo
        end start
