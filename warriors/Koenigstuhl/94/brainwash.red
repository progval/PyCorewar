;redcode-94
;name Brain Wash 11
;author Beppe Bezzi
;strategy headache, bad thoughts, combat stress ?
;strategy you need a good Brain Wash :-)
;strategy v 11 little changes
;assert CORESIZE == 8000

org     think                   ;think first. My grandma told me often :-) 
PIN     203
_RES    equ     #0              ;last result
_STR    equ     #1              ;-strategy in use
soap    equ     6               ;to put in opponents p-space

count   equ     750
step    equ     55               
away    equ     2000            ;boot distance
bcount  equ     #533
dest1   equ     3740
dest2   equ     1860

firest
bootgt  mov     gate,   away
        mov     gate+2, away 
booincr mov     incr,   away+23
        mov     bombm,  away+23

boot    mov     djmp,   away+8
        mov     clr,    <boot
        mov     bombs,  <boot
bjmp    mov     jump,   <boot
        mov     adder,  <boot
        mov     stone,  <boot
        mov     mov2,   <boot
        mov     mov1,   <boot
        jmp     @boot


gate    dat     #1,     #30
        dat     #1,     #30
        spl     #1,     #30
        dat     0,0
        dat     0,0
        dat     0,0
start   
mov1    mov     bombm,   @stone
mov2    mov     bombs,   *stone
stone   mov     2*step+1,*(2*step)+2
adder   add     incr    ,stone           
jump    djn.b   start,  #count 
bombs   spl     #step,  #-step+1
clr     mov     @1,     >gate
djmp    djn.b   clr,    {gate+2

b for 12 
        dat     0,0
rof

incr    dat     2*step, 2*step      
bombm   mov     step,   >step           

for 0
note that Firestorm, sweep and Tornado share some code and boot. This allows
me to save lot of space
Needs some work, done in part with Brain Vamp, and there is a small bug in
Tornado clear, but works.
rof
;--Tornado bomber setup
bomber  mov.ab  bcount, jump
        add.f   bombm,  incr
        mov.i   bombm2, bombm
        mov.i   bstone, stone
        stp.ab  #3,     _STR    ;if wins continue
        jmp     bootgt
bstone  mov     *step+2, *(2*step)+2
bombm2  mov     step,   1       ;This works very well; thanx Paul

;----Sweep setup
sweep
        mov.i   bjmp1,  bjmp
        mov.ab  #away-3,booincr         
        jmp     bootgt
bjmp1   jmp     @-3

;-- Think module
think
res     ldp.ab  _RES,   #0
str     ldp.a   _STR,   str1    ;load strategy in use
        sne.ab  #0,     res     ;check result
        jmp     bwash1          ;lost go for brainwash
        jmn.a   win,    @res    ;win ?
tie     add.a   #1,     str1    ;tie change strat
        mod.a   #3,     str1    ;secure result no Tornado
win     stp.ab  str1,   _STR
str1    jmp     @0,     paper   ;0
        dat     0,      firest  ;1
        dat     0,      sweep   ;2
        dat     0,      bomber  ;3

;-- Brainwashing and paper module
bwash1  slt.ab  str1,   #4      ;just brainwashed ?
        jmp     bomber          ;yes and lost, go for bomber
        jmz.a   bomber, str1    ;paper lost? yes -> bomber
bwash   stp.ab  #0,     _STR    ;no -> bwasher

        spl     1,      <1000   ;dobles processes in use to include bwash pit
paper
        spl     1,      <300    ;\.
        spl     1,      <300    ;-> generate 7 consecutive processes
        mov     -1,     0	;/.

silk    spl     @0,     <dest1  ;split to new copy
        mov.i   }-1,    >-1     ;copy self to new location
        mov     bomba,  }1001
        mov     bomba,  }2001
        mov     {silk,  <silk2
silk2   jmp     @0,     >dest2
bomba   dat     <-2666, {1      ;multi use bomb, against imps and clears.
                                ;Bad with both :-(

brain   stp.ab  #soap,  _STR    ;fixed value seems to work better
wash    spl     brain,  <brain
        mov     bomba,  <brain
        spl     brain,  <brain
        mov     bomba,  <brain
        jmp     brain

for MAXLENGTH-CURLINE-5
        dat     0,0
rof
for 5
        dat     1,1            ;anti djn stream decoy
rof
end
