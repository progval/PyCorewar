;redcode-b test
;name Instantaneous-Coffe v0.1
;strat Div-Scanner
;assert CORESIZE==8000

FOR 0

    Div-Scanner:

        ptr     dat     #0,         #STEP
        eye     dat     #0,         #DES+STEP

        c:      mov.i   bomb,       >ptr        ;carpet

        a:      add.ab  #STEP,      eye

        d:      div.b   @eye,       @eye    ;@eye.b==0 ->
                                            ;   the proc die
                                            ;@eye.b!=0 ->
                                            ;   @eye.b=1

        m:      mov.ba  @eye,       ptr     ;ptr.a=@eye.b

        n:      mov.i   *ptr,       ptr     ;@eye.b==ptr.a==0 ->
                                            ;   ptr.b=ptr.b
                                            ;@eye.b==ptr.a==1 ->
                                            ;   ptr.b=eye.b


        PROC QUEUE:

        [...]admnc[...]admnc[...]admnc[...]admnc ...
              
ROF

STEP    EQU     (3315)
DES     EQU     (1)


        org start


sc      spl     1
        spl     1
        spl     1
        spl     1

b1 ptr  spl     #DES+STEP,      #0      ;scan
eye     add.ab  #STEP,          #DES-(STEP*((16*4)))+(STEP*2)
        mov.i   b1,             }ptr    ;scan
        mov.ba  eye,            @ptr-1
        mov.b   @eye,           ptr-1
hit     div.b   @eye,           @eye
        jmn.b   b3,             eye
        spl     #0,             #0                  ;scan
clear   mov.i   *bp,            <cl
        jmp     -1
b3      dat     #b3-bp,         #clear-1-cl
cl bp   dat     #b2,            #clear-1-cl
        dat     0,              0                   ;scan
b2      spl     #b3-bp,         #clear-1-cl


        FOR 60
        dat 0,0
        ROF



BIMP        EQU     1000
ISTEP       EQU     2667

BASE        EQU     (start+BIMP)

imp         mov.i   #ISTEP,     *0

start       mov.i   imp,        BIMP
            spl 1
            mov.i   -1,0
            mov.i   -1,0
            spl 2
            jmp *vector,    {1
            jmp @vector+1,  {-1


            dat #BASE+(ISTEP*8),            #sc
            dat #BASE+(ISTEP*6),            #BASE+(ISTEP*7)
            dat #BASE+(ISTEP*4),            #BASE+(ISTEP*5)
            dat #BASE+(ISTEP*2),            #BASE+(ISTEP*3)
vector      dat #BASE,                      #BASE+ISTEP

