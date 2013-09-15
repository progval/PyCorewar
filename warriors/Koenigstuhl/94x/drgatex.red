;redcode-94x
;name Dr. Gate X
;author Franz
;strategy Airbag bomber falls to a d-clear
;url http://www.azstarnet.com/~franz
;assert CORESIZE==55440

opt EQU 23435
stbm EQU 2
INSTALL EQU 21335
check EQU align-40

        org boot

boot    

b1      spl     1,    >-127*2

        mov.i   >b2,  }p2      ;2 times (bombs)

b2      mov.i   b1,   #sl

        mov.i   {si,  <si      ;3 times (main loop)

b3      spl     1,    >-127*3

        mov.i   {si,  <si      ;6 times (main loop)

        djn.b   >p3,  #1       ;first fall through to become 6th
        spl     *p3,  >-127*4  ;jump to 6(first instruction)
        
;this boot creates proccesses as
;1,6
;2
;3
;4
;5

p2      sub.f   #check+INSTALL,  #0                ;zero all pointers
p3      sub.f   #stone+INSTALL,  #stone+INSTALL-1
si      sub.f   #stone+8,        #stone+INSTALL+8

;check pointer to see if it's still 0, if overrun by paper or imps it 
;will triger the coreclear
dbomb   dat     >2667,           >25

;this is the part that can be hit (dat,spl?,incedenary(some)...)
stone   mov.i   check+1,         <where
where   mov.i   >stbm+(opt*3),   {stbm+(opt*4)+1
        sub.f   jump,            where
        mov.i   {stone,          {where

;this is the check for hits in main loop, imps and papers
align   jmz.f   stone,           }stone

;just a regular d-clear
jump    spl     #(-1)*(opt*3+1), >(-1)*(opt*3+1)
clr     mov.i   dbomb,           >align-20
        djn.f   clr,             >align-20

;these are the bombs, the spl is also used for checking and the checking
;mov instruction can also use the spl to bomb so it bombs (mov/spl/spl)
sl      spl     0,               0
mv      mov     opt+1,           <10

        end


 

