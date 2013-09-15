;redcode
;name Plasma-Advanced
;author Wayne Sheppard
;contact wsheppar@st6000.sct.edu
;strategy Plasma scans until it finds a trace of the enemy 
;strategy (weeding out DJN trails).
;strategy If location is an imp, try to stun the imps.
;strategy Otherwise bomb the location AND the traceback location.
;strategy Then follow up with anti-imp paper.
;strategy Added Bomb Train protection against Paratroops.
;strategy Fails against scanners and replicators
;strategy Should beat anything else ( Chimera might be close )
;assert 1

pittrap   equ loc-2

;;;;This section stuns the imps
;;;;then follows up with coreclear/gate

killimps  sub #20,loc
loc       mov s,-1
          add #2667,loc
          djn loc,#100
s         spl 0,<-10
          mov gate,<-2
          jmp -1,<-22
gate      dat <-12,<-11

;;;; Paper

          mov #8,8
p3        mov <-1,<2
          mov <-2,<1
          spl @0,1111
          mov 0,<1
          mov <-2,<800
          jmz -6,-6
          dat <-5,<-6
          dat <-5,<-6

          mov #8,8
p4        mov <-1,<2
          mov <-2,<1
          spl @0,1711
          mov 0,<1
          mov <-2,<860
          jmz -6,-6
          dat <-5,<-6
          dat <-5,<-6

          mov #8,8
p5        mov <-1,<2
          mov <-2,<1
          spl @0,3111
          mov 0,<1
          mov <-2,<880
          jmz -6,-6
          dat <-5,<-6
          dat <-5,<-6

          mov #8,8
p6        mov <-1,<2
          mov <-2,<1
          spl @0,3311
          mov 0,<1
          mov <-2,<900
          jmz -6,-6
          dat <-5,<-6
          dat <-5,<-6

          mov #8,8
p7        mov <-1,<2
          mov <-2,<1
          spl @0,3511
          mov 0,<1
          mov <-2,<920
          jmz -6,-6
          dat <-5,<-6
          dat <-5,<-6

paper2    spl p3,<1212
          spl p4,<1312
          spl p5,<1412
          spl p6,<1512
          spl p7,<1612
          mov #8,8
          mov <-1,<2
          mov <-2,<1
          spl @0,3711
          mov 0,<1
          mov <-2,<940
          jmz -6,-6
          dat <-5,<-6

;;;;Here is the basic paper design
;;;;modified to spread "Dorks" around the core
;;;;If the Dork ( MOV 0,<1 ) hits the head
;;;;of the imp, the imp dies

paper     spl 1
          spl 1
          spl paper2
          mov #8,8
          mov <-1,<2
          mov <-2,<1
          spl @0,4211
          mov 0,<1
          mov <-2,<960
          jmz -6,-6
          dat <-5,<-6

;;;;Start with a Plasma scan
;;;;Find something out there

start     add #3039,loc
          jmz -1,@loc              ;B-scan for enemy
          cmp #-1,@loc             ;Don't scan DJN trails
          slt #100,loc             ;Don't scan self
          jmp -4,1000

          mov loc,pittrap          ;Save pointer
          sub @loc,pittrap         ;Zero in on PitTrappers
          
          sub #2667,@loc           ;Is it an imp
          jmz killimps,@loc

          mov bomb,<loc            ;Bomb location
          mov bomb,<pittrap        ;+ pittrap location
          djn -2,#50               ;for a while
          spl -2,<4000

          spl paper,<4177
          
;;;;Imps are needed to survive          
;;;;against imp/vamp combos like Chimera

          spl 1,<4277
          spl 1,<4377
          spl 1,<4477
          spl offset,<4566
          jmp @0,imp
offset    add #2667,-1
bomb      dat <0,<2121
imp       mov 0,2667

end       start
