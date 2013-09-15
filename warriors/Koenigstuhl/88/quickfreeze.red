;redcode
;name QuickFreeze
;author P.Kline
;strategy faster-than-c scan finds large opponents fast
;strategy also anti-imp paper and anti-vamp
;assert CORESIZE==8000

cmpsp   equ 53                 ; scan every 2*cmpsp locations
cmpdif  equ 4000               ; cmp N and N+cmpdif+1
cmpstrt equ (start+150)        ; start scanning at cmpstrt
boffset equ 5                  ; adjustment for bombing

bspl    dat <2667,#4003        ; bomb

avamp   spl 0,cmpstrt-4000     ; stationary anti-vamp
av2     sub <avamp,@av3
av3     mov p1b,<avamp+cmpstrt-4000+4
        jmp av2,<-15
        
st3     spl avamp
stms    spl 1
        spl 1
p1      mov #8,p1            ; 4-process paper
p1s     mov <p1,<p1n         ; create child
        mov <p1,<p1n
        jmn p1b,p1           ; don't start bad copies
p1n     spl @p1n,-2995       ; start child
        mov p1b,<p1n         ; anti-imp bombs
        jmz @0,p1            ; if i'm ok, go again
p1b     dat <2667,<5334

start   spl start2           ; a little redundancy
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        jmp btest
start2  cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
        cmp cmpstrt-(start*cmpsp)+cmpdif,cmpstrt-(start*cmpsp)+1
        mov #cmpstrt-((start+1)*cmpsp)-bombptr+boffset,bombptr
btest   mov 100,0             ; only need one process now
        jmz st3,bombptr       ; skip bombing if nothing found
binc    spl 0
bomber  mov bspl,@bombptr     ; drop two bombs per loop
        sub #4,bombptr 
bombptr mov bspl,@0
        djn bomber,#4         ; short spread
        add #118,bombptr      ; reset pointer for extended spread
        mov p1b,binc          ; don't generate any more cycles
st2     jmz st3,stms          ; go to next phase
        end start
