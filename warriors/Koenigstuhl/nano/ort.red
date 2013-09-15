;redcode-94
;name ort
;author phunk
;credit Based on classic Dwarf (A. K. Dewdney)
;assert CORESIZE % 4 == 0
 
        org     move
 
move:   add.ab  #4, bomb
        mov.i   bomb, @bomb
        spl     move
bomb:   dat     #0, #0
