;redcode-94
;name Sandstorm Q/0.6c
;version 0.6c
;kill Sandstorm
;author Ilmari Karonen
;strategy Probe qscan + spl pit + Sandstorm + fused 7pt imp spiral
;strategy Trying a smaller imp.
;strategy Submitted: @date@
;comments Colors core at 0.8c, bombs at 1.2c.
;history 0.1 - Works.
;history 0.2 - Added boot & decoy.
;history 0.3 - Added qscan from Probe.
;history 0.4 - Qscan throws vamp fangs - better?
;history 0.4b- Hmmph.. my gate sucked. :(
;history 0.4c- So did my boot and my pit.. :(
;history 0.4d- Finally! I think it works now.
;history 0.5 - Changed the bombing routine to use decrements.
;history 0.5b- Non-suicidal compressed pit and silk-style boot.
;history 0.6 - Added a fused imp launch. Shorter/slower boot.
;history 0.6b- Now splits to the clear at boot.
;history 0.6c- Doesn't split to clear, less processes in imp.
;date October 31, 1996
;planar quick, scan, vamp, stun, pspace, boot, stone, clear, imp, gate
;assert CORESIZE == 8000

step    equ     3288            ; mod-8 (2 runs offset by 4)
cptr    equ     (incr-10)
cend    equ     (clear+10)
away    equ     (qpit+2416)     ; be careful with this!

impaway equ     (away+step)     ; launch boot dist
impstep equ     1143            ; imp step
fuselen equ     17              ; imp size
point   equ     (-step+50)      ; imp start

        org     start

QB      equ     (start+400)
QS      equ     200
QD      equ     100
COUNT   equ     6

GAP     equ     ((start+1)-(tab-1))     ; 15
REP     equ     6

qpit:   spl     #10*QS, {2*QS   ; can get 21 values from this table
table:  spl      #4*QS, {1*QS   ; and can also use the initial value
        spl     #23*QS, {3*QS   ; of fnd
fnd:    spl     #-GAP, {QB
        stp.b   <0, #100
        jmp     qpit, {300
qbomb:  jmp     qpit-fnd, {-100
qbm3:   jmp     *-GAP, <GAP
qbm2:
qinc:   jmp     *GAP, >-GAP

tab:    add.a   table,table
slow:   add.ab  @tab,fnd
fast:   add.b   *tab,@slow
which:  sne.i   datz,@fnd
        add.ab  #QD,fnd
                
        sub.ba  fnd, qbomb
        mov.i   qbomb,@fnd
        add.ba  fnd,fnd
qloop:  mov.i   qbm2,*fnd
        sub.f   qinc,fnd
        mov.i   qbm3,@fnd
        djn.b   qloop,#REP
        jmp     boot,}-300
                
start:
        seq.i   QB+QS*0,QB+QS*0+QD
        jmp     which,}QS*13            ; qinc+GAP
                
        seq.i   QB+QS*1,QB+QS*1+QD
        jmp     fast,}QB+QS*1+QD/2
        seq.i   QB+QS*2,QB+QS*2+QD
        jmp     fast,{tab
        seq.i   QB+QS*3,QB+QS*3+QD
        jmp     fast,}tab
                
        seq.i   QB+QS*13,QB+QS*13+QD
        jmp     fast,{fast              ; !!!
                
        seq.i   QB+QS*4,QB+QS*4+QD
        jmp     >fast,}QB+QS*4+QD/2
        seq.i   QB+QS*5,QB+QS*5+QD
        jmp     slow,}QB+QS*5+QD/2
        seq.i   QB+QS*6,QB+QS*6+QD
        jmp     slow,{tab
        seq.i   QB+QS*7,QB+QS*7+QD
        jmp     slow,}tab
                
        seq.i   QB+QS*10,QB+QS*10+QD
        jmp     >fast,<tab
        seq.i   QB+QS*11,QB+QS*11+QD
        jmp     slow,<tab
        seq.i   QB+QS*12,QB+QS*12+QD
        djn.f   slow,tab
                
        seq.i   QB+QS*23,QB+QS*23+QD
        jmp     >fast,>tab
        seq.i   QB+QS*24,QB+QS*24+QD
        jmp     slow,>tab
                
        seq.i   QB+QS*17,QB+QS*17+QD
        jmp     slow,{fast              ; !!!
                
        seq.i   QB+QS*8,QB+QS*8+QD
        jmp     <fast,}QB+QS*8+QD/2
        seq.i   QB+QS*9,QB+QS*9+QD
        jmp     tab,}QB+QS*9+QD/2
                
        seq.i   QB+QS*15,QB+QS*15+QD
        jmp     tab,<tab
        seq.i   QB+QS*16,QB+QS*16+QD
        jmp     tab,{tab
        seq.i   QB+QS*20,QB+QS*20+QD
        djn.f   <fast,tab
        seq.i   QB+QS*21,QB+QS*21+QD
        jmp     tab,{fast               ; !!!
        seq.i   QB+QS*22,QB+QS*22+QD
        djn.f   tab,tab
        seq.i   QB+QS*27,QB+QS*27+QD
        jmp     <fast,>tab
        seq.i   QB+QS*28,QB+QS*28+QD
        jmp     tab,>tab
                
        seq.i   QB+QS*30,QB+QS*30+QD
        jmp     tab,}tab

boot    mov.i   clear, {saapas
kenka   mov.i   {tossu, {saapas
        mov.i   {tossu, {saapas
        mov.i   <tossu, <saapas
        djn.b   kenka, #5
        spl     @saapas, {555           ; start imp
        spl     *saapas, {666           ; start bomber
;        add.a   #cloop-incr, saapas     ; * commented out in 0.6c! *
;        spl     *saapas, {777           ; start clear
saapas  sub.f   #away+11, #impaway+4
tossu   dat     <clear+1, <imp+1

; *** Imp launch (imptest 0.2)

pump    spl     0, >prime
prime   mov.i   imp, point-1
        add.f   #impstep+1, ptr
ptr     jmp     point-impstep-1, {pump-fuselen+3

imp     mov.i   #impstep, *0

; *** Sandstorm

incr    spl     #step*2, #-step*2
hit1    sub.f   incr, b1                ; hit (a-incr)
b1      mov.i   >hit1+step, {hit2+step
        add.f   incr, b2
b2      mov.i   }hit1, <hit2            ; hit (spl)
hit2    jmz.b   hit1, #0                ; hit (b-decr)
cloop   mov.i   clear+1, >cptr          ; d-clear
        mov.i   clear+1, >cptr
        djn.f   cloop, >cptr
clear   dat.f   <2667, cend-cptr        ; hit (b-incr)
;        dat.f   <2667, cend-cptr        ; djn protection (created at boot)

datz    z for   (MAXLENGTH-CURLINE)
        dat     0, 0
        rof

        end
