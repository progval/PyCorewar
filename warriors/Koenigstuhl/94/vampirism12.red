;redcode-94b
;name Vampirism 1.2
;author Philip Kendall
;strategy Scan with vamp bombs -> spl / repeated dat clear
;strategy 1.2: improved the bomb
;strategy    : erased all boot pointers
;strategy    : improved the djn-stream
;assert CORESIZE==8000

SCAN1   equ     (loop+3*STEP)
SEP     equ     12
STEP    equ     42
STREAM  equ     (-400+loop)             ; this was a bug in 1.1
CSTART  equ     (pit-ptr)
GATE    equ     (loop-1)
BOOT    equ     2000                    ; how far to boot main code
FBOOT   equ     2000                    ; how much further to boot fang
LENGTH  equ     (last-loop+1)           ; how much code to boot

loop    add.f   step,scan               ; the scanner
scan    cmp.i   SCAN1,SCAN1-SEP
        slt.a   #(last-scan+SEP),scan
        djn.f   loop,<STREAM
        sub.a   scan,bomb               ; set the bomb up
        add.a   #(fang-scan+FBOOT),bomb
        mov.i   bomb,*scan              ; bomb the high location
        add.a   #SEP,bomb               ; modify bomb
        mov.i   bomb,@scan              ; bomb the low location
        sub.a   bomb,bomb               ; zero out the bomb again
        jmn.a   csplit,pit              ; jump if something in the pit
        jmp.a   loop,<STREAM            ; and loop if there isn't
step    dat.f   #STEP,#STEP

ptr     dat.f   cbomb1,(last+1)         ; the coreclear
cbomb1  spl.a   #cbomb0-ptr,(pit-ptr)
csplit  spl.a   #0,<STREAM
clear   mov.i   *ptr,>ptr               ; spl/repeated dat coreclear
        mov.i   *ptr,>ptr
        mov.i   *ptr,>ptr
        djn.f   clear,<STREAM
cbomb0  dat.f   #cbomb0-ptr,(pit-ptr)   ; kill off any processes here
bomb    jmp.a   *0,<1

pit     spl.a   #pit,{pit               ; stunning/brainwashing pit
        spl.a   pit,>GATE               ; first line acts as a trigger
wash    stp.ab  #231,#1
        spl.a   pit,>wash
        spl.a   pit,>GATE
        spl.a   pit,>GATE
last    jmp.a   pit,>GATE
fang    jmp.a   (pit-FBOOT),0

start
dummy   for     LENGTH                  ; boot most of code
        mov.i   }bptr,>bptr
        rof
        add.ab  #FBOOT,bptr             ; boot the fang
        mov.i   }bptr,>bptr
go      spl.a   (scan+BOOT),<(GATE+BOOT); start the scanner going
        sub.f   bptr,bptr               ; erase the boot pointers
        sub.f   go,go
bptr    dat.f   loop,(loop+BOOT)        ; and kill the boot process

rubbish for     (MAXLENGTH-CURLINE)     ; fill up space
        dat.f   {(rubbish+100),>((rubbish+100)*2)
        rof

        end     start

