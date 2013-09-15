;redcode
;name GEMINI CANNON
;author Jon Newman
;strategy has required considerable modification
;strategy to run under Core War '89.
;assert 1
        dat #0,#400
go      djn 0,-1
        mov #400,-2
        mov #0,source
        mov #source-dest+offset,dest
        spl start,0
        jmp go,0
offset  equ 100
source  dat #0,#0
dest    dat #0,#source+offset
loop    add #1,source
        add #1,dest
start   mov @source,@dest
        cmp #last-source,source
        jmp loop,0
done    mov #0,source+offset
        mov #source-dest+offset,dest+offset
last    jmp start+offset,0

        end go

