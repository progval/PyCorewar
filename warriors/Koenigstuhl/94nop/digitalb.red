;redcode-94 test
;name digital breakdown v01b
;author bjoern guenzel
;assert 1
;strategy submitted @date@
;strategy paper with a lot of data
;strategy this version doesn't work really good yet :-(

size    equ 8
distA   equ 511
distB   equ -701
antiv   equ 1111

        spl 1,>100              ;create 9 procs
        mov.i -1,0              ;2
        mov.i -1,0              ;3
        mov.i -1,0              ;5

paper1  spl @0,>distA           ;first copy of paper
        mov.i }paper1,>paper1   ;goto paper1            
        mov.i {paper1,<paper2   ;second copy of paper
blaunch mov.i >data,}bomber     ;first copy of data
paper2  spl @0,<(distB+size)    ;goto paper2 (reset dist with '<')
        mov.i <data,<(data+4)   ;second copy of data
        mov.i {bomber,}antiv    ;reset+antivamp
        mov.i bomber,>blaunch   ;prepare bombing :->
bomber  mov.i (data+distA),{data ;and spread the word

for 70
        dat 0,0
rof

data    dat #1000,>0
        dat #1500,>2667
        dat #2000,>2667
        dat #2500,>2667
        dat #-1000,>(distB+size)
        dat #-1500,>2667
        dat #-2000,>2667
        dat #-2500,>2667
        dat #-3000,>2667

        for MAXLENGTH-CURLINE
        dat 0,0
        rof

        end
