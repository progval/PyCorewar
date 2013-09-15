;redcode verbose
;name Dum-Dum
;author Pierre Baillargeon
;strategy   v0.95:  Symmetric scanning
;assert 1

top     add step,   search      ; change pointers
search  cmp 8,      8           ; compare two locations
        jmp kill,   0           ; catch something
        jmp top,    0           ; nothing there
step    dat #1155,  #-1155      ; bomb (will be bombed)
kill    mov step,   @search     ; kill one location
        sub search, kill2       ; make other location offset
        sub offset, kill2       ; idem and axis center
kill2   mov 0,      0           ; kill other location
axis    sub kill2,  kill2       ; reset killer (cmp crossing)
        jmp top,    0           ; refelemele
offset  dat #-9,    #-9         ; offset to correct location

        end
