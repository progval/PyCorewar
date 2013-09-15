;redcode-94
;name stopap
;author John Metcalf
; <metcalf-j@orange.net>
;assert 1
     sStep equ 2376
off: mov   >sStep,   {-sStep
sto: mov   >sStep*2, 1-sStep*2 ; incremented
     add   off,      sto
     jmz.f sto,      *sto      
spl 1     
spl   1
     spl   @0,>1751
     mov   }-1,>-1
     mov  {-2,<1
     jmp  @0,>2896
end
