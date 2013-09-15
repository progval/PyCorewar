;redcode-94
;name Knightmare
;author Robert Hale
;assert CORESIZE == 8000
;strategy Pspace a scanner (mini hsa from electric head)
;strategy and a bomber dodger from an issue of corewarrior.
;
;       Nothing original here just piecing things together
;       I am always amazed at the great coding from various
;       corewars regulars.  I want to thank 
;
;       Beppe Bezzi
;       Planar
;       Paul Kline
;       Ian Oversby
;       Robert Macrae
;       J. Pohjalainen
;       Steven Morrell
;       and all the others that publish warriors
;
;       I always learn a lot from them and the efforts 
;       of all that contribute to corewarrior.  Thank you
;
;       and as always I wish I had more time.
;
;       Robert G. Hale
;       Lockheed Martin
;       Command and Control System
;       (719)594-1734
;       rhale@ccs.lmco.com
;       rghale@market1.com


;********** Brain ***********************************
;
;  The brain is a simple switch of loss brain
; for jack in the box.

_RES    equ     0
_STR    equ     72

brain
res     ldp.ab  #_RES, #0
        ldp.a   #_STR, str1
        sne.ab  #0, res        ;switch on loss
lost    add.a   #1, str1
        mod.a   #2,     str1
        stp.ab  str1, #_STR
str1    jmp     @0, hboot
        dat     0, dscan


;--------
;MINI HSA
;--------

hboot: mov    btm,@dest
N FOR 8
      mov    btm-N,<dest
ROF
      spl    @dest,1
dest: mov    #250,@away
      mov    bomb,<dest
      div.f  #0,dest
        dat     0,0

step EQU 9
ptr EQU (bomb-5)
away EQU (-3621)

bomb: spl    #1,{1
kill: mov    bomb,<ptr
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #step+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill


;******** bomber dodger ************
; changed the launch to be a faster but longer

dval    equ     800
spt     equ     (last+300)

dscan   JMZ.F           dscan,  >spt    
        SUB.AB  #3,             spt             
cloop   MOV.I           >bptr,  >spt
        MOV.I           >bptr,  >spt
        MOV.I           >bptr,  >spt
        MOV.I           >bptr,  >spt
        MOV.I           >bptr,  >spt
        MOV.I           >bptr,  >spt
        SUB.AB  #3,     spt
bptr    JMP.B           @spt,   #gat

gat     DAT.F           #0,     #5
dbomb   DAT.F           >2667,  #5      
        SPL.B           #0,     >gat+2667
dloop   MOV.I           dbomb,  >gat    
dl      DJN.F           dloop,  >gat    
        
last    end             brain


