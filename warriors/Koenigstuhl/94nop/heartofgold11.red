;redcode-94 verbose
;name           Heart of Gold 1.1
;author         Stefan Foerster <foerster@a-city.de>
;contact        foerster@a-city.de
;url            http://home.a-city.de/stefan.foerster
;version        1.1
;date           Apr 2, 2001
;strategy       not given
;assert 1

                org     start

; *********
; constants
; *********

BOOTPOS         equ    (initsilk+(CORESIZE/2))
SPTR0           equ    (silk1+(CORESIZE/4))
SPTR1           equ    ((789*CORESIZE)/8000)
SPTR2           equ    ((1357*CORESIZE)/8000)
GATE            equ    (start-MINDISTANCE)

I_SBOOT         equ    2
I_RSILK         equ    7
I_PARAS         equ    3
I_SILK          equ    (4+I_SBOOT+I_RSILK+I_PARAS)
I_BOOT          equ    (2+I_SILK)

; ************************************
; boot code [I_BOOT=2+I_SILK=18 instr]
; ************************************

start           mov.i  initsilk+I_SILK-1, BOOTPOS+I_SILK-1
nn              for    I_SILK-1
                mov.i  {start, <start
                rof
                spl    @start, <GATE
                jmp    initsilk, <GATE

; ***********
; empty space
; ***********

dd              for    MAXLENGTH-(I_BOOT+I_SILK)
                dat    #0, #0
                rof

; ******************************************************
; silk paper [I_SILK=4+I_SBOOT+I_RSILK+I_PARAS=16 instr]
; ******************************************************

initsilk        spl    1, <GATE  
                mov.i  -1, 0
                mov.i  -1, 0
                spl    1, <GATE

; *****************************************
; boot part of silk paper [I_SBOOT=2 instr]
; *****************************************

sboot           mov.i  {silk1, {silk0
silk0           spl    SPTR0+I_RSILK+I_PARAS, <GATE

; ***********************************************
; replicator part of silk paper [I_RSILK=7 instr]
; includes separator to parasite
; ***********************************************

silk1           spl    @I_RSILK+I_PARAS, >SPTR1
cpy1            mov.i  }silk1, >silk1
cpy2            mov.i  {silk1, {silk2
separate        djn.b  silk2, #1
to_parasite     spl    psearch
silk2           spl    SPTR2+I_RSILK+I_PARAS, <GATE
again           djn.f  again, {silk2

; **************************
; parasite [I_PARAS=3 instr]
; **************************

psearch         jmz.f  psearch, {silk2
parasite        spl    *silk2, {again          
continue        jmp    psearch, }again

                end
