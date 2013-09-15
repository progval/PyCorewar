;redcode-94x verbose
;name  Glasswalker V1.0
;author Paul Mumby
;strategy Silk based Paper, with a dual mode stone (attempted anti-imp)
;assert   CORESIZE >= 10000 && MAXLENGTH >= 75

bootstrap spl     bomber, 150       ;Boot the bomber
          spl     rbomber,<500      ;Boot the reverse bomber
          jmp     rep,    <550      ;Goto the replicator

decoy1    for     21                ;A decoy
          jmp     0,      <0        ;
          rof                       ;

rep       spl     1,      <600      ;\
          spl     1,      <650      ; \
          spl     1,      <700      ;  \
          spl     1,      <850      ;  / Create 62 processes
          spl     1,      <900      ; /
          mov     -1,     0         ;/
silk      spl.a   @-30,    121       ;Silk based Copy
          mov.i   }silk,  >silk     ;Silk based Copy

bomber    add     #300,   btarget   ;Add to bomb target
          mov     bomb,   @btarget  ;BOMBS AWAY!
          spl     bomber, <500      ;Spawn new bomber
          jmp     bomber, <800      ;Restart

decoy2    for     20                ;Another decoy
          jmp     0,      <-1       ;
          rof                       ;

rbomber   sub     #300,   rbtarget  ;Subtract from bomb target
          mov     bomb,   $rbtarget ;BOMBS AWAY!
          spl     rbomber,<600      ;Spawn a new bomber
          jmp     rbomber,<700      ;Restart

bomb      dat     {-1,    {0        ;Bomb Data (attmpted anti-imp)
btarget   dat     #0,     #0        ;Target variable.
rbtarget  dat     #0,     #0        ;Other Target variable.
