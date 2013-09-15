;redcode-lp
;name paper
;author Simon Wainwright
;strategy limited process paper
;strategy adding a decoy didn't help
;assert MAXPROCESSES==8

curptr  mov       #6,       #6
        add.a  #1113,   newptr
loop    mov  <curptr,  {newptr
        jmn     loop,   curptr
        spl  @curptr,}curptr+1
newptr  jmz     7347,       *0
        end     loop
