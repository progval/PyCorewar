;redcode-94 quiet
;name Taking Names
;author P.Kline
;strategy sne.x/seq.x scanner using spl-spl-jmp bomb
;strategy and continuous forward-clear
;strategy added decoy
;assert 1

step    equ    98
boot    equ    4700
reset   equ    (attack-20)
clrptr  equ    (reset-2)
        
cpins   dat    jump-clrptr+2
rsins   dat    #step-2,#step
    
attack  mov    jump,*comp           ; drop wide bomb on a-pointer
compptr mov    split,{comp
        mov    split,{comp          ; after bombing, reset to
        sub    reset,@compptr       ; make b-pointer the next a-pointer
        
scan    add    split,@compptr
comp    sne    2*step,3*step        ; take a look
        add    split,@compptr
        seq    *comp,@comp          ; take another look
        slt    #100+step,@compptr   ; don't attack self
ctr     djn    scan,#2500           ; countdown to finish
        jmn    attack,-1

split   spl.i  #(2*step),#(2*step)
clear   mov    reset,>clrptr        ; continuous forward clear
jump    jmp    -1

start   mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    <bp,{bp
        mov    rsins,reset+boot
        mov    cpins,clrptr+boot
        jmp    scan+boot
bp      dat    jump+1+boot,jump+1
    for 10
        dat    0,0
    rof
    for 27
        dat    bp+1000,1
        dat    1,1
    rof
        end    start
