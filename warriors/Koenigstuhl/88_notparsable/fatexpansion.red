;redcode-icws verbose
;name Fat Expansion (V)
;author Philip Thorne [RM/JM]
;strategy 05.10.02b Test derivative of a Robert Macrae prog/comments.
;strategy  Roberts warrior, One Fat Lady, was a tournament winner
;strategy  based on half of the '88 instructions. This isn't :-)
;strategy 20.10.02  Trying QS from John Metcalf's Vala.
;
;         Slimmed-down the vamp pre-launch and re-introduced self-SPL
;         Better pit (nothing special - just using full '88 inst set)
;         Booting imp [Not] & pit. Breaking-up body during (slow) boot
;
;         Joint 8000 * 8192 version
;
; howdo    This made #19 on the '88 and is #9 on the ICWS KOTH hills.
;
;assert (CORESIZE==8192) || (CORESIZE==8000)

; -------------------------------------------------------------

;=== Scan from Vala [John Metcalf] unchanged ===

for 1

        qf equ (qgo+1*qs)
        qd equ 100
        qs equ (2*qd)
        qi equ 7                             
        qr equ 7
qbomb   dat <qi/2-qi*qr,<qi*qr-qi/2
        dat #12*qs      ;a
qp1     dat #5*qs       ;b
qp2     dat #2*qs       ;c
qp3  ;  dat #1*qs       ;d

qgo     cmp qd+qf,      qf ;d
        jmp qskip,      <qf+4

        cmp qd+qf+qs*5, qf+qs*5
        jmp qfast,      <qf+qs*5+4
        cmp qd+qf+qs*12,qf+qs*12
q1      djn qfast,      #qp1

        cmp qd+qf+qs*7, qf+qs*7
        jmp qslow,      <qf+qs*7+4
        cmp qd+qf+qs*14,qf+qs*14
        jmp qslow,      <q1
        cmp qd+qf+qs*10,qf+qs*10
q2      djn qslow,      #qp2
        cmp qd+qf+qs*2, qf+qs*2
        jmp qslow,      <qfast

        cmp qd+qf+qs*8, qf+qs*8
        jmp qslower,    <qf+qs*8+4
        cmp qd+qf+qs*15,qf+qs*15
        jmp qslower,    <q1
        cmp qd+qf+qs*11,qf+qs*11
        jmp qslower,    <q2
        cmp qd+qf+qs*9, qf+qs*9
q3      djn qslower,    #qp3
        cmp qd+qf+qs*3, qf+qs*3
        jmp <qfast,     <qf+qs*3+4
        cmp qd+qf+qs*6, qf+qs*6
        jmp <qfast,     <q2
        cmp qd+qf+qs*4, qf+qs*4
        jmp <qfast,     <q3
        cmp qd+qf+qs*16,qf+qs*16
        slt <q3,        <q1

        jmz pgo,        qd+qf+qs*8+10

qslower add @q3,        @q2
qslow   add @q2,        qkil
qfast   add @q1,        @qslow

qskip   jmn qloop,      @qkil

; qskip cmp <734,       @qkil       ; would these two lines be
;       jmp qloop,      <qf+qs*6+4  ; better than the one above?

        add #qd,        qkil
qloop   mov qbomb,      @qkil
qkil    mov qbomb,      <qf
        sub #qi,        @qloop
        djn qloop,      #qr+2

        pdist equ (papto+1001)
        pstep equ 6300  ; 7324  ; 3865
        sdist equ 1285  ; 948   ; 1283
        sstep equ 24    ; 168   ; 24
rof

;===
for 0
; QS based on my favourite "special tournament version of Sauron" [RM]
; PBT I changed this a bit but preferred Vala [above]
core    equ     (look+102)

look                    
qscan   for     6  
          cmp  look+((qscan+2)*100)+3, look+(CORESIZE/2)+((qscan+2)*100)+3
          mov     #look+((qscan+2)*100)-point+3, @point
        rof
        
        cmp     #0, point
         jmp    found

qscan   for     7  
         cmp  look+((qscan+10)*100)+3,look+(CORESIZE/2)+((qscan+10)*100)+3
          mov     #look+((qscan+10)*100)-point+3, @point
        rof
        
        cmp     #0, point
         jmp    found

qscan   for     7;8  
          cmp  look+((qscan+18)*100)+3, look+(CORESIZE/2)+((qscan+18)*100)+3
          mov     #look+((qscan+18)*100)-point+3, @point
        rof
        
        cmp     #0, point
         jmp     found         
        jmp     boot

spb     DAT     <0, #-7         ;PBT
        
found   cmp     core, @point
         add     #(CORESIZE/2), point
        add     #(CORESIZE/2), point    ; point now points to hit
        mov     spb, @point
        add     #45, point
        cmp     core, @point    ; Scan at +45, and start
         add     #53, point     ; bombing at +45
        add     #-53, point     ; or -7
        
loop    mov     spb, <point     ; 40% bomber, backwards through
point   mov     spb, @0         ; his code
        add     #-14, point
        cmp     core, @point    ; Loop over whole target 
        jmp     loop, <-10      ; PBT, was point. Now really 40%
                                ; PBT removed #98 search
rof

; ---------------------------------------------------------------

OFFS    equ     -199
OFFP    equ     (OFFS-1+20+(boot1-bootp)-3)
OFFI    equ     0
;OFFI    equ     52

FANGOFF equ     -41
STEPOFF equ     -42     

for CORESIZE==8192
 STEP    equ     1396            ; PBT check opt for not hitting 5pt imp?
 ANTIIMP equ     2731            ;3-pt
 PADJ    equ     0
rof
for CORESIZE==8000
 STEP    equ     -2908           ; PBT check opt for not hitting 7pt imp?
 ANTIIMP equ     2667            ;3-pt
 PADJ   equ     -1
rof

pgo:
boot    spl     bootimp
for OFFI!=0
        mov     imp,        imp+OFFI
rof

boot1   mov     evamp,      OFFS+2
        mov     evamp-1,    <boot1
        mov     evamp-2,    <boot1
        mov     evamp-3,    <boot1

        mov     fang,       boot1+OFFS+FANGOFF
        mov     step,       boot1+OFFS+STEPOFF

        spl     1                   ;2      ;Pre-load 18 processes [PBT]
        mov     -1,         0       ;3
        mov     -1,         0       ;5
        mov     -1,         0       ;9
        spl     @boot1
        jmp     @boot1,     <boot1+OFFS-1   ;B==Decoy maker [PBT]

fang    jmp     (pit+OFFP+(bootp-pit))-boot1-OFFS-FANGOFF-STEP, 0+STEP

                    ;PBT pre-SPL and SPL in place - compromise between
                    ;    quickly building processes and small profile.
                    ;    As bombs either side of vamp profile grows to
                    ;    5 regardless.
temp    spl     0,          <-32-ANTIIMP+9  ;PBT 9 for decoy
vamp    mov     FANGOFF,    @FANGOFF
        add     vamp+STEPOFF, vamp+FANGOFF
evamp   jmp     vamp,       <-35            ;PBT seems better before fang
step    dat     #-STEP,     #STEP

pit:    mov     bomb,       <boot1+STEPOFF-5+PADJ
        spl     -1
        spl     -2
epit    jmp     pit

bomb    DAT     #0,         #0  ;PBT not used, but seems to protect
                                ;following code ~ from scan attacks?

; -------------------------------------------

; Nimbus launch for 5 point, 10 process imp. Size is a
; better protection than speed here. Currently has tail
; on the end of my code; not elegant.

for CORESIZE==8192
 ISIZ   EQU     3277                    ; 5pt (2731 for 3pt)
rof
for CORESIZE==8000
 ISIZ   EQU     1143                    ; 7pt
rof

imp     MOV     0,          ISIZ

for CORESIZE==8192
bootimp SPL     1                       ;   2
        MOV     2,          0           ;   3
        MOV     1,          0           ;   5
        SPL     1                       ;   10
rof
for CORESIZE==8000
bootimp SPL     1                       ;   2
        SPL     1                       ;   4
        MOV     -1,         0           ;   7
        SPL     1                       ;   14
rof

        SPL     2
        JMP     @0,         imp+OFFI
        ADD     #ISIZ,      -1         
        mov     <ANTIIMP-4, 0           ; PBT A for _if_ wimp gate bootimp+3

bootp   mov     epit,       OFFP+3
        mov     epit-1,     <-1
        mov     epit-2,     <-2
        mov     epit-3,     <-3

    end qgo
    END

