;redcode quiet
;name QuickFreeze v1.5
;author P.Kline
;contact pk6811s@acad.drake.edu
;strategy faster-than-c scan finds large opponents fast
;strategy also anti-imp paper and anti-vamp
;assert 1
csize   equ -400
cmpsp   equ ((csize/35)/4-1)     ; scan every 2*cmpsp locations
cmpdif  equ (-1/2+1)             ; cmp N and N+cmpdif+1
cmpstrt equ (start+100+cmpsp)    ; start scanning at cmpstrt
boffset equ 5                    ; adjust for bombing

bspl    dat <-40,#(3+cmpdif)     ; bomb

stms    spl 1,cmpsp
        spl 1,cmpdif
        mov -1,0
p1s     mov p1b,<1000
p1      mov #7,p1s             ; 7-process paper
        mov <p1s,<p1n          ; create child
p1n     spl @p1n,-1188         ; start child
        mov p1b,<p1n
        jmz @0,@p1             ; if i'm ok, go again
p1b     dat <2667,<5334

start   spl start2             ; a little redundancy
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
        jmn btest,bombptr
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
        jmn btest,bombptr
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
        jmz st2,bombptr       ; skip bombing if nothing found
binc    spl 0,<-5
bomber  mov bspl,@bombptr     ; drop two bombs per loop
        sub #4,bombptr 
bombptr mov bspl,@0
        djn bomber,#4         ; short spread
        add #98,bombptr       ; reset pointer for extended spread
        mov p1b,binc          ; don't generate any more cycles
st2     spl stms              ; go to next phase
avamp   spl 0,bspl-10         ; stationary anti-vamp
av2     sub <avamp,@av3
av3     mov p1b,<bspl-10+4
        djn av2,#120
        mov bspl,-1
        end start
