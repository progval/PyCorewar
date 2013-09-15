;redcode-94 
;name La Bomba
;author Beppe Bezzi
;assert CORESIZE == 8000

org     start  
qstep   equ     5
qrounds equ     7 
bigst   equ     99

qst     equ     qstart -(4*bigst)
qstart  equ     start+145

dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   
range   equ     933     

start
s1 for 5
        sne.x   qst+4*bigst*s1, qst+4*bigst*s1+bigst*1  ;check two locations
        seq.x   qst+4*bigst*s1+bigst*2, qst+4*bigst*s1+bigst*3  
        mov.ab  #qst+4*bigst*s1-found, found  ;they differ so set pointer
     rof
        jmn  which,   found
s2 for 5
        sne.x   qst+4*bigst*(s2+5), qst+4*bigst*(s2+5)+bigst*1
        seq.x   qst+4*bigst*(s2+5)+bigst*2, qst+4*bigst*(s2+5)+bigst*3
        mov.ab  #qst+4*bigst*(s2+5)-found, found
     rof
        jmn  which,   found
s3 for 5
        sne.x   qst+4*bigst*(s3+10), qst+4*bigst*(s3+10)+bigst*1
        seq.x   qst+4*bigst*(s3+10)+bigst*2, qst+4*bigst*(s3+10)+bigst*3
        mov.ab  #qst+4*bigst*(s3+10)-found, found
     rof
        jmn.b   which,  found
s4 for 5
        sne.x   qst+4*bigst*(s4+15), qst+4*bigst*(s4+15)+bigst*1
        seq.x   qst+4*bigst*(s4+15)+bigst*2, qst+4*bigst*(s4+15)+bigst*3
        mov.ab  #qst+4*bigst*(s4+15)-found, found
     rof
        jmn.b   which,  found

found   jmz.b   warr,   #0        ;skip attack if qscan found nothing
        add     #bigst, -1        ;increment pointer till we get the
which   jmz.f   -1,     @found    ;right place
qattack                           ;found.b points target  
        mov     bomba,  @found    ;in case small and dangerous
for 0
        After decoding enemy position it checks the location found+32 and, if it
        proves not to be empty, shifts 30 cells the bombing zone to the right
        This added near 5 points to my score
rof

        add.ba  found,  qstone
        add.b   found,  qstone
        seq     *qstone,-100 
        add.f   shift,  qstone

qst1    mov     qbomb,   *qstone       ;Tornado bombing engine the faster way
        mov     qbomb,   @qstone       ;to fill your enemy with hot lead
qstone  mov     32,     *32-qstep
        sub.f   qincr,   qstone           
        djn.b   qst1,   #qrounds      

warr                                    ;Paper01 the hint warrior
paper   spl     1,      <300
        spl     1,      <400
        spl     1,      <500    
silk    spl     @0,     {dest0
        mov.i   }-1,    >-1 
silk1   spl     @0,     <dest1
        mov.i   }-1,    >-1
        mov.i   bomba,  }range
        mov     {silk1, <silk2
silk2   jmp     @0,     >dest2
bomba   dat     <2667,  <1
        
qbomb   dat     #-qstep, #-qstep
qincr   dat     #3*qstep,#3*qstep
shift   dat     #30,    #30     
        
for MAXLENGTH-CURLINE-9
        dat     0,0
rof

for 9
        dat     1,1
rof
end

