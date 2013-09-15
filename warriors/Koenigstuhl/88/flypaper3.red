;redcode 
;name FlyPaper 3.0
;author J.Layland
;strategy QuickScanner->Paper, ideas from GammaPaper/Plasma/Paratroops
;strategy 2.0-- now uses Agony-based cmp-scanner, added bootstrap routine.
;strategy Imp killing replicator copied from Gamma Paper
;strategy 3.0-- New (better???) scanner, changed constants/spacing
;strategy sidestep decoys??
;assert 1

skip    equ 70
dist2   equ -20
init    EQU (incr-dist-1)    ; last+skip-1 ;incr-dist-100 ;last+skip-1
dist    EQU 10

boot    mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
dst     jmp @0, src-skip


incr    ADD step, scan
scan    CMP init, init+dist
        SLT #last+skip-1+dist, scan
        JMP incr
        mov scan, scan+10
        MOV step, <scan+10
        DJN -1, #dist+20 
        jmp rep+skip
step    DAT #dist2, #dist2
src     dat #0

;;;break
rep     spl     p2 
        spl     1
        spl     1
        spl     1       ;start 8 processes going
        spl     p002
        spl     p003
        spl     p004


l001    mov     #8,     8               ;set source
p001    mov     <l001,  <t001           ;make copy
t001    spl     @0,     5301+200*001    ;split to copy
        mov     3, <t001
        mov     3, <t001
        jmz     l001,   l001            ;loop
        mov     @-2667, 2667
        dat     <2667, #1
  

l002    mov     #8,     8               ;set source
p002    mov     <l002,  <t002           ;make copy
t002    spl     @0,     5301+200*002    ;split to copy
        mov     3, <t002
        mov     3, <t002
        jmz     l002,   l002            ;loop
        mov     @-2667, 2667
        dat     <2667, #1
  

l003    mov     #8,     8               ;set source
p003    mov     <l003,  <t003           ;make copy
t003    spl     @0,     5301+200*003    ;split to copy
        mov     3, <t003
        mov     3, <t003
        jmz     l003,   l003            ;loop
        mov     @-2667, 2667
        dat     <2667, #1
  

l004    mov     #8,     8               ;set source
p004    mov     <l004,  <t004           ;make copy
t004    spl     @0,     5301+200*004    ;split to copy
        mov     3, <t004
        mov     3, <t004
        jmz     l004,   l004            ;loop
        mov     @-2667, 2667
        dat     <2667, #1
  

p2      spl     1
        spl     1
        spl     1
 
        spl     p1002
        spl     p1003
        spl     p1004


l1001   mov     #8,     8               ;set source
p1001   mov     <l1001, <t1001          ;make copy
t1001   spl     @0,     6101+200*001    ;split to copy
        mov     3, <t1001
        mov     3, <t1001
        jmz     l1001,  l1001           ;loop
        mov     @-2667, 2667
        dat     <2667, #1
 

l1002   mov     #8,     8               ;set source
p1002   mov     <l1002, <t1002          ;make copy
t1002   spl     @0,     6101+200*002    ;split to copy
        mov     3, <t1002
        mov     3, <t1002
        jmz     l1002,  l1002           ;loop
        mov     @-2667, 2667
        dat     <2667, #1
 

l1003   mov     #8,     8               ;set source
p1003   mov     <l1003, <t1003          ;make copy
t1003   spl     @0,     6101+200*003    ;split to copy
        mov     3, <t1003
        mov     3, <t1003
        jmz     l1003,  l1003           ;loop
        mov     @-2667, 2667
        dat     <2667, #1
 

l1004   mov     #8,     8               ;set source
p1004   mov     <l1004, <t1004          ;make copy
t1004   spl     @0,     6101+200*004    ;split to copy
        mov     3, <t1004
        mov     3, <t1004
        jmz     l1004,  l1004           ;loop
        mov     @-2667, 2667
        dat     <2667, #1
 
        dat     <2667, #1 
        dat     <2667, #1 
bomb    dat     <2667, #1 
 
last    end     boot
