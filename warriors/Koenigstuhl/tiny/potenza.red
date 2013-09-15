;redcode-94x
;author Leonardo H. Liporati
;name Potenza
;strategy Replicator?
;assert CORESIZE==800

qs    equ     40
qd    equ     400
qi    equ     6

; Tiny-Q^3 scan
start sne     qd+dest+4*qs,  dest+4*qs        ; dest+1
      seq     dest+3*qs   , {dest             ; dest
      jmp     dest        , }dest

      sne     qd+dest+2*qs,  dest+2*qs        ; dest-1
      jmz     paper       ,  qd+dest+2*qs-qi  ; Free Scan

dest  mul.ab #523         , #qs
      sne    }start-1     , @dest
      add.ab #qd-2        ,  dest

loop  mov.i   start-1     , >dest
      mov.i   start-1     , >dest
      mov.i   start-1     , >dest

      jmn.f   loop        , >dest 

; Replicator
paper spl    }1           , }367 
      spl    *1           , @191 
      spl    *1           , }378 
ptr1  spl    @0           , {429 
      mov.i  }ptr1        , >ptr1
      add.i  #378         , }391 
      mov.i  {ptr1        , {ptr2
ptr2  djn.i  $262         , <99 

      end     start

