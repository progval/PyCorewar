;redcode
;name Bacteria
;author Scott Adkins
;<sadkins@bigbird.cs.ohiou.edu>
;assert 1
;strategy A deadly combination of both my Virus and Killer programs.
;
start   spl   killer
   	spl   dwarf1
   	spl   dwarf2
   	spl   dwarf1
   	spl   dwarf2
   	spl   dwarf1
   	spl   dwarf2
   	jmp   virus

src     dat     #0,     #10
killer  mov     #10,    src
copy    mov     @src,   <dst
        djn     copy,   src
        spl     @dst
        mov     src,    src
kill    mov     dst,    <src
        jmp     kill,   <src
dst     dat     #0,     #777

virus   spl   @host
   	add   #111,   host
   	jmp   virus

dwarf1  add   #111,   loc1
   	mov   loc1,   @loc1
   	jmp   dwarf1

dwarf2  sub   #111,   loc2
   	mov   loc2,   @loc2
   	jmp   dwarf2

loc1    dat   #0,   #0
loc2    dat   #0,   #0
host    dat   #0,   #0
	end   start
