;redcode-94
;name Squint
;author Mike Nonemacher
;contact mn2f+@andrew.cmu.edu
;strategy B-scanning vampire
;assert CORESIZE==8000

;macro
 
;I have finals this week, so I don't have the time to make up anything
;new.  I doubt this'll do much, but it's worth a shot...
 
STEP    EQU    2234
 
    mov.i    trap,    @3
    sub.ba    @0,    @2
a    add.ab    #STEP,    @-1
t    jmz.b    a,    -2+STEP
    jmp    -4
for    87
    dat.f    0,    0
rof
wimp    jmp.f    #0,    <-19
trap    jmp.f    pit-t
pit    mov.i    -7,    <-100
    spl    #0
    spl    -1    ;will clear v. slowly till starvation sets in
    jmp    -3
END    t
