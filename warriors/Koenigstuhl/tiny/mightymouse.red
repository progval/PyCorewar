;redcode-94x
;name Mighty Mouse
;author Winston Featherly-Bean
;strategy q^4 -> stone -> quasi-clear
;strategy I was determined to create a decent, original warrior.
;strategy Around 3/29 it became obvious that that wasn't going to happen,
;strategy so I ripped a stone from CW61, tagged on snufkin's q^4,
;strategy and fiddled with constants and the clear.  Amazingly, it turned out
;strategy to be quite a bit less than the sum of its parts =p.  Ah, the
;strategy process was highly enjoyable, though.  I may as well take this
;strategy opportunity to beg for a beginner's hill to be set up.
;strategy Lukasz Grabun is banned ;).
;assert CORESIZE==800
s equ 56

     qa equ 736
     qb equ 551
     qf equ qta
qs
   ; scan 9 locations

     seq   qf-2*(qa-1)*(qb-1),qf+(qa-1)*(qb-1)
     djn.f qta,               qta
     sne   qf-2*(qa-1)*(qb),  qf+(qa-1)*(qb)
     seq   qf-2*(qa)*(qb),    }qta
     jmp   qta,               {qta
     sne   qf-2*(qa+1)*(qb),  qf+(qa+1)*(qb)
     jmz.f start,               <qta

qta: mul.x #qa,      #qb    ; decode
     sne   >-127,    @qta
     mul.f #-2,      qta

qlo: mov   <355,     >qta   ; attack
     mov   }qlo,     {qta
     mov   {qta,     >qta
     djn   qlo,      #13

start   spl     #0, {-s+1
        add.f   3, 1
        mov     }s-2, -s+1
        djn.f   -2, <-316
        mov     s, <-s
        djn.f   -1, <-s-1
end qs

