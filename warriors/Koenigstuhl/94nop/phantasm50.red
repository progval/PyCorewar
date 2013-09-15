;redcode-94 test
;author Robert Macrae
;name Phantasm 50
;assert CORESIZE==8000
;strategy One-shot with SSD Clear and Decoy
;strategy -- should be good all-rounder.


STEP    equ    25
GAP     equ    10
SCST    equ    100          

gate    dat    0,        look-7    

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

      for 12
        dat    0,        0          
      rof 

loop    sub.f  clear,    look        
        mov    db,       *look        ;bomb at 0.25c
look    sne.i  *SCST+4020, SCST       ;scan at 0.50c           
check   djn.f  loop,     <-2667-22    ;trail   0.25c
        add.b  look,     gate         ;bomb 7 before the hit
        jmp    clear,    >3000

      for 50-CURLINE-9
        dat     0,0
      rof

DA  equ    (start+3696+52)                  

db      dat    -4010,    1
start                   
i     for 4
        mov    {DA-3*start,<2+DA-3*start
      rof
        djn.f  loop+1, { DA-1 
        jmp    loop+1, { DA-5

        end    start

