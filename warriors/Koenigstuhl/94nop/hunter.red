;redcode-94
;name Hunter
;author Anders Rosendal
;strategy .75c stone
;assert CORESIZE == 8000

step1   EQU   3472
step2   EQU   8
org start

bomb    dat    0,       step2

loop    add.F  addme,   stone       ;new position
start   mov.I  bomb,    @stone      ;bomb
stone   mov.I  last+800,@last+808   ;bomb
        jmz.F  loop,    *stone      ;scan
        mov.I  bomb,    *stone      ;backup a little
addme   spl    #step1,  #step1
        mov.I  bomb,    {stone      ;clear
last    dat    0,       0

for MAXLENGTH-CURLINE
        dat    0,       0
rof
end
