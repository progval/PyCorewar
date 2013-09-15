;redcode-94m
;name QuiVa
;author John Metcalf
;strategy throw vamp bombs quickly...
;strategy seems to have survived on KOTH's multiwarrior though
;assert MAXPROCESSES==8000

      org   gogo

vamp: jmp   71,      <37        

gogo: a for 89
      mov   vamp,    gogo-a*71
      rof
      spl   cBomb,   {5432
      mov   gate,    -1

gate: dat   500,     4000           ; nothing special about
      dat   #3,      cPtr+5-gate    ; the core-clear
      dat   #2,      cPtr+4-gate
cBomb:spl   #-500,   cPtr+3-gate
cLoop:mov   @cPtr,   >gate
      mov   @cPtr,   >gate
      mov   @cPtr,   >gate
cPtr: djn   cLoop,   {cBomb
      end

