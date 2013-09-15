;redcode-94x
;name Dr. Recover
;author Franz
;url http://www.azstarnet.com/~franz
;strategy self check stone which recovers by a spl/dat coreclear
;strategy works on normal/big hills
;assert CORESIZE==8000 || CORESIZE==55440

FOR CORESIZE==8000
opt EQU 155
INSTALL EQU 2335
ROF

FOR CORESIZE==55440
opt EQU 23435
INSTALL EQU 21335
ROF

stbm EQU 3
check EQU align-80

        org boot

boot    

b1      spl     1,    >-127*2

        mov.i   >b2,  }p3      ;2 times (bombs)

        mov.i   }p2,  >p2      ;2 times (gate,spl/dat bombs)

        mov.i   {si,  <si      ;2 times (main loop)

b2      mov.i   b1,   #sl

b3      spl     1,    >-127*3

        mov.i   {si,  <si      ;6 times (main loop)

        djn.b   >p3,  #1       ;first fall through to become 6th
        spl     @si,  >-127*4  ;jump to 6(first instruction)
        
;this boot creates proccesses as
;1,6
;2
;3
;4
;5

p2      sub.f   #gate,           #align-38+INSTALL ;zero all pointers
p3      sub.f   #check+INSTALL,  #stone+INSTALL-1
si      sub.f   #stone+8,        #stone+INSTALL+8

;these are used for the spl/dat coreclear
gate    dat     >-1,             >57
bombs   spl     #-1500,          >57

;these are the bombs, the spl is also used for checking and the checking
;mov instruction can also use the spl to bomb so it bombs (mov/spl/spl)
sl      spl     #0,               0
mv      mov     opt+1,           <10

;this is the part that can be hit (dat,spl?,incedenary(some)...)
stone   mov.i   check+1,         <where
where   mov.i   >stbm+(opt*3),   {stbm+(opt*4)+1
        sub.f   jump,            where
        mov.i   {stone,          {where

;this is the check for hits in main loop, imps and papers
        jmz.f   stone,           }stone

;spl/dat clear
align
jump    spl     #(-1)*(opt*3+1), >(-1)*(opt*3+1)
clr     mov     @djmp,           >align-38-10
djmp    djn.b   clr,             {align-38+1

        end


 

