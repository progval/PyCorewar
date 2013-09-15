;redcode verbose
;name Killer
;author Scott Adkins
;<sadkins@bigbird.cs.ohiou.edu>
;assert 1
;strategy A simple program that copies itself to another location, starts
;strategy that copy, and then spends its remaining lifetime bombing memory
;strategy near itself.  It is more or less a dwarf-like mice program.
;
src     dat     #0,     #10

start   mov     #13,    src
copy    mov     @src,   <dst
        djn     copy,   src
        spl     @dst
        mov     src,    src
kill    mov     dst,    <src
        jmp     kill,   <src

dst     dat     #0,     #777
        end     start
