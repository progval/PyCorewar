;redcode-94
;name Bigboy
;author Robert Macrae
;strategy  Handshake, Quickscan and Incendiary bomber,
;strategy  and a very tight squeeze it is.
;assert CORESIZE == 55440

PIN 1339

_RESULT equ #0          
_ROUNDS equ #2236       
_BOOT   equ #2237
_FRIEND equ #2240
_ENEMY  equ #2242
_LOSE   equ #2256
_WIN    equ _LOSE+1                                                      
           
_SANE   equ #2245
_TEST   equ #2260
notmad  equ #3276

first
enemy   ldp     _ENEMY,  #0
	jmn     look, enemy    ; If enemy identified, quickscan.
friend  ldp     _FRIEND, #0
	jmz     hands, friend  ; Handshake if status U/K
	jmp     fixgame, >-8000; or else allot win as appropriate

hands   ldp     _RESULT, #0  
	sne.b   hands, #-1
	 jmp    startup, >-7600; Initialise _SANE on first round
sane    ldp     _SANE, #0 
	seq.b   sane, notmad
	 jmp    asylum, >-7800 ; Rebuild P-space if brainwashed.

rounds  ldp     _ROUNDS, #0
	add.ba  -1, 1
	stp     #1, _ROUNDS     ; increment round counter,
	sne.b   hands, #2
	 jmp    boot, >-8200    ; and fight until someone wins.
	
	add.b   hands, wflag    ; Store a Flag for winner and loser 
wflag   stp     #1, _LOSE       
	sub.ba  hands, rflag    ; Won->1, Lost->2
rflag   ldp     _WIN, #0        ; Read the other flag 
	jmz.b   asylum, rflag   ; If zero I must have an enemy.

	stp     #1, _FRIEND     ; Whoopee!
	stp     #1, _TEST       ; Flag the fact that I'm
	stp     #0, _WIN        ;  identifying future winner
	stp     #0, _LOSE       ; clean up
	dat     #0, #0          ; Yes, Anders, I like it too :-)
				; First mover loses, sadly.
fixgame ldp     _TEST, #0

sane2   ldp     _SANE, #0      ; Throw in a paranoid sanity check
	seq.b   sane2, notmad
	 jmp    asylum         
	
	jmz     winlose, fixgame ; If I've finished testing, do it.
round2  ldp     _ROUNDS, #0  
	mod.ab  #2, round2
	stp     #0, _TEST        ; Don't need to test again.
	jmn.b   winlose, round2  ; Choose which block...
	
losewin ldp     _RESULT, #0
	jmz.b   0, losewin       ; Wrong winner last round. 
	dat     #0, #0           

winlose ldp     _RESULT, #0
	jmn.b   0, winlose       ; Winner keeps on winning! 
	dat     #0, #0           ; Addicted? Me?

asylum  stp     #1, _ENEMY     ; If I've been washed, somebody
startup stp     notmad, _SANE  ; _is_ out to get me! 
	jmp     boot, >-7600   ; Drop QS if time wasted.

; n_ame Pyr55 for 55440 core
; author R. Macrae after Michael Constant
; strategy  Quickscan. There _is_ no alternative...

; ----------- Quick-Scan Parameters 
OVERLAP1 equ    70           ; Scan from 70 after hit
OVERLAP2 equ    -120         ; to 120 before it
BIG     equ     200
OFS     equ     350          ; Too far forwards to bomb self...
BOMBDIR equ     -1           ; 1 is forward, -1 is backward
SPACE   equ     7
CS2     equ     (CORESIZE/2)
; ---------------------------------

look
qscan   for     6
	sne.i   (first+OFS+(qscan*2*BIG)), (first+CS2+OFS+(qscan*2*BIG))
	seq.i   (first+OFS+BIG+(qscan*2*BIG)), (first+CS2+OFS+BIG+(qscan*2*BIG))
	mov.ab  #(first+OFS+(qscan*2*BIG))-found, @found
	rof

	jmn     found+1,found
	
qscan   for     6
	sne.i   (first+OFS+((qscan+6)*2*BIG)), (first+CS2+OFS+((qscan+6)*2*BIG))
	seq.i   (first+OFS+BIG+((qscan+6)*2*BIG)), (first+CS2+OFS+BIG+((qscan+6)*2*BIG))
	mov.ab  #(first+OFS+((qscan+6)*2*BIG))-found, @found
	rof

	jmn     found+1,found
	
