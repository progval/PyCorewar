;redcode-94
;name Tiny Wicked Pete II
;author Franz
;strategy 66% asj scanner ... with some instant damage
;strategy it's wicked, a single shot based on add/sub/jmz (asj) 
;strategy scanning engine
;assert CORESIZE==800

sstep   equ 310
stscn   equ (lastsc+sstep) 

	org scan

;this will get picked up
step
lastsc  dat sstep,sstep ;;;;;

dat 0,0

gate    dat     >-1,            >wipe+10
bombs   spl     #-150,          >wipe+15
	spl     #-150,          >wipe+15

dat 0,0

dat 0,0 ;;;;;

dat 0,0
dat 0,0
dat 0,0

dat 0,0 ;;;;;

dat 0,0

loop    add.f   step,   scan 
scan    sub.f   stscn,  stscn+6
	jmz.f   loop,   @scan
	mov.ab  scan,   gate-2
wipe    spl     #0,     <0         ;the invisible line
clr     mov     @djmp,  >gate-2
djmp    djn.b   clr,    {gate+2

	end
