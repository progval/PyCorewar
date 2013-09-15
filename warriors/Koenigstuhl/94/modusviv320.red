;redcode-94
;name Modus Vivendi 3/20
;author Robert Macrae
;strategy Simple switcher based on last result: 
;strategy Win -> Stone, Lose -> Paper, Draw -> Usually Paper. 
;assert VERSION >= 80

; Will accept a Win/Loss series, which is fair, and will attempt to enforce
; this. Both warriors must alternate Papers and Stones; if my opponent
; deviates towards Stones, I will score better. If he deviates towards
; Papers, we will both score worse. It is hard to exploit this algorithm;
; the only weakness is the occasional Stone played to prevent long strings
; of draws. This warrior will lose to a version which never tries to break
; strings of draws, but will score much better against other friendly
; warriors.

; First offer comes faster than in 5/10, but subsequent slower.

; --------------------------------------------------------------------------
; Variables

;  _Count is tested to see whether I should try Stone after a run of Papers.
;  Play a stone after FIRST draws, and again after every EVERY draws.
;  Brainwashing will cause resets to counter, so I cover both STPs when
;  I play paper. If FIRST is more than 10 or so BW may still have an effect.

FIRST   EQU 3
EVERY   EQU 20
_Res    EQU #0
_Count  EQU #1

; --------------------------------------------------------------------------

Coerce  LDP.a   _Res,  JumpVec  ; Get last result
        SNE.a   #1,    JumpVec
         STP    #0,    _Count   ; Reset count on a win
        MOV.i   #0,    -1
        JMP     JumpVec         ; and execute selected warrior

; --------------------------------------------------------------------------

Count   LDP.a   _Count, Stoc     ; How many draws without a win?
        ADD.a   #1,     Stoc
Stoc    STP     #0,     _Count
        MOD.a   #EVERY, Stoc     ; Play a stone after FIRST, then
        SNE.a   #FIRST, Stoc     ; again after every EVERY.
         JMP    StoAdd
        JMP     PapAdd           ; Otherwise, paper.

; --------------------------------------------------------------------------
; Jump Vectors

; Converts -1,0,1,2 result code into an address for execution.

        DAT     0,  StoAdd            
JumpVec JMP     @0, PapAdd        
        DAT     0,  StoAdd            
        DAT     0,  Count

; ---------------------------------------------------------------
; Paper

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

PapAdd  mov.i   #0, Stoc               ; Reduce BW if play paper
        
split   spl     1,              <-200       
        spl     1,              <-300       
        mov.i   -1,             0
tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1       ; Stun here with L4 carpet 
        mov.i   {-FSTEP,        <FSTEP      ; Scan and hit here
        mov.i   {cel1,          <ncl1       
ncl1    jmp     @ncl1,          >NSTEP

        dat     0, 0                           
        dat     0, 0                           
        dat     0, 0                           
        dat     0, 0                           

; ---------------------------------------------------------------
; Stone 

StoAdd  equ     dbomb+1

dbomb   dat     >-1, >1
        spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                    ; gets bombed to start coreclear
        djn.f   -2, <-1151

        END     Coerce

