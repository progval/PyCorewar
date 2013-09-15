;redcode
;name Keystone t13
;author P.Kline
;strategy upgraded Emerald 4
;strategy stone + better anti-vamp
;strategy antivamp is converted by stone into core-clear/gate
;strategy if antivamp is dead, stone converts self into gate
;strategy if stone detects paper launches long 3-point imps
;assert 1
spacing  equ 2517        ; mod-1, but approximates a mod-4 step while
                         ;   avoiding mod-4 collisions with opponent's step
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
         dat #-start,#1
m0       spl mimp+5334,<-10
         spl -1,<-11                ; continuous imp-ring launcher
         spl mimp+2667,<-12         ;   stays here, activated by stone
mimp     mov 0,2667                 ;   if necessary
         mov 1,2666                 ; backup in case mimp gets decremented
         mov 0,2667
emerald  spl 0,<-25
stone    mov <cnt-spacing-1,cnt+107-13
         sub inc,stone
cnt      djn stone,<inc-1300+1+3300 ; gbbs for gate
inc      jmp spacing,<-spacing      ; jump to imp-ring launcher
copyf    dat #0
copyt    dat #copyf+1020-2000-2073+527
         dat #0
                                    ; 'gbbs' = gets bombed by stone
hide1    spl 0,<-25                 ; improved antivamp
hide2    mov 35,<-105               ; ptr gbbs to assist partial gate
hide3    sub <-105,@hide2           ; gbbs for core-clear
hide4    dat <-26,<-26              ; antivamp & coreclear bomb, imp-gate
hide5    djn -1,<-105+5332          ; moved by stone onto hide3
hide6    djn 0,<-12                 ; moved by stone onto cnt for gate
hide     dat #7242-2073-8+527
start    mov #-6,hide+6-2073+7242-119-1+527
         mov hide5,hide5+4807-spacing-1+527
         mov hide6,hide6+2513-1+527
         mov hide4,inc+527-2073-17+1643+350-153+6-512-128+88-2000
         mov hide3,<hide
         mov hide2,<hide
         mov hide1,<hide
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         spl @copyt
         spl @copyt
         jmp @hide
         end start
