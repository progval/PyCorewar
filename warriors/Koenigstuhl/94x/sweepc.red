;redcode-94x
;name Sweep-C
;author Jay Han
;strategy Imp + Wait -> 2-pass (SPL0, DAT) coreclear
;assert CORESIZE==55440

        org     s0

bomb    dat     <-7             ,<-5
wait    djn.b   0               ,#937
        mov.i   bomb            ,3755
        spl     0               ,<-5
        mov.i   @ptr            ,<target
target  dat     <-7             ,<-5
ptr     dat     0               ,-3

; 59-point spiral (coresize 55440, '94 standard)
t0      equ     2819
imp0    mov.i   0,              t0
s0      spl     wait
s01     spl     s03
s02     spl     s05
s04     spl     s09
s08     spl     s017
s016    spl     s033
s032    spl     s065
s064    jmp     imp0+1*t0
s065    jmp     imp0+2*t0
s033    spl     s067
s066    jmp     imp0+3*t0
s067    jmp     imp0+4*t0
s017    spl     s035
s034    spl     s069
s068    jmp     imp0+5*t0
s069    jmp     imp0+6*t0
s035    spl     s071
s070    jmp     imp0+7*t0
s071    jmp     imp0+8*t0
s09     spl     s019
s018    spl     s037
s036    spl     s073
s072    jmp     imp0+9*t0
s073    jmp     imp0+10*t0
s037    spl     s075
s074    jmp     imp0+11*t0
s075    jmp     imp0+12*t0
s019    spl     s039
s038    spl     s077
s076    jmp     imp0+13*t0
s077    jmp     imp0+14*t0
s039    spl     s079
s078    jmp     imp0+15*t0
s079    jmp     imp0+16*t0
s05     spl     s011
s010    spl     s021
s020    spl     s041
s040    spl     s081
s080    jmp     imp0+17*t0
s081    jmp     imp0+18*t0
s041    spl     s083
s082    jmp     imp0+19*t0
s083    jmp     imp0+20*t0
s021    spl     s043
s042    spl     s085
s084    jmp     imp0+21*t0
s085    jmp     imp0+22*t0
s043    spl     s087
s086    jmp     imp0+23*t0
s087    jmp     imp0+24*t0
s011    spl     s023
s022    spl     s045
s044    spl     s089
s088    jmp     imp0+25*t0
s089    jmp     imp0+26*t0
s045    spl     s091
s090    jmp     imp0+27*t0
s091    jmp     imp0+28*t0
s023    spl     s047
s046    spl     s093
s092    jmp     imp0+29*t0
s093    jmp     imp0+30*t0
s047    spl     s095
s094    jmp     imp0+31*t0
s095    jmp     imp0+32*t0
s03     spl     s07
s06     spl     s013
s012    spl     s025
s024    spl     s049
s048    spl     s097
s096    jmp     imp0+33*t0
s097    jmp     imp0+34*t0
s049    spl     s099
s098    jmp     imp0+35*t0
s099    jmp     imp0+36*t0
s025    spl     s051
s050    spl     s0101
s0100   jmp     imp0+37*t0
s0101   jmp     imp0+38*t0
s051    spl     s0103
s0102   jmp     imp0+39*t0
s0103   jmp     imp0+40*t0
s013    spl     s027
s026    spl     s053
s052    spl     s0105
s0104   jmp     imp0+41*t0
s0105   jmp     imp0+42*t0
s053    spl     s0107
s0106   jmp     imp0+43*t0
s0107   jmp     imp0+44*t0
s027    spl     s055
s054    spl     s0109
s0108   jmp     imp0+45*t0
s0109   jmp     imp0+46*t0
s055    spl     s0111
s0110   jmp     imp0+47*t0
s0111   jmp     imp0+48*t0
s07     spl     s015
s014    spl     s029
s028    spl     s057
s056    spl     s0113
s0112   jmp     imp0+49*t0
s0113   jmp     imp0+50*t0
s057    spl     s0115
s0114   jmp     imp0+51*t0
s0115   jmp     imp0+52*t0
s029    spl     s059
s058    spl     s0117
s0116   jmp     imp0+53*t0
s0117   jmp     imp0+54*t0
s059    spl     s0119
s0118   jmp     imp0+55*t0
s0119   jmp     imp0+56*t0
s015    djn.b   0,              #1              ; Idle 1 cycle(s)
s030    spl     s061
s060    spl     s0121
s0120   jmp     imp0+57*t0
s0121   jmp     imp0+58*t0
s061    jmp     imp0

        end

