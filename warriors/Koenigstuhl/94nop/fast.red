;redcode-94
;name Fast Fast Fast
;author Franz
;strategy qscan+silk
;strategy Somewhat like Tiberius but lenght-8, no loop on bomb, and kills
;strategy itself on last bomb, no longer can this be called a coreclear
;strategy The Qscan used is probes scanning, my bombing routine ... not
;strategy much improvement seen against probe but the code for the q scan
;strategy is smaller, faster bombing but slower response (not much)
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000

fcp     EQU 3030
scp     EQU 2365
tcp     EQU 777

QB      EQU (start+400)
QS      EQU 200
QD      EQU 100

COUNT   EQU 6

GAP     EQU 15
REP     EQU 4

	ORG start

        dat 10*QS,2*QS ; can get 21 values from this table
table   dat 4*QS,1*QS  ; and can also use the initial value
        dat 23*QS,3*QS ; of fnd

qinc    dat >(-1)*GAP*2,>GAP

tab     add.a table,table
slow    add.ab @tab,fnd
fast    add.b *tab,@slow
which   sne.i datz,@fnd
        add.ab #QD,fnd

        add.ba fnd,fnd
qbomber mov.i qinc,@fnd
        mov.i qinc,*fnd
fnd     mov.i (-1)*(GAP/2),@QB
;fnd    mov.i (-1)*(GAP*3)/2,@QB
        sub.x qinc,fnd
        djn.b qbomber,#REP
        jmp boot,}-300

start
        seq.i  QB+QS*0,QB+QS*0+QD
        jmp    which,}QS*13

        seq.i  QB+QS*1,QB+QS*1+QD
        jmp    fast,}QB+QS*1+QD/2
        seq.i  QB+QS*2,QB+QS*2+QD
        jmp    fast,{tab
        seq.i  QB+QS*3,QB+QS*3+QD
        jmp    fast,}tab
        seq.i  QB+QS*4,QB+QS*4+QD
        jmp    >fast,}QB+QS*4+QD/2
        seq.i  QB+QS*5,QB+QS*5+QD
        jmp    slow,}QB+QS*5+QD/2
        seq.i  QB+QS*6,QB+QS*6+QD
        jmp    slow,{tab
        seq.i  QB+QS*7,QB+QS*7+QD
        jmp    slow,}tab
        seq.i  QB+QS*8,QB+QS*8+QD
        jmp    <fast,}QB+QS*8+QD/2
        seq.i  QB+QS*9,QB+QS*9+QD
        jmp    tab,}QB+QS*9+QD/2
        seq.i  QB+QS*10,QB+QS*10+QD
        jmp    >fast,<tab
        seq.i  QB+QS*11,QB+QS*11+QD
        jmp    slow,<tab
        seq.i  QB+QS*12,QB+QS*12+QD
        djn.f  slow,tab
        seq.i  QB+QS*13,QB+QS*13+QD
        jmp    fast,{fast
        seq.i  QB+QS*15,QB+QS*15+QD
        jmp    tab,<tab
        seq.i  QB+QS*16,QB+QS*16+QD
        jmp    tab,{tab
        seq.i  QB+QS*17,QB+QS*17+QD
        jmp    slow,{fast
        seq.i  QB+QS*20,QB+QS*20+QD
        djn.f  <fast,tab
        seq.i  QB+QS*21,QB+QS*21+QD
        jmp    tab,{fast
        seq.i  QB+QS*22,QB+QS*22+QD
        djn.f  tab,tab
        seq.i  QB+QS*23,QB+QS*23+QD
        jmp    >fast,>tab
        seq.i  QB+QS*24,QB+QS*24+QD
        jmp    slow,>tab
        seq.i  QB+QS*27,QB+QS*27+QD
        jmp    <fast,>tab
        seq.i  QB+QS*28,QB+QS*28+QD
        jmp    tab,>tab

        seq.i  QB+QS*30,QB+QS*30+QD
        jmp    tab,}tab

        jmp boot,>4000
	
for 22
        dat 0,0
rof

boot    
        ;letz get 8 processes together
        spl 1,>-3000
        spl 1,>-2000
        spl 1,>-1000

frog    spl     @0,     <fcp
frogc   mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
	mov     >6000,      <5000
	mov     >2000,      <8
datz    end

