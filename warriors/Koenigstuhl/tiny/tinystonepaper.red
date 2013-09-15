;redcode-tiny
;author Lukasz Grabun
;name Tiny Stone-paper
;assert CORESIZE==800

soff	equ	537

boot:	mov tBmb, soff
sPtr	spl 1, tLoop+1
	spl 1, 0
	mov <sPtr, <boot
	djn @boot , #4

;paper from Digital Swarm

s1 equ 104
     s2 equ 60

pgo: spl   1,        {0     ; these two lines become
     spl   *2,       {0     ; invisible to f-scans

pap1:spl   @0,       <s1
     mov   }pap1,    >pap1
     mov   {pap1,    <pap2
pap2:djn.f *s2-3,    >s2


;stone from The Wasp

tStep   equ     586
tTime   equ     156

        spl     #0              , #0
tMov    mov     tBmb            , @tLoop
        add     #tStep          , tLoop
tLoop   djn.f   tMov            , {-1-(tTime*tStep)
tBmb    dat     {4              , >1

