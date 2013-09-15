;redcode-x
;name csapda
;author nandor sieben
;asmqk@asuacad.bitnet
;assert 1
start   add eltolas,point        ; mod 4 scan
        jmz -1,@point
        mov point,point+10
        mov #20,0; bomb with spl
        mov bomb,<point+10
        djn -1,-2
        mov point,@point         ; bomb with a single jmp in the middle
        jmp start,#0             ; to get a slave
bomb    spl -1,#0
        dat #0
        dat #0

        dat #0
        dat #0
        dat #0
        dat #0

        dat #0
        dat #0
        dat #0
        dat #0

        dat #0
        dat #0
        dat #0
        dat #0

        dat #0
        dat #0
        dat #0
        dat #0

        dat #0
point   jmp -start+200+2,start-1-200
        mov point-1,<1; the slave cleans the core
        spl -1,start-2
        jmp -2,#0
eltolas dat #77*4,#-77*4; eltolas=shift
        end start
