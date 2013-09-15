;redcode-tiny
;name Provenance
;author John Metcalf
;strategy oneshot with escape route
;assert CORESIZE==800

     step  equ 48
     diff  equ 8
     first equ wipe+201
     gate  equ dbmb-1
     safe  equ wipe-40

; ** typical spl/dat clear **

ptr  dat   first,          first-diff

     dat   2,              9
sbmb spl   #-30,           14
wipe mov   @bptr,          >ptr
     mov   @bptr,          >ptr
bptr djn.f wipe,           {sbmb

     for   3
     dat   0,              0
     rof

; ** oneshot / dodger loop **

scan sub   inc,            ptr
     seq   *ptr,           @ptr
     djn.f sbmb,           ptr
     jmz.f scan,           bptr+1  ; check

; ** panic, launch d-clear **

copy mov   @boot,          {boot
     djn   copy,           boot
boot djn.f *safe,          #dclr+2

dbmb dat   <1,             11
inc  spl   #-step,         }-step
dclr mov   dbmb,           >gate
     djn.f dclr,           >gate

     end   scan+1
