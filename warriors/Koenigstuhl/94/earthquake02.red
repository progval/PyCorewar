;redcode-94 quiet
;name Earthquake v0.2
;author Bjoern & Ian
;strategy v0.1  P-Switching Justice 2 and Tsunami v0.1
;strategy v0.2  Added QScan and a few other alterations
;assert 1

org     start

pflag   equ     111     ; Not really

jstep   equ 3364        ; stuff for Justice
jshift  equ 2200        ; Not really

gate1           equ (gate-3) ; stuff for Tsunami
tsushift        equ 640 ; Not really

start

; A _really_ great old fashioned QScan was here !
; Deleted just in case so add your own.

;;------------------------------------------------------------

pGold     ldp.ab #0,#0                ; get results of last battle
          ldp.a  #pflag  ,pGold       ; retrieve attempted strategy
          add.a  #1      ,@pGold      ; if a loss, increment strategy
          mod.a  #2      ,pGold       ; safeguard against brainwashing
          stp.ab pGold   ,#pflag      ; store current strategy
          jmz.a  jboot   ,pGold       ; select strategy 1

;;------------------------- Tsunami --------------------------

tsboot          mov.i {bsource,<bootptr
                mov.i {bsource,<bootptr
                mov.i {bsource,<bootptr
                djn.b tsboot,#3

bootptr         spl.b loop+tsushift,bptr+tsushift+1
                mov.i 0,-1
bsource         dat.f bptr+1,0

gate            dat.f #-25,bptr-gate1+3
                spl.b #-20,#20
b1              spl.b #310,#300
loop            add.f step,@scan
scan            sne.i *b1,@b1
                djn.f loop,<-800
step            spl.b #20,#20
cloop           mov.i @bptr,>gate1
bptr            djn.b cloop,{b1

;;------------------------- Justice --------------------------

jcptr           dat >jstart,#jbomb+2
jcb             dat >20,#jbomb+2-jcptr
                dat 0,0 
jstart          spl #0,>jcptr-2
jptr            mov.i jbomb,*(jhit+3*jstep)     
                mov.i jbomb,@jptr               ;this bomb hits
jhit            add.ab #2*jstep,jptr
                jmz.b jptr,#0
                mov.i jcb,>jcptr
                djn.f -1,>jcptr
jbsource        dat 0,0
jsplit          spl #0,<0
for 3
                dat 0,0
rof
jbomb           mov.i jstep,1

jboot           mov.i jsplit,@jbooptr           ;move spl to jhit+jstep
                mov.i jbomb,*jbbooptr
ijloop          mov.i {jbsource,{jbooptr
for 4
                mov.i {jbsource,{jbooptr
rof
                djn.b ijloop,#2

jbooptr         spl *jbsource+jshift,jhit+jstep+jshift  
jbbooptr        div.f #jbomb+jshift,#0
                dat 0,0 
                
end
