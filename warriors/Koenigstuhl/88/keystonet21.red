;redcode quiet
;name Keystone t21
;author P.Kline
;strategy stone + anti-vamp
;strategy antivamp is converted by stone into core-clear/gate
;strategy if antivamp is dead, stone converts self into gate (djn 0,<-12)
;strategy if stone detects paper -> launch long 3-point imps & spl-carpet
;strategy t21: faster, more compact launch;  added redundancy; better gate
;assert 1
spacing  equ 2517        ; mod-1, approximates a mod-4 step

         dat #-start,#1  ; long decoy to delay scanners
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
         dat #-start,#1
hptr2    dat #hide6+2512+527+1

m0       spl mimp+5334,<mimp+5330   ; < = decrement stream
         mov 1,<-100
m1       spl -2                     ; continuous imp-ring launcher
         spl mimp+2667,<m0          ;   stays here, activated by stone
mimp     mov 0,2667                 ;   if necessary
         mov 1,2666                 ; backup in case mimp gets decremented
         mov 0,2667
emerald  spl 0,<-25
stone    mov <cnt-spacing-1,cnt+107-13
         sub inc,stone
                                    ; 'gbbs' = gets bombed by stone
cnt      djn stone,<inc-1300+1+3300 ; gbbs with hide6 for gate
inc      jmp spacing,<-spacing      ; jump to imp-ring launcher
copyf    dat #0
copyt    dat #copyf+1020-2000-2073+527
hptr1    dat #hide5+4807-spacing-1+527+1
hide1    spl 0,<-25                 ; improved antivamp
hide2    mov 35,<-105               ; ptr gbbs to assist partial gate
hide3    sub <-105,@hide2           ; gbbs with hide5 for core-clear
hide4    dat <-26,<-24              ; antivamp & coreclear bomb, imp-gate
hide5    djn -1,<-105+5332-31-13    ; moved by stone onto hide3
hide6    djn 0,<-12                 ; moved by stone onto cnt for gate
hideto   dat #7242-2073-8+527
hidefr   dat #hide3+1
start    mov #-6,hideto+6-2073+7242-119-1+527 ; avamp pointer
         mov mimp,mimp+2667         ; redundancy
         mov hide4,inc+527-2073-17+1643+350-153+6-128+88-2512
         mov <hidefr,<hideto
         mov <copyf,<copyt
         spl 1                      ; use two processes
         mov hide5,<hptr1           ; store this for later
         mov hide6,<hptr2           ; store this for later
         mov <hidefr,<hideto        ; copy anti-vamp/core-clear
         mov <copyf,<copyt          ; copy stone
         mov <copyf,<copyt
         spl @copyt
         spl @copyt
         jmp @hideto                ; 22 instructions and we're clear
         end start
