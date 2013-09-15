;redcode-94x
;name Censorship
;author Philip Kendall
;strategy A CLP variant
;assert 1
; OACT 1998/2

for 0

Ian Oversby's Tournament Round 2: Tiny hill, but 16000 cycles and
no .i or # allowed.

The idea behind this warrior is that the main form of attack used by
many warriors will be a forward clear, probably at 1c. Therefore sit
around and wait until a location (spy) is changed, then boot the my
clear in behind the opponent's clear, then proceed to wipe core and
kill him... hopefully. Also, build a decoy just behind myself at
start-up to trigger as many one-shots as possible, and stick a
dat.f 1,1 at the end so any one-shots with djn streams (say like
my One Shot 'T') will switch to a clear when they hit that, and
then fall into my trap :-)

What it's good against: one-shots and clears
What it's very bad against: stones (and backward clears)

rof

dest    spl.a   100,200
	mov.f   300,>400
	djn.f   500,>600
spy     dat.f   0,0

decoy   equ     (dest-14)

start   mov.f   <decoy+0,{decoy+2     ; make a quick-decoy
	mov.f   <decoy+3,{decoy+5     ; to foil one-shots
	mov.f   <decoy+6,{decoy+8     ; and the occasional q-scan
	mov.f   <decoy+9,{decoy+11
	djn.f   look,<decoy+13

i       for     2
	dat     0,0
	rof

gate    equ     (split-2)
cstart  equ     (bomb+2-gate)

split   dat.f   0,dest
clear   dat.f   bomb,>gate
	dat.f   clear,>gate
bomb    dat.f   313,cstart

look    jmz.f   0,spy
copy    mov.f   }split,>split
	djn.b   copy,bptr
bptr    jmp.a   dest,4

	dat.f   1,1             ; protection from djn streams

	end     start

