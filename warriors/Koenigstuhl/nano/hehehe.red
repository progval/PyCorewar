;redcode-imt2
;name hehehe
;author Anders Rosendal
;assert CORESIZE==80

bomb    dat    #start,last+2
start   spl    #last+1-bomb,last+2-bomb
mov.I  *bomb,>bomb
last    jmp    -1,0

end start

