;redcode-94
;name Provokable Pacifist
;author Blake Escritt
;email bescritt@gmail.com
;strategy Don't provoke me...
;assert (CORESIZE==8000)
ORG enemy
WID EQU (1527)

     pStep1 equ 560
     pStep2 equ 2680
     pStep3 equ -1120

     x equ -3781
     y equ -2013

begin:
jmz attack, res
sne #2, res
spl #0
dat #0, #0

attack

pGo: spl   1,      >424
     spl   1,      {761
     spl   1,      {933
     mov   {pap1,  {pBoo
pBoo:spl   pEnd+4000,{2093
pap1:spl   @pEnd,  <pStep1
     mov.i }pap1,  >pap1
pap2:spl   @0,     {pStep2
     mov.i }pap2,  >pap2
     mov.i #1,     {1
     mov   x,      <y
     mov.i {pap2,  <pap3
pap3:jmz.a @0,     pStep3
pEnd:

       PIN     1123

ENEMYP          equ     (WID*1%(CORESIZE/16-20))+1
WINP            equ     (WID*2%(CORESIZE/16-20))+1
LOSEP           equ     (WID*3%(CORESIZE/16-20))+1
HS1             equ     60
HS2             equ     180
HWARRIOR        equ     begin

enemy   ldp     #ENEMYP, #0
       jmn     HWARRIOR, $enemy

res     ldp.ab     #0, res
       sne.ab     #-1, res
       jmp     search

shake   jmz     lost, res
won     stp     #0, #LOSEP
       stp     #1, #WINP
       stp     #WID, #HS1
loser   ldp     #LOSEP, #0              ; and then check it
       ldp     #HS2, 2
       jmz     foe, 1
       seq     #WID, #0
       jmp     die
       jmz     foe, $loser
wait    jmp     0                       ; wait


lost    stp     #0, #WINP
       stp     #1, #LOSEP
       stp     #WID, #HS2
winner  ldp     #WINP, #0               ; and then check it
       ldp     #HS1, 2
       jmz     foe, 1
       seq     #WID, #0
       jmp     wait, <3056
       jmz     foe, $winner
die     dat     $0, $0                  ; lose again


foe     stp     #1, #ENEMYP
       jmp     HWARRIOR


search  jmz.f   search, {hcount

hcount   sne.i   #-100, {hcount           ; die if needed
       jmp     $0, {hcount
END

