;redcode-94 
;name Mason 2.0
;author Robert Macrae
;strategy Rebadged Torch with Handshake + Boot
; Brand 3.0 Beat torch t15 by about 3 points. Made hill with 133 
; points, so now adding handshake!
;assert CORESIZE == 8000

PIN 2188                       ; 2171

_RESULT equ #0          
_ROUNDS equ #(17+36)           ; 1936       
_BOOT   equ #(17+37)           ; 1937
_FRIEND equ #(17+40)           ; 1940
_ENEMY  equ #(17+42)           ; 1942
_LOSE   equ #(17+56)           ; 1956
_WIN    equ _LOSE+1                                                  
               
_SANE   equ #(17+45)           ; 1945
_TEST   equ #(17+60)           ; 1960
notmad  equ #(17+62)           ; 2362

first
enemy   ldp     _ENEMY,  #0
        jmn     boot, enemy    ; If enemy identified, boot.
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
         jmp    boot, }1100     ; and fight until someone wins.
        
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
         jmp    asylum, }1200         
        
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
        jmp     boot, }1300    ; Drop QS if time wasted.

; -----------------------------------------------------------

step     equ   17    ; Used to be 54. Hits -20,-16,-13,-10,-6,
                     ; -3 (at 941), 1 (at 2353?), 4 (at 1412)
bootoff  equ   3100

 
gate     dat   -100, 200                
wipe     dat   -2, #cp-gate+2 +18
     
; Insert gap of 18 here

for 18
         dat 0
rof

sp       spl   #-step, >1-step    ; spl half of the incendiary
in       add   #step*2, @msp      ; Used to be sub...
msm      mov   sm +15, *tgt-1+step    ; Used to have count*step...
msp      mov   sp, @msm           ; bomb alternately with spl & mov
tgt      djn.f in, <4500          ; bombed with spl to start clear
clr      mov   wipe -17, >gate -17
cp       djn.f clr, {gate -17
     
; Insert gap of 15 here

for 15
         dat 0
rof

sm       mov   step, >step        ; mov half of the incendiary

boot     mov   cp, bootoff
         for cp-sp
           mov {boot, <boot
         rof
         mov   sm, boot+bootoff+16
         mov   wipe, boot+bootoff+sp-cp-18
         mov   {-1, <-1
         jmp   @boot
         
         for (MAXLENGTH-CURLINE) / 5     ; Stun damaged Silks...
           spl #1, >1
           spl #1, #1
           spl #1, }1
           spl #1, *1
           stp >0, #1
         rof
         for (MAXLENGTH-CURLINE)
           spl #1, >1
         rof

         end   first

