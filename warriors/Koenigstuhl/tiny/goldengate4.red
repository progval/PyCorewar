;redcode-94x
;name Golden Gate v4
;author Franz
;strategy Airbag bomber(.6c)->d-clear
;url http://www.azstarnet.com/~franz
;assert CORESIZE==800

opt EQU 215
stbm EQU 2
INSTALL EQU 126
check EQU (align-40)

        org boot

boot    
        mov.f #opt+1,@b2

b1      spl 1,>-27*2

b2      mov.i b1,#check+INSTALL+1

        mov.i <s6,<p2      ;3 times (main loop)

b3      spl 1,}-27*3

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
p2      div.f #1,#stone+INSTALL+8

dbomb   dat >267,>15

;this is the part that can be hit (dat,spl?,incedenary(some)...)
stone   mov.i check+1,<where
where   mov.i >stbm+(opt*3),{stbm+(opt*4)+1
        add.f jump,where
        mov.i {stone,{where

;this is the check for hits in main loop, imps and papers
align   jmz.f stone,}stone

;just a regular d-clear
jump    spl #opt*3+1, >opt*3+1
clr     mov.i dbomb, >align-10
        djn.f clr, >align-10

datz    end

