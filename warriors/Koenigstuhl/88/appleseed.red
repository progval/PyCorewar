;redcode
;name Appleseed Five++
;author Jack Twilley
;<nautilus@lachesis.acm.rpi.edu>
;stratey Copies and SPLits a surprise every so often.
;assert 1
length  equ     3
offset  equ     (2800+length)
begin   equ     (426+length)
span    equ     (burp-source)

start   mov     #length+span-1,  source
top     mov     @source,         <dest
        cmp     #span,           source
        jmp     top,             <source
source  spl     @dest,           0
        add     #offset,         dest
dest    jmp     start,           #begin
point   dat     #0,              #dest
burp    mov     point,           <point
        djn     burp,            point
end     start
