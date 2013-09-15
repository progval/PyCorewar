;redcode-quiet
;name Iron Sword
;author Wayne Sheppard
;strategy Cmp scanner/No gate/3 point coreclear
;assert CORESIZE==8000

dist    equ 34     ;94,98,42,54 <-these numbers worked good also

        sub off,@x
loc cmp dist,0
        slt #20,@x
        djn -3,j
        mov j,@loc
x       mov s,<loc
        sub new,loc
j       jmn @-1,#-20
s       spl 0
new     mov @0-dist,<0-dist-1
        sub #2666,@0-1              ;I tried to do it without this line
off     dat <0-dist-dist,<0-dist-dist

        end
