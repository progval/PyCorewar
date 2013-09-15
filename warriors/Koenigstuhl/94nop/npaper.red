;redcode-94nop
;name nPaper
;author Paul-V Khuong
;strategy Paper
;assert CORESIZE==8000

     pStep1 equ 3944
     pStep2 equ 2616
     pStep3 equ -624

     x equ -373
     y equ 1915
     z equ -287

     spl   1
     spl   1
     spl   1
pap1:spl   @0,     <pStep1
     mov   }pap1,  >pap1
pap2:spl   @0,     {pStep2
     mov   }pap2,  >pap2
     mov.i #1,     }1
     mov   {x,     <y
     mov   {pap2,  {pap3
pap3:djn.f pStep3, <z

