;redcode-94m 
;name Get Evener
;author Robert Macrae
;assert CORESIZE == 8000 
;strategy Defensive Imp/Paper/Imp

; <sigh> I really tried to write a new warrior this time, an imp/clear.
; Unfortunately, I sent it to Koth with a very detailed strategy line
; intact, and Zul has a warrior on Koth which seems likely to beat it.
;
; Of course, he might think I'm bluffing }8-? but I have to guess that
;   a) he will enter a derivative of his defensive, hill-type warrior and
;   b) its a diehard-like paper which beats my D-clear derivative.
;
; So here comes Diehard, with a kicker imp to personalise it and avoid
; a multiplicity of Klines in the scoring :-(
 
space    equ (4-40*127) 
dv       equ (c0+58) 
 
start    spl imp, }-2200
         spl 1,   }-2100         ; make 8 processes   
         spl 1,   }-2000
         spl 1,   }-1900 
 
c0       spl   @0,space          ; here is Die Hard 
         mov   }c0,>c0 
cs       spl   #0        ,}dv     
         mov   dv        ,}dv+space 
cb       add.a #119      , dv+space 
         spl   imp+5334  ,}dv+space 
         spl   imp+2667  ,}dv+space
 
imp      mov.i #2667 ,*0 

     for 10
              dat   0,0
     rof
     for 25
              dat   1,1              ; delay djn-stream overruns
              spl   1,1              ; decoy Scanners ;-?
              spl   @1,1
     rof

impxx   mov.i   #1, 1                ; just for fun

        end start
