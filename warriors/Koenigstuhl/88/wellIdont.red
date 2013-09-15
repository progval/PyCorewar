;redcode
;name Well I don't know.
;author Paulsson
;assert 1
; I didn't think I would have any chance at all
; against Morell since he has superior knowlege of
; what you can do with 88'code.
; So I decided on a defensive strategy with
; continously launched imps and a paper.
; Stolen from B-Panama! (by Morell :-).
; Now I think this will tie anything but cmp scanners and
; I don't think Morell will have time to write one.
; One point is better than no point!

istep   equ     2667

tjo2      spl 1
          mov -1,0
          mov -1,0
          mov #5,0
          mov <-1,<1
          spl @0,-3135
          mov 2,<-1
          jmz -4,-4
     dat        #0,#0

start   spl     tjo
        spl     0,<-2000
        spl     1,<-1
skit    spl     1,<-4000
        spl     2,<-1
ptr     jmp     imp-2*istep,-150
        add     step,-1
step    dat     #istep,#-50
tjo     spl     tjo2
        add     step,ptr
        jmp     -1,<skit
imp     mov     0,istep


end start
