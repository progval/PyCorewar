;redcode-94x
;name Scanalyzer-V.3a
;author Jay Han
;strategy Scanner/Vampire
;assert CORESIZE==55440
;macro
                org     scan

start           equ     loop-3
step            equ     -34

loop            add.f   inc,            scan
scan            cmp.i   start+step,     start
                slt.ab  #tail+200,      scan
count           djn.b   loop,           #27719
                mov.i   fang,           @scan
                sub.ba  scan,           @scan
                add.f   half,           scan
p               jmn.b   scan,           count
half            spl.b   #step,          <step
                mov.i   bomb,           <p
bomb            dat.f   <step-2,        <step-1
fang            jmp.b   pit-scan,       <step*2-1
for 54
                dat.f   0,              0
rof
inc
pit             spl.b   #step*2,        <step*2
trap            jmp.b   -1,             <step*2-1
for 54
                dat.f   0,              0
rof
m for 44
                dat.f   m+1,            -m-1
rof
for 33
                dat.f   0,              0
rof
tail            dat.f   0,              0

                end

