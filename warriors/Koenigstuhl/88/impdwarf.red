;redcode
;name ImpDwarf 1.0
;author Warren K.v. Roeschlaub
;strategy It's the Imp that acts like a Dwarf
;strategy Slightly more prolific than original
;assert 1
start   spl 1
source  spl 1
go      mov #(1+dest-source),source
cloop   mov <source,<dest
        mov <source,<dest
        spl (247+go+go-dest)
; kill all but one process and start bombing
die     mov <dest,die
bomb    mov dest,<dest
        djn bomb,dest
dest    dat #250+start,#250+start
        end start
