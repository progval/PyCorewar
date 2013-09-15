;redcode-94
;name BiShot v0.3
;author Christian Schmidt
;strategy .66c BiShot Scanner
;strategy v0.2 boot and decoy
;strategy v0.3 tuning constants
;assert 1

sOff    equ     (40*15+3);sorry, not really

sBoot   mov     {sBptr,      <sBptr
    for 10
        mov     {sBptr,      <sBptr
    rof
        jmp     @sBptr,      {0
sBptr   dat     sAdd+1,      sAdd+(60*15);sorry, not really     
        spl.i   0,           #1
        dat     0,           0    ; scanned
        dat.f   #1,          1
        dat.f   #1,          1
        dat.f   #1,          1
sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        jmp     sOne,        0
        jmp     sBomb,       0
sPtr    spl     {sOff,       >4000+sOff
        dat     {10,         >4010
sBomb   spl     #20,         <-100  
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb
sAdd    dat.f   15,          15
        dat     0,           0     ; scanned

    for 4
        spl.a   #0,          1
        stp.a   #0,          #0
        spl     -1,          -1
        spl.ba  #0,          1
        spl.f   #0,          1
        spl.x   #0,          1
        spl.i   #0,          1
        spl.a   0,           #1
        spl.b   0,           #1
        spl.ab  0,           #1
        spl.ba  0,           #1
        spl.f   0,           #1
        spl.x   0,           #1
        spl     0,           1
        dat     0,           0     ;scanned
    rof

        spl.a   #0,          1
        stp.a   #0,          #0
        spl     -1,          -1
        spl.ba  #0,          1
        spl.f   #0,          1
        spl.x   #0,          1
        spl.i   #0,          1
        spl.a   0,           #1
        spl.b   0,           #1
        spl.ab  0,           #1

        end     sBoot