qscan   for     6
	sne.i   (first+OFS+((qscan+12)*2*BIG)), (first+CS2+OFS+((qscan+12)*2*BIG))
	seq.i   (first+OFS+BIG+((qscan+12)*2*BIG)), (first+CS2+OFS+BIG+((qscan+12)*2*BIG))
	mov.ab  #(first+OFS+((qscan+12)*2*BIG))-found, @found
	rof
	
	jmn     found+1,found
	
qscan   for     6
	sne.i   (first+OFS+((qscan+18)*2*BIG)), (first+CS2+OFS+((qscan+18)*2*BIG))
	seq.i   (first+OFS+BIG+((qscan+18)*2*BIG)), (first+CS2+OFS+BIG+((qscan+18)*2*BIG))
	mov.ab  #(first+OFS+((qscan+18)*2*BIG))-found, @found
	rof
	
	jmn     found+1,found
	
qscan   for     6
	sne.i   (first+OFS+((qscan+24)*2*BIG)), (first+CS2+OFS+((qscan+24)*2*BIG))
	seq.i   (first+OFS+BIG+((qscan+24)*2*BIG)), (first+CS2+OFS+BIG+((qscan+24)*2*BIG))
	mov.ab  #(first+OFS+((qscan+24)*2*BIG))-found, @found
	rof

found   jmz.b   boot,   #0
	add.b   found,  found2
	sne.x   @found, @found2
	add.ab  #(CORESIZE/2), found
	jmn.f   2,      @found
	add.ab  #BIG,   found
	mov.i   pit,    >found          ; Pre-bomb
mkfang  sub.ba  found,  qfang
	add.b   found,  qfang
	mov.i   qfang,  @qfang
	sub.f   subber, qfang
	djn.b   -2,     #((OVERLAP1+OVERLAP2*BOMBDIR)/SPACE)+1
found2  jmp     boot,   #found+BIG

qfang   jmp     (BOMBDIR*OVERLAP1)+pit+(qfang-found), #(-BOMBDIR*OVERLAP1)+found-qfang

pit     spl     #0,     <mkfang
subber  spl     #BOMBDIR*SPACE, #-BOMBDIR*SPACE
	ldp     >0,     #1
	spl     #0,     {mkfang 
	spl     -1,     <mkfang 
	jmp     pit,    {mkfang 

; ----------------------------------------------------------

; redcode-94
; n_ame Torrent
; author Robert Macrae 
; strategy Incendiary at 0.2c + SPL at 0.4c
; strategy   -- Torch meets Tornado.

TSTEP   equ     229*7   ;Mod 7        
BOOTOFF equ     -7531

bm      mov     TSTEP,   }TSTEP 
bs      spl     #1-TSTEP,#0             ; Self-hit.
	dat     #gate-10,#24200  
gate    dat     #gate-10,#24200
wipe4   dat     #gate-10,last-gate+6
wipe3   dat     #gate-10,last-gate+6    
wipe2   spl     #gate-10,last-gate+6    ; redundant wipers
wipe1   spl     #24200  ,last-gate+10   ; start half way round.
					; (djn hits me first)
	dat     0,      0
	dat     0,      0

incr    spl     #3*TSTEP,>3*TSTEP        
loop    add     incr,   stone           ; 4)
stone   mov     hit+TSTEP,*hit+(2*TSTEP) ;3) and SPL via MOV for incendiary.        
	mov     bm,     @stone          ; 2) MOV,
	mov     bs,     *stone          ; 1) Fires SPL,
hit     djn.f   loop,   <-30            ; Overwrite for CC
	mov     @1,     >gate
last    djn.b   -1,     {wipe1

boot    mov     last,   BOOTOFF 
	for last-incr 
	 mov     {boot, <boot
	rof
	for wipe1-bm+1           
	 mov     }boot2, >boot2
	rof
	spl     @boot, >-8000
	mov     incr,  boot             ; Clean up pointer
boot2   dat     bm,    BOOTOFF-last+bm+boot   

; No space for decoy...        
	
	end     enemy

