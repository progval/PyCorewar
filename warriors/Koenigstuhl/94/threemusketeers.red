;redcode-94
;name Three Musketeers
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Table-based switcher with Bomber, Oneshot and Imp/Dclear
;strategy Logic based on Alladin, but switches on loss or draw.
;strategy Imp is intented to upset hyper-aggressive switchers;
;strategy hopefully I will not get dragged into too many draws...

; -------------------------------------------------------------------------
; Tornado / DClear

step    equ     85
count   equ     533
away    equ     -1000

tornado mov     bm,     bm+away+30
        mov     bd,     bd+away+30
        mov     <tptr,  {tptr
        mov     <tptr,  {tptr
        djn     -2,     #4
tptr    jmp     away+djmp+1, djmp+1

bomber  mov     bm+30,  *stone
        mov     bm+30,  @stone
stone   mov     step+2, *(2*step)+2         
        sub     incr,   stone           
jump    djn.b   bomber, #count
incr    spl     #-3*step,<-3*step        
clr     mov     bd+30,  >bomber-5
djmp    djn.f   clr,    >bomber-5

bd      dat     <2667,  #djmp-bomber+8
bm      mov     step,   1        

; -------------------------------------------------------------------------

PSTATE EQU 110
STATES EQU (loss_table-win_table)

      dat    0,init_table-state
in    dat    0,loss_table-state
      dat    0,win_table -state
      dat    0,tie_table -state

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
      mov    0,-1               ; eliminate accidental stp's
state jmp    @0,w1

w0    EQU dboot         ; Digitalis
w1    EQU tornado       ; Tornado
w2    EQU booph         ; Phant 43

win_table

t0    spl    #3,   w0      ; Won and brainwashed!? => Di / 2 strikes;   
t1    spl    #1,   w0      
t2    spl    #1,   w0
t3    spl    #2,   w0   
t4    spl    #4,   w1      
t5    spl    #4,   w1    
t6    spl    #5,   w1       
t7    spl    #7,   w2   
t8    spl    #7,   w2  
t9    spl    #8,   w2      

tie_table
loss_table

s0    spl    #6  ,w1       ; Lost and brainwashed => Tornado / 2 strikes.
s1    spl    #2  ,w0       
s2    spl    #3  ,w0   

init_table                 ; Lead off with Tornado / 1 strike.

s3    spl    #5  ,w1       ; Torn 1S 
s4    spl    #5  ,w1
s5    spl    #6  ,w1   
s6    spl    #8  ,w2       ; Phant 1S
s7    spl    #8  ,w2
s8    spl    #9  ,w2    
s9    spl    #3  ,w0       ; Digitalis 2S

; -------------------------------------------------------------------------
; Phantasm 43d.

; Somewhat messy due to removed spacers.

STEP    equ    25
GAP     equ    10     
scst    equ    (sloop+3798)                  
BOOT    equ    (-2500)

gate    dat    scst+GAP+3+5, scst+3+5

;      for 5
;        dat    0,        0          
;      rof 

sweep3  dat    #gate-10, repeat-gate+1+5
sweep2  dat    #gate-2676, repeat-gate+3+5   ; Phasing as phant 49 etc
sweep1  spl    #gate-10, repeat-gate+3+5
clear   spl    #-STEP,   >-STEP    
clean   mov.i  @repeat,  >gate-5
        mov.i  @repeat,  >gate-5   
repeat  djn.b  clean,    {sweep1

;      for 3
;        dat    0,        0          
;      rof 

sloop   sub.f  clear-3,    gate-3-5        
        sne.i  *gate-3-5,  @gate-3-5         
check   djn.f  sloop,      <3800        ;may as well build a decoy
        jmp    clear-3,    <gate-3-5

bloop   mov    <ptr1,    {ptr1
booph   mov    <ptr1,    {ptr1
        mov    <ptr2,    {ptr2
        djn    bloop,    #4
        mov    gate,     gate-3-5+BOOT
ptr2    jmp    check+2+BOOT, check+2
ptr1    dat    repeat+1-3+BOOT, repeat+1

      for 11
        dat    0,        0          
      rof 

; ----------------------------------------------------------------------
; Digitalis

; Only 16 processes in imp, and extra process to D-clear.

ist      equ    1143
bptr1    equ    2000

dboot    mov    ptr,         bptr1
         mov    clrb,        bptr1
boot2    mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3

         spl    @bptr3,      }-1000        ; Some protection against QS

istart   spl    1,           }-1100
         spl    1,           }-1150
         spl    1,           }-1200
         spl    1,           }-1350
         spl    2,           }-1250
         djn.f  imp,         <-250
         add    bst,         -1
         djn.f  @bptr3,      <-400

bst      dat    ist,         -100

imp      mov.i  #ist,        *0
         mov.i  #ist,        *0          ; QS resistance

ptr      dat    0,           2150
clrb     dat    >2667,       25
         spl    #0,          >ptr-16
loop     mov    clrb-16,     >ptr-16
cc       djn.f  loop,        >ptr-16

bptr3    dat    cc+1,        boot2+bptr1+19

         end    think
