;redcode-lp
;name fbomber
;author Michal Janeczek
;strategy pair of 0.6c jmp0 bombers
;assert MAXPROCESSES == 8

   for   CORESIZE == 55440
s  equ   22964   ; mod 4
k  equ   27721
   rof

   for   CORESIZE == 8000
s  equ   3044    ; mod 4
k  equ   2667
   rof

sp equ   (CORESIZE/2)
t  equ   (CORESIZE/3)

   add   *2    , p            ; executed in reverse order
p  mov   h-t*s , }h-(t-2)*s
   mov   j     , *p
h  mov   j     , @p
   jmz   p-1   , h-4*s
   mov   d     , >p-4
   jmp   -1    , >sp+p-4

   for   10
   dat   0     , 0
   rof

d  dat   <k    , 7-p

   for   3
   dat   0     , 0
   rof

j  jmp   #-s   , 2*s

   for   MAXLENGTH-CURLINE-9
   dat   0     , 0
   rof

st mov   j     , j+sp
   mov   d     , d+sp
   spl   1     , 1
   spl   1     , 1
   mov   <sr   , <ds
   mov   <sr   , <ds
   spl   2     , 1
sr djn.f h     , #h+4
ds djn.f h+sp  , #h+4+sp

   end   st

