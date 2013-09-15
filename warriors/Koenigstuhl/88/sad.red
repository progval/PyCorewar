;redcode
;name SAD, Search and Destroy
;author Christoph Doederlein
;assert 1
;        SAD,   the   Search And Destroy   warrior
;             (c) 1989 by Christoph Doederlein
;
;        the main part
;        mov    -1,        vgl       ;
;        jmp    loop                 ;
target   dat   #0                    ;target pointer
start    mov   <data,      parms     ;load parms for searching
         mov   <data,      rept      ;load parms for searching
         mov    data,      target    ;initialize target
loop     sub    parms,     target    ;new target
         jmz    free,     @target    ;taret clean?
copy     mov    bomb1,    @target    ;bomb to disable
         mov    parms,     brept     ;give parms to bomber
         add   #12,        target    ;prepare copy
         mov   #5,         label     ;dito
cloop    mov   @label,    <target    ;copy
         djn    cloop,     label     ;copy
         cmp   @target,    bloop
         jmp    copy
         spl   @target               ;start bomber
free     djn    loop,      rept      ;cyclus done?
         jmp    start
;
;        the bomber part
label    dat   #0                    ;copy label
bloop    mov    bomb,     <btarget   ;the bomber
         djn    bloop,     brept     ;
btarget  dat   #-2
brept    dat   #0
bomb     dat   #0
                                    ;parms for the main-part
bomb1    spl    0
parms    dat    #64                  ;first time parms
rept     dat    #127
data     dat    #7                   ;number of data *2 +1
         dat    #627                 ;rept3
         dat    #13                  ;parms3
         dat    #679                 ;rept2
         dat    #12                  ;parms2
         dat    #255                 ;rept1
         dat    #32                  ;parms1
         end    loop
