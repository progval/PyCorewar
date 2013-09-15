;redcode-94
;name System D 2-12/20 
;author Robert Macrae
;strategy Simple switcher based on last result: 
;strategy Win -> Stone, Lose -> Paper, Draw -> Usually Paper. 
;assert VERSION >= 80

; Will accept a Win/Loss series, which is fair, and will attempt to enforce
; this. Both warriors must alternate Papers and Stones; if my opponent
; deviates towards Stones, I will score better. If he deviates towards
; Papers, we will both score worse. It is hard to exploit this algorithm;
; the only weakness is the occasional Stone played to prevent long strings
; of draws.

; To minimise the cost of these friendly gestures, this version checks
; whether the opponent is reasonably friendly. If so, it is slightly less
; friendly to exploit this -- the other warrior should offer first. If not,
; it is very friendly to maintain a high average score against nasty
; opponents. This should capture some of the advantages of a selfish
; warrior without total reliance on the charity of others.

; --------------------------------------------------------------------------
; Variables

;  _ThisT stores the current number of draws before I play a stone
;  _Lock is set to KEY when I establish _ThisT
;  _Count is compared to _ThisT every run of draws starts.
;  I Play a stone after _ThisT draws, and then after every EVERY draws.
;  I cover all STPs before playing as BW protection, though Paper may
;  still execute enemy STPs.

MAXT    EQU 12
DEFT    EQU 2
KEY     EQU 7
EVERY   EQU 20
_Res    EQU #0
_Count  EQU #1
_ThisT  EQU #2
_Lock   EQU #3

; --------------------------------------------------------------------------

Coerce  LDP.a   _Res,  JumpVec  ; Get last result
        JMP     JumpVec         ; and execute appropriate code

; --------------------------------------------------------------------------
; Jump Vectors

; Converts -1,0,1,2 result code into an address for execution.

        DAT     0,  Stone       ; First Round     
JumpVec JMP     @0, Lose         
        DAT     0,  Win           
        DAT     0,  Draw

; --------------------------------------------------------------------------

Draw    LDP     _Lock,  #0           
        SNE     #KEY,   -1           
         JMP    WaitT                ; If Locked, execute appropriate wait

        LDP.a   _ThisT, StowT        ; Else increment the number of draws
        ADD.a   #1,     StowT        
StowT   STP     #0,     _ThisT
        SLT.a   #MAXT,  StowT        
         JMP     Paper               ; If draws below MaxT, more papers.

Abw1    STP     #DEFT,  _ThisT       ; Else set default wait period,
        JMP     LockIt               ; and play stone to end the draws.

; --------------------------------------------------------------------------

WaitT   LDP.a   _Count, Stoc     ; How many draws without a win?
        ADD.a   #1,     Stoc
Stoc    STP     #0,     _Count
        MOD.a   #EVERY, Stoc     ; Play a stone after _ThisT, then
        LDP     _ThisT, #0       ; again after every EVERY.
        SNE.ba  -1,     Stoc     
         JMP    Stone
        JMP     Paper            ; Otherwise, paper.

; --------------------------------------------------------------------------

Win     STP     #0,     _Count        ; Reset count on a win
        LDP     _Lock,  #0
        SNE     #KEY,   -1            ; If Locked play stone.
         JMP    Stone
        LDP.a   _ThisT, FinalT        ; If _ThisT is zero play stone
        JMZ.a   Stone,  FinalT        
;b-reak
        ADD.a   #1,     FinalT        ; Otherwise opponent is friendly, so
FinalT  STP     #0,     _ThisT        ; set _ThisT to be a little less 
LockIt  STP     #KEY,   _Lock         ; friendly than him, and lock.
        JMP     Stone                 
                                        
; ---------------------------------------------------------------
; Paper

TSTEP   equ 1800
CSTEP   equ 3740
NSTEP   equ -1922
FSTEP   equ 1870

Lose
Paper   MOV.i   #0,     Abw1
        MOV.i   #0,     StowT
        MOV.i   #0,     Stoc
        MOV.i   #0,     LockIt
        MOV.i   #0,     FinalT
        MOV.i   #0,     Win

split   spl     1,              <-200       
        spl     1,              <-300       
        mov.i   -1,             0
tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1       
        mov.i   {-FSTEP,        <FSTEP      
        mov.i   {cel1,          <ncl1       
ncl1    jmp     @ncl1,          >NSTEP

        dat     0, 0                           
        dat     0, 0                           
        dat     0, 0                           
        dat     0, 0                           

; ---------------------------------------------------------------
; Stone 

Stone   MOV.i   #0,     Abw1
        MOV.i   #0,     StowT
        MOV.i   #0,     Stoc
        MOV.i   #0,     LockIt
        MOV.i   #0,     FinalT
        MOV.i   #0,     Win
        JMP     dbomb+1

dbomb   dat     >-1, >1
        spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                    
        djn.f   -2, <-1151

        END     Coerce

