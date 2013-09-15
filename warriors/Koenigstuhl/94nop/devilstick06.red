;redcode-94
;name Devilstick.V.06
;author Roy van Rijn
;strategy Anti-Imp & Bomber with Timescape Replicator and a 11 process
;assert 1

NSTEP   equ     1319
CSTEP   equ     1871
TSTEP   equ     1471
gate    equ     wait-5

        spl     rep
wait    jmp     wait,   <gate

rep     spl     1,      <3333
        mov     -1,     0
        spl     1,      <1234
        mov     -1,     0

cp      spl     @cp,    }TSTEP
cp2     mov.i   }cp,    >cp     ;Copy (Timescape style)

noth    spl     @noth,  }CSTEP
noth2   mov.i   }noth,  >noth ;Copy the dummy (Timescape style)

        mov     bomb,   <101   ;Bomb against ImpRings etc...
        mov     bomb2,  <202   ;Bomb against DJN streams
        jmp     -2

att     mov.i   {noth,  <att
att2    jmp     @att,   >NSTEP

bomb    dat     <-2666, <2667   ;Bomb against ImpRings etc...
bomb2   dat     1,      1       ;Bomb against DJN streams

        end

