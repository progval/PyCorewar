;redcode-94 quiet
;name Keystone t33
;author P.Kline
;strategy stone + anti-vamp
;assert CORESIZE==8000

spacing  equ 2517        ; mod-1, approximates a mod-4 step

      for 29
         dat    #-(start*8),2667
      rof
start    mov #-6,hideto+5582        ; avamp pointer
         mov #100,hideto+5582+78
         mov hide4,inc-2269
         mov <hidefr,<hideto
         mov hide5,<hptr1           ; store this for later
         mov hide6,<hptr2           ; store this for later
         mov hide7,<hptr1           ; store this for later
         mov hide8,<hptr2           ; store this for later
         spl 1
         mov <hidefr,<hideto        ; copy anti-vamp/core-clear
         mov <copyf,<copyt          ; copy stone
         mov <copyf,<copyt
         spl @copyt
         spl @copyt
         jmp @hideto                ; 22 instructions and we're clear

keystone spl    #spacing,<-spacing
stone    mov    <cnt-spacing-1,cnt+107-13
         sub    keystone,stone
cnt      djn.f  stone,<inc-1300+1+3300 ; gbbs with hide6 for clear
inc      dat    0,0
copyf    dat    #-1
copyt    dat    #copyf+1020-2000-2073+527-1
hptr1    dat    #hide5+4807-spacing-1+527+1
                                       ; 'gbbs' = gets bombed by stone
hide1    spl    #0,<-24                ; improved antivamp
hide2    mov    35,<-105               ; ptr gbbs to assist partial gate
hide3    add.ab <-105,@hide2           ; gbbs with hide5 for core-clear
hide4    dat    <-25,<-15              ; antivamp & coreclear bomb, imp-gate
hide5    djn.f  -1,>-27                ; moved by stone onto hide3
hide6    djn.f  #0,<-25                ; moved by stone onto cnt for gate
hideto   dat    #7242-2073-8+527
hidefr   dat    #hide3+1
hptr2    dat    #hide6+2512+527+1
hide7    djn.f  0,>-26                 ; moved by stone onto hide3
hide8    djn.f  #0,<-24                ; moved by stone onto cnt for gate

      for 37
         dat    #-(start*8),2667
      rof
         end start
