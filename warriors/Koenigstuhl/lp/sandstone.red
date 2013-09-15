;redcode-94lp
;name Sandstone
;author Zul Nadzri
;strategy  Designed for Round 2 [coresize=8000 & maxprocess=8] 
;strategy  Main Theme : Dat Bombing
;assert CORESIZE==8000

;()()()()  The Story  ()()()()
;I'm a beginner with no experience in this limited (8) process tournament. 
;I assume a lot of spirals and bombers around with less papers and 
;vampires. I think I'll join the bombers group and I hope I can hit other 
;opponents first!

toffs   equ     (table-tindex)          ;()()SAME OLD PSPACE TABLE()() 
TIDX    equ     33

for     30
        dat     <-w2,     <-w3
rof

starter LDP.ab  #TIDX,          tindex 
result  LDP.ab  #0,             #0
        ADD.b   result,         tindex
        SEQ.ab  #0,             tindex
        SLT.b   tindex,         #endtab+1-tindex 
        MOV.ab  #fsttab-tindex, tindex
        STP.ab  @tindex,        #TIDX
        MOV.ba  @tindex,        jumper
jumper  JMP     0
fsttab  DAT     #toffs+0,       #w3-jumper
tindex  DAT     #0,             #0              ;index into table 
table   DAT     #toffs+3,       #w2-jumper      ;w1->w2 on loss
        DAT     #toffs+0,       #w3-jumper      ;w1->w1 on win 
        DAT     #toffs+3,       #w3-jumper      ;w1->w1 on tie 
        DAT     #toffs+6,       #w3-jumper      ;w2->w1 on loss 
        DAT     #toffs+3,       #w2-jumper      ;w2->w2 on win
endtab  DAT     #toffs+3,       #w2-jumper      ;w2->w2 on tie

desti   equ     4567                  ;()()WARRIOR 1()()
offset  dat #-5138,#5138              ;()()THANKS ANDY PIERCE()() 
body    spl 0,0
        add offset,1
        mov <0,0
        jmp -2,0
w3      mov     offset,     desti
        mov     body,       desti
        mov     body+1,     desti
        mov     body+2,     desti
        mov     body+3,     desti
        jmp     desti+w3+1, <2000

ptr     dat     #0                    ;()()WARRIOR 2()()
w2      mov     #12,     ptr          ;()()THE CLASSIC CODE!()() 
loop    mov     @ptr,    <dest        ;()()HOPE WILL ACT LIKE BOMBER()()
        djn     loop,    ptr
        spl     @dest,   0
        add     #653,    dest
        jmz     -5,      ptr
dest    dat     #0,      #833

for     MAXLENGTH-CURLINE
        dat     <-w2,     <-w3
rof

        end     starter

