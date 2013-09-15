;redcode
;name EV1L EMP1RE
;author David Moore
;strategy I Search for my first prey and transform it into a vampire.
;strategy My minion will recruit other vampires for my glorious emp1re.
;strategy Then I summon imps to defile the resistance. When my enemies
;strategy are hopeless, I sacrifice the imps to gain their power.
;strategy Everything shall perish in a flaming inferno of bloody death.
;strategy
;strategy Oh, you wanted "Corewar" strategy?
;strategy quickscan -> quickvamp -> imp -> clear
;assert CORESIZE==8000 && MAXPROCESSES==8 
;MAXLENGTH==100

;----------------------------------------------------------------------
; backup core-clear

       dat <2667, <5334
clear  mov -1, <1
       jmp -1, -4
       dat #0, #0

       dat #0, #0   ; hit by fang

;----------------------------------------------------------------------
; the vampire trap is itself a vampire

tZero  dat #0, #0
tStep  equ 7624   ;= 0 mod 8
       add tAdd, tFang
trap   spl    2, 0
       mov   @0, @tFang
       jmz   -3, clear-2  ; kill self when imp arrives
tAdd   dat #-tStep, #tStep
tFang  jmp trap-tStep, tStep

;----------------------------------------------------------------------
; launch imp and core clears

cDist  equ 2663  ; boot distance of imp-killing core clear

imp    spl  2, 0
       spl clear, 0
       spl 2668, 0
       mov -1, 2667
       mov  0, 2667
boot   spl     imp, 0
       mov clear-1, clear+cDist-1
       mov    #-12, <-1
       mov  clrB+1, <2
       mov  clrB+0, <1
       djn @0, #clear+cDist+2

clrB   mov -1, <-2  ; imp-killing core clear
       jmp -1, <-3

;----------------------------------------------------------------------
; quickvamp

QB     equ (qFang+3000)
QS     equ  200
QI     equ  100
qStep  equ 8 ; distance between fangs
qTime  equ 7 ; (number of fangs dropped-1)/2

qIncr  dat #-QI, #QI
       dat #-(QS*2), #(QS*2)
qt2    dat #-(QS*7), #(QS*7)
       dat #-(QS*5), #(QS*5)
qt1    dat #-(QS*1), #(QS*1)
qt3    dat #-(QS*3), #(QS*3)
qa3    add @qs3, qFang
qa2    add @qs2, @-1
qa1    add @qs1, @-2
qa0    cmp @qFang, clear-2  ;compare to core
       jmp 2, 0
       add qIncr, qFang
       mov    @0, @qFang+0
       mov qFang,  qFang+1
       add  qjbr,  qFang+1
       mov    @0, @qFang+1  ;bomb right direction
       add  qjbl,  qFang+0
       mov    @0, @qFang+0  ;bomb left direction
       cmp <qFang+0, <qFang+1 ;quit if nothing left to bomb
       djn -5, #qTime         ;or quit after enough bombs are dropped
       jmp boot, 0
qjbr   dat #-qStep, # qStep+1
qjbl   dat # qStep, #-qStep+1
qFang  jmp trap-(QB+(QS* 0))-1, QB+(QS* 0)

;----------------------------------------------------------------------
; quickscan

qScan  cmp QB+(QS* 0)+QI, QB+(QS* 0)
qs1    jmp qa0, qt1
       cmp QB+(QS* 1)+QI, QB+(QS* 1)
qs2    jmp qa1, qt2
       cmp QB+(QS* 5)+QI, QB+(QS* 5)
       jmp qa1, <qs1
       cmp QB+(QS* 8)+QI, QB+(QS* 8)
qs3    jmp qa2, qt3
       cmp QB+(QS* 3)+QI, QB+(QS* 3)
       jmp qa2, <qs2
       cmp QB+(QS* 7)+QI, QB+(QS* 7)
       jmp qa2, <qa1
       cmp QB+(QS*12)+QI, QB+(QS*12)
       jmp qa2, <qs1
       cmp QB+(QS*11)+QI, QB+(QS*11)
       jmp qa3, 0
       cmp QB+(QS* 4)+QI, QB+(QS* 4)
       jmp qa3, <qa2
       cmp QB+(QS* 6)+QI, QB+(QS* 6)
       jmp qa3, <qs2
       cmp QB+(QS* 9)+QI, QB+(QS* 9)
       jmp qa3, <qs3
       cmp QB+(QS*10)+QI, QB+(QS*10)
       jmp qa3, <qa1
       cmp QB+(QS*15)+QI, QB+(QS*15)
       jmp qa3, <qs1
       jmp boot, 0

end qScan 
