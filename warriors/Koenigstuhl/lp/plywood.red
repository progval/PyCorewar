;redcode
;name Plywood
;author Franz
;strategy Round 5 entry, Dr. Gate(2 versions) / Zippo / Timescape (one)
;strategy 38 (I think) instructions precisesly!
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000

opt EQU 155
stbm EQU 2
INSTALL EQU 2335
check EQU align-40


FOR MAXPROCESSES==8
sl EQU sl1
mv EQU mv1
ROF
FOR MAXCYCLES==80000 && MAXPROCESSES>8
sl EQU sl2
mv EQU mv2
ROF


FOR MAXCYCLES==80000

b1      spl 1,>-127*2

        mov.i >b2,}p2

b2      mov.i b1,#sl

        mov.i <s6,<p2

b3      spl 1,>-127*3

        mov.i <s6,<p2

        djn.b >p1,#1
s6      spl *p1,#stone+8
        
p1      div.f #stone+INSTALL,#stone+INSTALL-1
p2      div.f #check+INSTALL,#stone+INSTALL+8

dbomb   dat >2667,>25

stone   mov.i check+1,<where
where   mov.i >stbm+(opt*3),{stbm+(opt*4)+1
        add.f jump,where
        mov.i {stone,{where

align   jmz.f stone,}stone

jump    spl #opt*3+1, >opt*3+1
clr     mov.i dbomb, >align-20
        djn.f clr, >align-20

ROF

FOR MAXPROCESSES==8
sl1     dat     0,        0
mv1     dat     opt+1,    <10
ROF
FOR MAXCYCLES==80000 && MAXPROCESSES>8
sl2     spl     0,        0
mv2     mov     opt+1,    <10
ROF

FOR MAXCYCLES==80001
zstep equ 155

zsp     spl 0,#zstep
zstone  mov zmv,@zjump+(zstep*2)
zclrs   mov zsp,@zstone
        add #zstep*2,zstone
zjump   jmp zstone,<zjump-20
zmv     mov zstep,<-zstep 
        djn -1,<-4001
ROF

FOR MAXCYCLES==79999

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

        spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             #0

tim2    spl     @tim2,          }TSTEP
        mov.i   }tim2,          >tim2
cel2    spl     @cel2,          }CSTEP
        mov.i   }cel2,          >cel2
        mov.i   <-FSTEP,        {FSTEP
        mov.i   {cel2,          <ncl2
ncl2    jmp     @ncl2,          >NSTEP

ROF

        end
