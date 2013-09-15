;redcode-94nop
;name Dawn
;author Roy van Rijn
;strategy q^4 into 2 papers (clearpaper and anti-imp/imp-paper)
;assert 1

; I made this warrior first as an update to Revenge of the Papers,
; but after alot of programming only the first paper looks a bit like
; the one from Revenge of the Papers.
; So I decided to name it and submit,
; currently its 5th on the nop hill and still looking strong.
; I made it with in my mind the age,
; and I was surprised to see it so high on the hill

; This is a pointer for the qscan
load0 z for 0
        rof

; Some highly optimized constants
nstep1 equ 851
cstep1 equ 1857
tstep1 equ 3218

; Generate 8 processes
pGo     spl     1       , <B1
t2      spl     1       , <B2
        spl     1       , <B3

; Split to the other paper
        spl     pGo2    , }6324

pAw1   equ 2000
pAw2   equ 6000

; I changed some parts of the paper from < into }
; It seems to work just slightly better

      mov    {cp,    {pBo1
pBo1  spl    pEnd+pAw1,}3048

      mov    {pEnd,  {pBo2
pBo2  jmp    pEnd+pAw2,}6829

cp    spl    @pEnd,  }tstep1
      mov.i  }cp,    >cp
nothA spl    @nothA, }cstep1
      mov.i  }nothA, >nothA
nothB spl    @nothB, }nstep1
      mov.i  }nothB, >nothB
      mov.i  #1,     <1
      djn    -2,     <4546
pEnd  dat    0,      0

for 29
dat 0,0
rof

; Some pointers, placed after optimization
        dat     dat0+1        , A1
t1      dat     dat0+1        , A2

dat 0,0

; The "easy to optimize" cut-n-paste Q-scan from Corewarrior #84
; (Thanks Joonas!)
; I tried some other ones but this one scored far better then the rest
; Feel free to mail me with updates/patches/changes

dat0    equ     (load0-123)

M equ 8000
invert equ (a=x*x%M)+(a=a*x%M)+(a=a*a%M)+(a=a*x%M)+(b=a*a%M)+(b=b*b%M)+(b=b*b%M)+(c=b*b%M)+(c=c*b%M)+(d=c*c%M)+(d=d*d%M)+(d=d*d%M)+(d=d*c%M)+(d=d*d%M)+(d=d*c%M)+(y=a*d%M)

FACTOR  equ    1283

        dat     0*((x=FACTOR) + invert)         ; y = FACTOR^{-1} (mod 8000)

D       equ     (y+1)                           ; decoding factor
A1      equ     (1 + FACTOR * (t1-1 - qb))      ; t1 entry
A2      equ     (1 + FACTOR * (t1   - qb))
B1      equ     (1 + FACTOR * (t2-1 - qb))      ; t2 entries
B2      equ     (1 + FACTOR * (t2   - qb))
B3      equ     (1 + FACTOR * (t2+1 - qb))
C2      equ     (1 + FACTOR * (t3   - qb))      ; t3 entry

t3      dat     qb      ,       C2

        ; -- Decoding phase --
decode
q0      mul.b   *2      ,       qb
decide  sne     {t1     ,       @qb     ; \  The A-fields are pointers to
q1      add.b   t2      ,       qb      ;  } decoding tables.
        add.ba  *t3     ,       qb      ; /

        ; -- Attack phase --
        mov     qdat    ,       *qb
        mov     qdat    ,       @qb
qb      mov     24      ,       *D
        sub     qsub    ,       qb
        djn     -4      ,       #6
        jmp     pGo

qsub    dat     -15     ,       21
qdat    dat     10      ,       0

        ; no decoder mutations
qscan   seq     qb + D  ,       qb + D + B2             ; 1851781470
        jmp     decide

        ; q0 mutations
        sne     qb + D * C2,    qb + D * C2 + B2
        seq     <t3     ,       qb + D * (C2-1) + B2
        jmp     decode  ,       }q0             ; t3 + C2-1 = qb+D*(C2-1)

        sne     qb + D * A1,    qb + D * A1 + B2
        seq     <t1-1   ,       qb + D * (A1-1) + B2
        djn.a   decode  ,       {q0             ; t1-1 + A1-1 = qb+D*(A1-1)

        sne     qb + D * A2,    qb + D * A2 + B2
        seq     <t1     ,       qb + D * (A2-1) + B2
        jmp     decode  ,       {q0             ; t1 + A2-1 = qb+D*(A2-1)

        ; q1 mutations
        sne     qb + D * B1,    qb + D * B1 + B1
        seq     <t2-1   ,       qb + D * (B1-1) + (B1-1)
        jmp     decode  ,       {q1             ; t2-1 + B1-1 = qb+D*(B1-1)

        seq     qb + D * (B1-2),qb + D * (B1-2) + (B1-2)
        djn     decode  ,       {q1

        sne     qb + D * B3,    qb + D * B3 + B3
        seq     <t2+1   ,       qb + D * (B3-1) + (B3-1)
        jmp     decode  ,       }q1             ; t2+1 + B3-1 = qb+D*(B3-1)

        ; no mutations
        sne     qb + D * B2,    qb + D * B2 + B2        ; 5767486149
        seq     <t2     ,       qb + D * (B2-1) + (B2-1)
        jmp     decode                          ; t2 + B2-1 = qb+D*(B2-1)
        jmp     pGo

for 4
dat 0,0
rof

; The other paper is just Revenge of the Paper with other constants
; But its still going well on the Hill, it has too much losses
; So I added a "anti imp/imp-paper"
; This paper comes for a part from Return of the Jedimp
; But I made it more suitable for the hill today,
; and I optimized the constants

d2    equ 1143
TSTEP equ 7462
bstep equ 3237
boot  equ 1700-(80+15)*4-1

pGo2
        mov     <1,     {1
        jmp     boot,   }imp2+1
evol:   spl     @evol,  }TSTEP
        mov.i   }evol,  >evol
evoli:  spl     #d2,    bstep-1
        mov     bmb,    >2
        add.f   evoli,  j
j:      jmp.f   imp2-d2*8, {-6+bstep

; This bomb is changed into an anti-imp bomb
bmb     dat     <1143,  <2667
imp2    mov.i   #d2,    *0

end qscan

