;redcode-94
;name HAL 9000
;author Justin Kao
;strategy A core clear directed by scanner.
;strategy v9.1 @date@ --the version on the hill.
;strategy NEW: more spl pass
;strategy Formerly Paper Shredder until I discovered the name
;strategy was previously used.  No relation to HAL the stone.
;assert 1

step    equ     2936
scans   equ     400

        org     start

clrptr  dat     4000,   0       ;clear pointer
clrbmb2 dat     {20,    <2667   ;first clear bomb
clrbmb  spl     #25,    100     ;second clear bomb and also djn pointer
scnloop add     clear,  scan    ;\.
scan    seq.a   -10,    -2      ; \ scan
        mov.a   scan,   clrptr  ; / loop
        djn     scnloop,#scans  ;/.
clear   spl     #step,  <step   ;\----------also the scan step
clrloop mov     clrbmb, }clrptr ;-\.
        mov     clrbmb, }clrptr ;  > clear loop
        mov     clrbmb, }clrptr ; /.
        djn.a   clrloop,>clrbmb ;/.
        jmp     clrloop,>clrbmb ;catch fall through and move djn stream faster

        for     84
        dat     0,      0
        rof

start   spl     scnloop         ;start scan
        jmp     clrloop         ;start clear

