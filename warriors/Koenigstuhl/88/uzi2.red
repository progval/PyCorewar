;redcode
;name UZI warrior 2
;author Maz Spork
;assert 1

width   equ     333             ; distance between copies

; Replication module: copies the Killer program elsewhere in memory, then
; splits to that code.

start   sub     #width, dest
        mov     uzi+2,  <dest
        mov     uzi+1,  <dest
        mov     uzi,    <dest
        spl     @dest
        jmp     start

dest    dat     #0

; Killer module: fires bursts of killer opcodes into the core.

uzi     mov     3,      -1      ; moves illegal opcode into core
        add     offset, uzi     ; add offset to destination above
offset  djn     uzi,    #-1     ; decreases the offset

        end

