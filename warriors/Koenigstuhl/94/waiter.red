;redcode-94
;name Waiter
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Table-based switcher with clear, paper, impstone and CLP.

;strategy Aims to use clear most of the time -- if the other components  
;strategy fail, they revert to clear so it is tried frequently. CLP appears 
;strategy only if paper loses (I assume this must be a clear) and disappears
;strategy as soon as it loses (most likely because a P-Spacer has shifted).
;strategy Other components draw rather too much, but can handle enemies like
;strategy DAT bombers and 7-point imps which the clear cannot.

;strategy Go on... somebody name theirs "Fly"...

        org    think

; -------------------------------------------------------------------------
; Clear
;n-ame AsSuggested 2
; As Assugg, but swaps a and b fields.

gate    dat    -30,      100 
ai      dat    <2667*2,  <2667          ; imp-killing passes.
sb2     spl    #ai-bptr, bptr-gate       
sb1     spl    #sb2-bptr,bptr-gate      ; 2 passes of SPL until bptr dec.
clear   mov.i  *bptr,    >gate
        mov.i  *bptr,    >gate
        djn.f  clear,    {gate          ; copy from Carbon, and decrement.
        dat    0,        0
bptr    mov.ba #sb1,     #sb1                                           

; -------------------------------------------------------------------------

PSTATE EQU 102
STATES EQU 12                    ; State #0 only arises as result of BW.
                                 ; CLP only has two states 
w0     EQU paper                 ; Pulp [first in case of CLPs]      
w1     EQU sb1                   ; SD clear like Assugg         
w2     EQU larva                 ; Newt
w3     EQU cstart                ; CLP variant

      dat    0,   11+win_table-state  ; Lead off with CLP on round 1
in    dat    0,   loss_table-state    ; Otherwise choose appropriate table
      dat    0,   win_table -state    ; too look up next state.
      dat    0,   tie_table -state

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
      mov    0,    -1           ; eliminate accidental stp's
state jmp    @0,   w1           
                                
win_table

t0    spl    #2,   w0      ; Won and brainwashed!? 
                           ;  => Pulp / 1 strikes  
t1    spl    #1,   w0       
t2    spl    #1,   w0      ; Wins increase confidence in choice,
t3    spl    #2,   w0      ; so you end up in 1, 4 or 7 for P/C/S

t4    spl    #4,   w1      
t5    spl    #4,   w1    
t6    spl    #5,   w1       

t7    spl    #7,   w2   
t8    spl    #7,   w2  
t9    spl    #8,   w2

t10   spl    #10,  w3
t11   spl    #10,  w3

tie_table

s0    spl    #6  ,w1       ; Drew and brainwashed => Clear / 2 strikes.

s1    spl    #1  ,w0       
s2    spl    #3  ,w0   
s3    spl    #6  ,w1       ; Draws with Pulp => Clear.

s4    spl    #4  ,w1
s5    spl    #6  ,w1   
s6    spl    #8  ,w2       ; Draws with Clear => Stone.

s7    spl    #7  ,w2       
s8    spl    #9  ,w2    
s9    spl    #6  ,w1       ; Draws with Stone => Clear.

s10   spl    #11, w3       
s11   spl    #5,  w1       ; Draws with CLP   => Clear.

loss_table

r0    spl    #9  ,w2       ; Lost and brainwashed => Stone / 2 strikes.

r1    spl    #2  ,w0        
r2    spl    #3  ,w0   
r3    spl    #11 ,w3       ; Paper Loss => CLP

r4    spl    #5  ,w1        
r5    spl    #6  ,w1   
r6    spl    #2  ,w0       ; Clear Loss => Paper 

r7    spl    #8  ,w2
r8    spl    #9  ,w2    
r9    spl    #6  ,w1       ; Stone Loss => Clear 

r10   spl    #11, w3        
r11   spl    #5,  w1       ; CLP   Loss => Clear

; -------------------------------------------------------------------------
; Pulp Copy

;r-edcode-94 test
;n-ame Pulp
;a-uthor Ian Oversby
;s-trategy Paper without QScan
;assert 1

dest1   equ     1400    ; For Pulp v0.2
dest2   equ     5460
dest3   equ     725

pos1    equ     930     
pos2    equ     3359
pos3    equ     1009    ; clear old copies

;;------------------------------------------------------------

paper   SPL.B   1,      <-300
        MOV.I   -1,     0
        MOV.I   -1,     0
        SPL.B   1,      {-300

silk    SPL.B   @0,     >dest1
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos1
silk2   SPL.B   @0,     >dest2
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos2   ; linear bombing
        MOV.I   bomb,   }pos3   ; anti-vamp
        MOV.I   {silk2, <silk3
silk3   JMP.B   @0,     >dest3
bomb    DAT.F   <2667,  <5334


; -------------------------------------------------------------------------
; Newt Copy

;n-ame Newt NoQ NoBoot
;a-uthor Ian Oversby

gate1   equ     (init-7-dist)
pat     equ     3315
sval    equ     (ipos+5500)
ival    equ     (sval-2500)
dist    equ     3
impy    equ     (imp+sep)
sep     equ     1200
st      equ     2667

; --------------------- Initiate -----------------------------

larva   SPL     init
        MOV     imp,      imp+sep
        JMP     spin

; --------------------- Stone --------------------------------

cbomb   DAT.F   <5335,  #3+hit-gate1
        DAT     0,      0
        DAT     0,      0
init    SPL.B   #0,     <stone-pat
stone   SPL.B   #pat,   <-pat
loop    MOV.I   {0+pat, hit-pat
        ADD.F   stone,  loop
hit     DJN.F   loop,   <stone-pat
        MOV.I   init-dist, >gate1
last    DJN.F   -1,     >gate1

; --------------------- Imp Launcher -------------------------

spin    SPL.B   #st+1,  >prime
prime   MOV.I   impy,   impy
        ADD.F   spin,   jump
jump    JMP.B   impy-st-1, <-535
imp     MOV.I   #st,    *0


; -------------------------------------------------------------------
; CLP Variant
;n-ame CLP2
;s-trategy Beat Clears

ccheck1 equ    (cptr-32)
ccheck2 equ    (cdb+18)

cptr    dat    #cdb+1,   #cdb+50
cstart  mov.x  @ccheck,  *ccheck       ; Establish check point
cloop   mov    cdb,      >cptr         ; Clear at 0.50c
        mov    cdb,      >cptr
ccheck  sne.x  ccheck1,  ccheck2
        jmp    cloop,    >ccheck1-10   
        mov    {cptr,    <cptr         ; If Check tripped,
        jmn.a  -1,       cptr          ; copy warrior
        mov.f  creset,   >cptr         ; Reset copying pointers
        jmp    @cptr,    0             ; and go!
creset  dat    #cdb+1-cptr, #cdb+2800-cptr
cdb     dat    <2667,    <2*2667

        end    

