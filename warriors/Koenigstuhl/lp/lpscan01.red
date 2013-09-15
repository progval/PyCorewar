;redcode-94lp verbose
;name LP-Scan v0.1
;author John Metcalf
;strategy 0.5c scan switching from jmp to dat bombs
;assert CORESIZE==8000 && MAXPROCESSES==8

for 0
Entered the LP hill on Tuesday 22nd June 1999, taking 9th place:
 9  41.8/ 43.2/ 14.9              LP-Scan v0.1         John Metcalf 140.5  1
rof

step equ 2191

ptr: add   #step,#bp+step
star:jmz.f ptr,  @ptr
     slt   ptr,  #5
     mov   *bp,  @ptr
     jmp   ptr,  <4000
bp:  dat   1,    1
     jmp   #2,   <2667
     end   star

