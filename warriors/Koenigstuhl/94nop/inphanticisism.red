;redcode 
;name Inphanticisism
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Incisive and Phantasm variants

;-------------------------------------------------------- 

STEP    equ    25
GAP     equ    10     
scst    equ    (loop+150)                  

gate    dat    scst+GAP, scst    

      for 5
        dat    0,        0          
      rof 

sweep3  dat    #gate-10, repeat-gate+1
sweep2  dat    #gate-2676, repeat-gate+3
sweep1  spl    #gate-10, repeat-gate+3
clear   spl    #-STEP,   >-STEP        
clean   mov.i  @repeat,  >gate
        mov.i  @repeat,  >gate   
repeat  djn.b  clean,    {sweep1

      for 3
        dat    0,        0          
      rof 

loop    sub.f  clear,    gate        
        sne.i  *gate,    @gate         
check   djn.f  loop,     <-1510     ;may as well build a decoy
        jmp    clear,    <gate

      for 25
        dat    0,        0          
      rof 


;--------------------------------------------------------

step    equ     45                   ; I did tweak the step.
stfang  equ     (pfang+1+step*5)
sboot   equ     (main+2541+2300)
main    equ     (pit-56)

; ---PITS---
pit     spl     pit2,  }pclear
	mov     dbomb, >pclear
hit1    jmp     pit,   }pclear
	dat     0, 0
	dat     0, 0
pit2    mov     dbomb, >pclear
        jmp     -1,    }pclear
; ---------

hit2    dat     0, 0
sneak   mov     bomb, <bclear    ; Booted
        jmp     -1,   {bomb      ; Booted : tighter, pinker carpet
pclear  dat     0, 350
	dat     0, 0

hit3    dat     0, 0
bomb    dat     0, -11           ; Booted
bclear  dat     0, -31           ; Booted
	dat     0, 0
jbomb   jmp     #0, #0

hit4    dat     0, 0


; --Bomber--
stcode
inc     spl     #-step, step

	dat     0,0

vamp    add     inc,   fang
pfang   mov     fang,  @fang    ; drop fang
	mov     jbomb, *fang    ; drop jmp bomb
        jmp     vamp

      for 6
	dat     0, 0
      rof

; --Clear--

myclear mov     dbomb,   >pclear
        jmp     -1,      }pclear 

hit5    dat     0,0
dbomb   dat     0, -pclear+1
	dat     0, 0
	dat     0, 0
fang    jmp     pit-stfang, stfang

; ----------------------------------------------
; Boot and Selection Logic

select
sfrom spl 1,       sneak+2
      mov <sfrom,  {sto
      mov <bptr,   {bptr
      mov.i select,#0              ; 3 proc
      mov.i select,#0              ; 5 proc
      spl 2,       0               ; 8 or 10
      jmp *tab,    }0
      jmp @tab,    }0       

tab   dat vamp+0, vamp+1        ; 5 to Vamp
      dat vamp+2, vamp+3        ; 1 to Sneak
      dat vamp+0, myclear       ; 1 to Clear 
sto   dat sboot+2,NotLp         ; 0 or 1 to NotLp?
bptr  dat sboot+7,bomb+2        ; 1 or 2 Wasted

NotLp mov tab, @tab+2           ; Kill the processes off
      mov tab, *tab
      mov tab, *sto
      jmp loop,{0               ; and run Phantasm



      end select
