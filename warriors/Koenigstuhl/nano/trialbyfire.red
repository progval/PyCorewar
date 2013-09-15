;redcode-nano
;name trial by fire
;author John Metcalf
;strategy scanner
;assert CORESIZE==80
; April 2005

     step  equ 5
     first equ ptr+2*step

ptr: add   #step+1,  #first
wipe:jmz.f ptr,      <ptr
     mov   >1,       @ptr
     djn.f wipe,     <ptr-10
     end   wipe

