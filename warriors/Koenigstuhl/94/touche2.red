;redcode-94
;name Touche 2
;author Robert Macrae
;assert CORESIZE == 8000

;strategy Three Musketeers with some minor tweaks.
;strategy ... and without the bug which crippled Touche!

; 1 -- replace Tornado
; 2 -- add SPL to Digitalis for heavier imp
; 3 -- tweak order of execution
; 4 -- tweaked phantasm
; 5 -- boot bug fixed!
 
; -------------------------------------------------------------------------

; Tornado / DClear

 
step    equ     -45               
DIST
away    equ     3900            ;more or less 3900 :-)
gate1   equ     (gate-4)

tornado 
	mov     gate,   }pt2
	mov     gate,   *pt2
	mov     last,   <pt1
	spl     1,      1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1

go      djn.b   @pt1,   #2      ;start Tornado
	mov     gate,   <pt1

pt1     div.f   #last,  #last+1+away
pt2     div.f   #gate+away-5,#1

start
	dat     -25,            last-gate1+5
warr
gate    
	dat     -25,            last-gate1+15
bombs   spl     #(step+1),      -step           ;hit spl
start1  sub     incr,           @b1           
stone   mov     (0*step)+jump+1,*(1*step)+jump
b2      mov     bombs,          @stone
b1      mov     bombm,          *stone
jump    jmz.b   start1,         #0              ;hit by spl

clr     mov     db,             >gate1
djmp    djn.f   clr,            >gate1
incr    dat     >-3*step,       >-3*step      
bombm   dat     <1,             {1
last
db      dat     <2667,          #18





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



w2    EQU dboot         ; Digitalis

w1    EQU tornado       ; Tornado

w0    EQU booph         ; Phant 43



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

s6    spl    #8  ,w2       ; Dig 1S

s7    spl    #8  ,w2

s8    spl    #9  ,w2    

s9    spl    #2  ,w0       ; Phant 1S



; -------------------------------------------------------------------------

; Phantasm Variant



; Somewhat messy due to removed spacers.



;STEP    equ    25

;GAP     equ    10     

;scst    equ    (sloop+3798)                  

BOOT    equ     (-200)


STEP    equ    14
GAP     equ    7     
scst    equ    (loop+284)                  



dgate   dat    scst+GAP+3+5, scst+3+5



;      for 5

;        dat    0,        0          

;      rof 



sweep3  dat    #dgate-10, repeat-dgate+1+5

sweep2  dat    #dgate-2676, repeat-dgate+3+5   ; Phasing as phant 49 etc

sweep1  spl    #dgate-10, repeat-dgate+3+5

clear   spl    #-STEP,   >-STEP    

clean   mov.i  @repeat,  >dgate-5

        mov.i  @repeat,  >dgate-5   

repeat  djn.b  clean,    {sweep1



;      for 7  ;  3

;        dat    0,        0          

;      rof 



sloop   sub.f  clear-7,    dgate-7-5        

        sne.i  *dgate-7-5,  @dgate-7-5         

check   djn.f  sloop,      <-1501     ;3800 ;may as well build a decoy

        jmp    clear-7,    <dgate-7-5



bloop   mov    <ptr1,    {ptr1

booph   mov    <ptr1,    {ptr1

        mov    <ptr2,    {ptr2

        djn    bloop,    #4

        mov    dgate,    dgate-7-5+BOOT

ptr2    jmp    check+2+BOOT, check+2

;   ptr1    dat    repeat+1-3+BOOT, repeat+1

ptr1    dat    repeat+1-7+BOOT, repeat+1




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

         spl    1,           }-1450

         spl    2,           }-1250

         djn.f  imp,         <-250

         add    bst,         -1

         djn.f  @bptr3,      <-400



bst      dat    ist,         -100



imp      mov.i  #5,          *ist

         mov.i  #5,          *0          ; QS resistance



ptr      dat    0,           2150

clrb     dat    >2667,       25

         spl    #0,          >ptr-16

loop     mov    clrb-16,     >ptr-16

cc       djn.f  loop,        >ptr-16



bptr3    dat    cc+1,        boot2+bptr1+19



         end    think

