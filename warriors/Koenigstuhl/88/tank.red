;redcode
;name TANK
;author  Detlef BUNK
;assert 1
;Corwar-program 'TANK' , slitting/doubling 0-Werfer
;(c) 4/89 Detlef BUNK, Norderneyweg 5, D-43 Essen
;    ergaenzte Version
       jmp start         ; only for start, ommited in further copies
ptr    DAT #27           ;program length -1,care if change program!
start  MOV #0,    @bomb   ;shoot backwd 0-bomb
       MOV #0,    @bombv  ;shoot forwd  0-bomb
       SUB #9,    bombv   ;decrement forwd-bomb, defines forwd bombarea
       ADD #9,    bomb    ;increment backwd-bomb, defines backwd bombarea
       DJN start,  count  ;decrement bombcounter
       JMP newc
newc   JMZ asave,  384    ;check adr. before new copyfield enemy prgr instruct?
       ADD #256,   new    ;if yes, i.e. non-zero, increment adr. for new copy
asave  JMZ save,  @new    ;test 1. adr. of copyfield if yes, increment copyadr
       ADD #783,   new    ;
save   MOV #41,   count   ;restore bmb-counter
       MOV #-47,  bombv   ;restore 1st bmb-adr
       MOV #32,   bomb    ;restore 1st bckwd-bmb-adr
copy   MOV @ptr,  @new    ;start copyloop
       SUB #1,     new    ;decrement copy-adress counter
       DJN copy,   ptr
       JMP ready
ready  MOV #27,    ptr    ;restore copypointer
       MOV ptr,   @new    ;copy copypointer to new program
       ADD #2,     new    ;increment for jmp to 'start'label of new copy
       SPL @new           ;invoke new progr.
       ADD #2800,  new    ;adr. for next copy to get out of own bomb-area
       JMP start          ;once again
new    DAT #544           ;adr for new copy out of own bomb-area
count  DAT #41            ;num of bombs
bomb   DAT #32            ;adr. of 1. backwd-bomb
bombv  DAT #-47           ;adr. of 1. forwd-bomb,not lower than progr.-length!
;Program firstly throws 'count' 0-bombs foreward and backward.
;Then it looks for a safe place for a new copy, checking copyarea for other
;enemy- or own program instruction to find a field which is
;filled with 0-data. First check is made far enough ahead of the eventual
;copyarea to detect 'mov 0 1'-aggressors, which can disturb the copyprocess.
;Distance must fit that the last backward-bomb of the old program
;and the last foreward-bomb of the new program cannot destroy each other.
;The second check looks for the same but checks exactly for 0 the adress of
;the first potentially copied instruction. If either check is negativ
;new copyarea is computed by decrementing copyadress.
;Then copy starts by risk of destroying own old programs or by chance
;writing over enemy programs.
; The bombed area depends on number and distance of thrown bombs.
;It should not overlap, so that there's no risk to destroy each other
;in the beginning of the battle during the first cycles. In the further course
;of the battle it is inevitable. But this has the advantage that not too many
;copys are alive. A medium amount of copys can throw more bombs as if every
;new program is occupied by copying itself.
