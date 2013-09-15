;redcode-94
;name Queasy 1.4
;author Robert Macrae
;strategy  Quick-scan -> mod-1 bomber.
;strategy     Faster trap, new constants, indirect bites.
;assert CORESIZE == 8000

DIS     equ 81                           ; QS step size.          
Lookat  equ look+237+8*(qscan-1)*DIS     ; Repeated part of qscan expression.                   

traptr  dat     #0,         #trap        ; Points to trap
bite    jmp     @traptr,    0            ; Vampire bite, indirect via traptr 

; If I bite, there will be lots of pointers to these, so I keep them away 
; from the trap to protect it against indirect bombers. 

look
qscan   for     6  
        sne.i   Lookat+0*DIS, Lookat+2*DIS
        seq.i   Lookat+4*DIS, Lookat+6*DIS
        mov.ab  #Lookat-bite-2*DIS, @bite
        rof

        jmn     test+1, bite   ; Save lots of cycles

qscan   for     6  
        sne.i   Lookat+48*DIS, Lookat+50*DIS
        seq.i   Lookat+52*DIS, Lookat+54*DIS
        mov.ab  #Lookat-bite+46*DIS, @bite
        rof

        jmn     test+1, bite   ; Save a few cycles

qscan   for     6  
        sne.i   Lookat+1*DIS, Lookat+3*DIS
        seq.i   Lookat+5*DIS, Lookat+7*DIS
        mov.ab  #Lookat-bite-DIS, @bite
        rof

        jmn     test+1, bite   ; Well...

qscan   for     6   
        sne.i   Lookat+49*DIS, Lookat+51*DIS
        seq.i   Lookat+53*DIS, Lookat+55*DIS
        mov.ab  #Lookat-bite+47*DIS, @bite
        rof

; Intention is to place points evenly through core. The ordering 
; I use means 1) initial compares are >100 apart for maximum
; efficiency against long opponents, and 2) each block of 4 are evenly 
; spaced, for ease of identification in the test loop.

test    jmz.b   blind,  bite            ; If no address stored, no hit.
        add     #DIS*2, bite            ; Loop through possible hits
        jmz.f   -1,     @bite           ; to find the nonzero element.

        mov     modron, @bite           ; Quick SPL 0 pre-bomb...

        add     #49,    bite            ; Aim 49 past the hit
attack  sub.ba  bite,   bite            ; 
loop    mov     bite,   @bite           ; Vampire step over target at 
        add.f   step,   bite            ; 6 locations / 3 cycles so
        djn     loop,   #24             ; space=6 => 72 cycles, 144 locs.

; Tried to bite all over the target if found; now launch dwarf.

blind   mov     modron+3, trap+2499+3 ; Launch Modron.
        mov     {blind,   <blind      ; Should really hide pointer...
        mov     {blind,   <blind      
        mov     {blind,   <blind        
        jmp     @blind,   <blind       

trap    spl     0,      >-200         ; Lackadaisical attempt at gates...     
        spl     -1,     >-200+2667    ; Each should increment many times
        jmp     -2,     >-200+2*2667  ; between imp steps, but then _whole_ 
                                      ; imp moves! Blows away rings.

; Hope is to out-split silks if I hit them early enough. This arangement
; gives good split rate in 3 words, carefully hidden so Modron doesn't bomb
; it for 50K cycles.

step    dat     #6,     #-6           ; QS step size.

modron  spl     #1469,  >-155         ; Mod 5 > attack and Mod 1 bomb.
        add.x   -1,     1             ; >-155 will gate if loop is DAT-bombed.
        mov.i   }2,     -3109-2       ; Offset misses dwarf, trap (for 50K).
        jmp     -2,     {-3           ; Decrements step for Mod-1 bombing.
                                      
; Modron uses an decrementing step to cover most of the core with DAT bombs, 
; while using a regular mod-5 } attack. (Looking at the code now, { might
; be better since it pinkens bombs -- hmmm...) It loses to imps or papers 
; unless the quickscan really hurt them, but does OK against most others. 

        end     look
