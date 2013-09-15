;redcode-94 
;name Almost the Last One
;author Robert Macrae
;assert CORESIZE==8000
;strategy Against Q^2s, attempts to copy Paul's anti-bomber strategy, to
;strategy find the launch code and attack the booted warrior.
;strategy Against the others, borrows a couple of items from Alladin
;strategy -- I'm sure he won't mind :-)

; Boot a small scanner which locates the last-but-one word of the
; enemy launch code. This is used to identify the enemy. For the
; Q^2s, I use the same method to attack, by starting a SSD carpet
; on the warrior. For the scanners, I run Paul's micro-bomber, and
; for the others I run a modified CLP which also brainwashes Nomolos
; into a oneshot. Earlier versions had a 0.66c scan and a binary hash
; to find the warrior end, but in this case size easily beats speed.

; Could use BW protection?

; Does anyone remember that great failed proto-4GL "The Last One"?
; Seemed especially appropriate since this is also almost the last round. 



; --------------------------------------------------------------
; P-Logic

pstate  equ    141

plogic  ldp    #pstate,state    ; load state
        slt.b  state, #13       ; states over 12 indicate brainwash
         mov   #0,    state     ; (or self-scan) 
        slt    #5,    state     ; state  0 invokes scan + identify + bomber             
         jmp   boota            ; states 1-5 invoke scan + offset table + clear 
        slt    #8,    state     ; states 6-8 (scanners) invoke bomber 
         jmp   bootb            ;  
state   jmp    bootc, #0        ; states 9-12 (oneshot/P-spacer) invoke CLP.

; This table stores the offsets used to locate the booted warriors.
; The second field is another potential target which I might get
; around to attacking..?

s1    dat    2459, 3298        ; Gigolo       
s2    dat    -104, 0           ; Nine        
s3    dat    3989, 0           ; Probe     
s4    dat    -100, 2939        ; Benj         
s5    dat    -78,  -3          ; HeadTail     

targ  dat    0,    0           ; To suit new scan pattern


; --------------------------------------------------------------
; Boot Analyst

abo     equ   200

boota   mov   <aptr,   {aptr
        mov   <aptr,   {aptr
        mov   <aptr,   {aptr
        djn   -3,      #4
aptr    jmp   tail+1+abo,tail+1   ; Boots in 21 cycles.


; --------------------------------------------------------------
; Analyst
;   Averages about 135 cycles at 0.5c.
;   Less elegant than the 0.8c scan + binary hash, but
;   much, much shorter :-/
                
loop    add    #102,   scan
scan    jmz.f  -1,     targ-abo+44    ; Self-scan on second pass
        jmn.f  0,      >scan
        jmz.b  match-abo, state-abo   ; Identify enemy if required
attack  add.ab @state-abo, scan       ; Otherwise get offset from table
        jmp    @tail,  <store-abo     ; deter mov #* imps via indirect?  
        dat    #-100,  tail+3-scan
        dat    #2667,  tail+3-scan    ; Hurts vs papers?
clear   spl    #-100,  tail+3-scan
        mov    @2,     >scan
        mov    @1,     >scan
tail    djn.b  -2,     {clear         ; Poor gate...


; --------------------------------------------------------------
; Match Penultimate Word
;   3-27 cycles. Not booted as it only has to run once.
        
match   add   #-3,      scan+abo        ; Select penultimate word
        seq.i @scan+abo, @tabptr        ; Look through table for match
        djn   -1,       tabptr          ; Spare indirection here...
store   stp.b tabptr,   #pstate            
        jmp   bootb                     ; If I keep failing to identify,
                                        ; I probably face a scanner?

; --------------------------------------------------------------
; Table of Penultimate Words

tabptr    dat   0, f13

f1        SPL.b *-8, }-1656   ; Gigolo  
f2        JMP.b -85, 0        ; Nine    
f3        DAT.f >135, >135    ; Probe   
f4        JMP.b }-58, 0       ; Benj   
f5        MOV.i >1000, <-1665 ; Head    
			
f6        DJN.b *-3,#13       ; Hescan  
f7        SPL.b #2, #3        ; Memories  ; check both possibilities
f8        MOV.i {-1773,{1534  ; Memories  ; as it is tough to find                            

f9        SPL.b #0, <-1148    ; Electric  
f10       MOV.ab -10, -10     ; TheBlood  ; ditto
f11       SUB.ab #7, -26      ; TheBlood
f12       SPL.b #0, <-2997    ; Nomolos

f13       MOD.f  3, 3         ; Self-scan


; --------------------------------------------------------------
; CLP Variant

bootc     mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -4,#4
btDodger  jmp    pescape+210,pescape                                        

pescape   equ    (pb+1)
plen      equ    (pescape-p1)
pstep     equ    (5093)

p1        mov    pb       ,@pfence  ; build fences
          mov    pb       ,*pfence
ploop     mov    b1       ,<psnare  ; .6c carpet aids in fight to brainwash
          mov    b2       ,<psnare  ; Nomolos from Carbonite to oneshot. 
          mov    b3       ,<psnare  ;   
pfence    sne    pb-56    ,pb+26    ; monitor fences
psnare    jmp    ploop    ,5000
pmove     add.b  preset   ,psnare   ; adjust snare for new base
          mov    pb       ,pescape  ; set copy pointers
pcopy     mov    >pescape ,}pescape ; make copy
          jmn.b  -1       ,pescape  ;
preset    jmp    p1+pstep ,-p1-pstep; jump to new location
b1        stp.ab #140     ,#250     ; BW Electric Head
b2        stp.ab #140     ,#123     ; BW Nomolos
b3        mod.f  3        ,3        ; Die after BW complete.
pb        dat    pstep+p1-pescape,-plen


; --------------------------------------------------------------
; Microbomber from Alladin
; Use CLP as anti-HSA decoy.

sStep     equ    4954

        for 5
          dat    0,         0
        rof

bootb
Stone     mov    {1601    ,1-sStep         ; dat-bomb about 90% of core
          sub.x  #sStep   ,-1
          jmp    -2       ,}-2


          end    plogic
