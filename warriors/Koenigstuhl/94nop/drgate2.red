;redcode
;name Dr. Gate v2
;author Franz
;strategy Airbag bomber(.6c)->d-clear
;strategy I should start numbering the versions :)
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000
        
opt EQU 155
stbm EQU 2

;of course this isn't the true value :)
INSTALL EQU 1352

check EQU align-40

        org boot
  
boot
  
b1      spl 1,>-127*2

        mov.i >b2,}p2      ;2 times (bombs) 

b2      mov.i b1,#sl

        mov.i <s6,<p2      ;3 times (main loop)

b3      spl 1,>-127*3

        mov.i <s6,<p2      ;6 times (main loop)

        djn.b >p1,#1       ;first fall through to become 6th
s6      spl *p1,#stone+8   ;jump to 6th process

;this boot creates proccesses as
;1,6
;2
;3
;4
;5

;make 1,1 to kill pointers / slow djn trains

p1      div.f #stone+INSTALL,#stone+INSTALL-1
p2      div.f #check+INSTALL,#stone+INSTALL+8

dbomb   dat >2667,>25

;this is the part that can be hit (dat,spl?,incedenary(some)...)
stone   mov.i check+1,<where
where   mov.i >stbm+(opt*3),{stbm+(opt*4)+1
        add.f jump,where
        mov.i {stone,{where

;this is the check for hits in main loop, imps and papers
align   jmz.f stone,}stone

;just a regular d-clear
jump    spl #opt*3+1, >opt*3+1
clr     mov.i dbomb, >align-20
        djn.f clr, >align-20
  
;these are the bombs, the spl is also used for checking and the checking
;mov instruction can also use the spl to bomb so it bombs (mov/spl/spl)
sl      spl     0,        0
mv      mov     opt+1,    <10

datz    end

