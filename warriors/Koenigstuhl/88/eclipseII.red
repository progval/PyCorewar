;redcode quiet
;name Eclipse II
;author P.Kline
;strategy bscan, ringkiller, avamp, clear->gate's
;strategy including ideas from Plasma, Paratroops, and old Eclipse
;strategy added mouse for emergencies (Paratroops attack)
;strategy small change in anti-vamp
;assert 1
step     equ 3094
hold     equ (scan-250)
ptr      equ (scan-120)
ptr2     equ ptr+1
minone   equ (scan-4000)

splmin1  spl -1,<57          ; <57 is to keep Imprimis from launching 7-imp
start    sub #1,minone       ; create a dat 0,7999 for comparison
         jmp next            ; begin initial scan

ref3     add @7933,7934      ; partial reflection
         mov 7984,<7933
         mov 7983,@7931
         cmp 7950,<7930
         jmp 7995
         jmn 7994,<7928
         sub @52,@48
         djn 7992,#8
         spl 6
p2ck     spl 26
         jmp 16

clrback  mov ptr,ptr2        ; using a spl-minusone bomb
         add @ptr,ptr2       ; bomb right to left
         mov splmin1,<ptr2   ; also bomb 'thru' to wherever those locations point
         mov splmin1,@ptr    ; (kind of like 'ike')
         cmp -50,<ptr        ; watch for dat 0,0
         jmp clrback
         jmn clrback,<ptr    ; don't be fooled by a single 'dat 0,0' plant
clrback2 sub @save,@ptrptr   ; back up one '@save' increment
         djn clrback,#8      ; and continue bombing right to left
                             ; (some imp-trails are connected to their bombers)

phase2   spl g1copy          ; now launch small bombers
         
sta      spl avamp           ; also start anti-vamp
         jmp g2copy
         
         dat #0
ptr2bmb  dat #-100
g1a      dat #g1bomb+1
g1copy   mov <g1a,<g1new1    ; launch first set of bombers
         mov @g1a,<g1new2    ; two sets are launched to guarantee one successful set
         djn g1copy,#4
g1new1   spl @0,g1spl+5334+4
g1new2   spl @0,g1spl+2667+4
g1spl    spl 0,<-9
         mov g1bomb,<-9
         jmp -1,<-11
g1bomb   dat <-10,<-10
         
         dat #0
         dat #-100
g2a      dat #g2bomb+1
g2copy   mov <g2a,<g2new1    ; launch second set of bombers
         mov @g2a,<g2new2    ; this set will kill the first set if successful
         djn g2copy,#4
g2new1   spl @0,g2spl+5334+4
g2new2   spl @0,g2spl+2667+4
g2spl    spl 0,<-9
         mov g2bomb,<-9
         jmp -1,<-11
g2bomb   dat <-10,<-10

avamp    jmz 0,<2            ; little different anti-vamp
         sub @1,<1           ; first search for non-zero code
         mov 500,<700        ; then reverse the sign on it
         djn -1,#75          ; and carpet-bomb from where it points
bomb1    dat #0

ref1     add #step,@2        ; partial reflection
         jmz 7999,@7880
         cmp 3999,@7879
         slt #170,@7999
         jmp 7996
         slt #3900,@7876
         mov @7875,7745
         slt #20,@7999
         mov #5,@7998
         mov 3992,@7872
         add @7996,@7992
         jmn 7998,@7870
         
next     add #step,@ptrptr   ; initial scan
scan     jmz next,@ptr
ptrptr   cmp minone,@ptr     ; ignore djn-streams
         slt #170,@ptrptr    ; ignore self
         jmp next

         slt #3900,@ptr      ; create bombing increment in 'hold' (= @save)
save     mov @ptr,hold       ; if <3900, may be an imp
         slt #20,@save       ; if <20 use #5 for increment
         mov #5,@save
attack   mov minone,@ptr     ; bomb in forward direction
         add @save,@ptrptr
scanptr  jmn attack,@ptr     ; until zero b-field is seen
         jmz clrback2,p2ck   ; if p2ck is still zero (not bombed)
         jmp ms              ; then begin reverse-bomb attack, else go to mouse
                             ; (take that paratroops!)

ref2     cmp 3999,@7879      ; partial reflection
         slt #170,@7999
         jmp 7996
         slt #3900,@7876
         mov @7875,7745
         slt #20,@7999
         mov #5,@7998
         mov 3992,@7872
         add @7996,@7992
         jmn 7998,@7870
         jmz 7942,7933

ms       mov #8,0            ; fast mouse
         add #1431,mnew
         mov <ms,<mnew
         jmn -1,ms
mnew     spl @0,0
         jmz ms,ms
         mov 0,-3

         end start
