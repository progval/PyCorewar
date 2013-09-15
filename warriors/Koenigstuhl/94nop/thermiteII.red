;redcode-94
;name Thermite II
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Same old strategy, but nastier...

; Therm 3.7 had everything I wanted for scan and bomber (Brand 3.3).
; Now check for any surplus cells, clean up logic, shuffle scan
;  -- the tedious stuff.
; *****  REMEMBER  *****  not to publish scan in this order!

; Therm 4.1 tries launching bomber, against oneshots!

org     start

qstep   equ     6                  ; gap between bombs
qrounds equ     8                  ; number of bombing runs
qgap    equ     (qrounds * qstep)  ; Space covered by each bomb-type
qspread equ     (qgap*3)           ; Total coverage

bigst   equ     113
qstart  equ     start+1000
qst     equ     qstart -(4*bigst)

; ------------------------------------------------------

qspb    spl     -1,      #qgap+1      ; 3 bombs for QS
qmvb    mov     -qgap,   >-qgap
qjmb    jmp     -qgap,   -2*qgap+qstep
qincr   dat     #qstep,  #qstep       ; step for QS

which   add.b   found,  found2    ; (From Pyramid)
        sne.i   @found, @found2   ; Is it in first two?
          add.ab  #2*bigst, found
        sne.i   qspb-1, @found    ; Is it first or third?
          add.ab  #bigst,found

        mov     qjmb,   @found
found   seq     qspb-1, *0        ; look qgap back from hit     
         sub.ab #qgap/2, found    ; and sub qgap/2 if found.
        
qplace  add.b   found,  #-qgap/2+qstep+found
        mov.i   qspb,   @qplace   ; Preposition first SPL
        add.ba  found,  qstone
        add.b   found,  qstone    ; Initialise Tornado pointers

qst1    mov     qjmb,    *qstone       ; Tornado bombing engine
        mov     qmvb,    @qstone       ; "to fill enemy with hot
qstone  mov     @3*qgap/2+found, *qgap/2+found
        sub.f   qincr,   qstone        ; Adapted to SPL/MOV/JMP
        djn.b   qst1,    #qrounds      ; and to cover wider range.

launch  mov     cp,      cp+4000       
lloop   mov     {launch, <launch
        mov     {launch, <launch
        mov     {launch, <launch
        djn     lloop,   #2
        mov     wipe,    wipe+4000-1
        mov     {-1,     <-1
        mov     sm,      sm+4000+3
found2  jmp     @launch, #bigst+found  ; pointer to second hit  

;r edcode-94
;n ame Brand 3.3
;a uthor Robert Macrae
;s trategy Rebadged Torch :) 
;s trategy New constants, anti-paper profile.

; 3.2 tried new constants with no trailing MOV and a 2603 runlength;
; 3.3 moves in gate and mvb for extra paper-resistance.

step1    equ   899    
step2    equ   902
 
gate     dat   -100, 200                
wipe     dat   -2, #cp-gate+2
; 1 DAT
sp       spl   #step2, step2+1   
msm      mov   sm+3, *tgt+2*step1+step2    
msp      mov   sp, @msm           
in       add   #step1+step2, @msp  
tgt      djn.f msm, <4502           ; bombed with spl to start clear
clr      mov   wipe-1, >gate-1
cp       djn.f clr, {gate-1
; 3 DATs
sm       mov   -step2, >-step2      ; mov half of the incendiary

         FOR 11
           dat 0, 0
         ROF

start
s1 for 5
        sne.x   qst+4*bigst*s1, qst+4*bigst*s1+bigst*1
        seq.x   qst+4*bigst*s1+bigst*2, qst+4*bigst*s1+bigst*3
        mov.ab  #qst+4*bigst*s1-found, found  
     rof
        jmn  which,   found
s2 for 5
        sne.x   qst+4*bigst*(s2+5), qst+4*bigst*(s2+5)+bigst*1
        seq.x   qst+4*bigst*(s2+5)+bigst*2, qst+4*bigst*(s2+5)+bigst*3
        mov.ab  #qst+4*bigst*(s2+5)-found, found
     rof
        jmn  which,   found
s3 for 5
        sne.x qst+4*bigst*(s3+10), qst+4*bigst*(s3+10)+bigst*1
        seq.x qst+4*bigst*(s3+10)+bigst*2, qst+4*bigst*(s3+10)+bigst*3
        mov.ab  #qst+4*bigst*(s3+10)-found, found
     rof
        jmn.b   which, found
        jmp     launch, {-500
     
        end 
