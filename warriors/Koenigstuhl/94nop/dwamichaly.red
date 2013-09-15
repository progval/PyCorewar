;redcode-94 verbose
;name DwaMichaly'b
;author Waldemar Bartolik
;strategy CMP-Scanner & bomber
;assert CORESIZE==8000

cel       dat  0,      0
krok      dat  #-65,       #65
szukaj    add  krok,       sprawdz
sprawdz   cmp  -181,       181
          slt  #25,        sprawdz
          jmp  szukaj
          slt  #7975,      sprawdz
          mov sprawdz,    cel
koncz     spl  szukaj
wiaz      mov  sznury,     >cel
          mov  sznury,     }cel
          jmz  wiaz       ,cel -1
sznury    spl  0,         >18
czysc     mov    bomba    ,>koncz
          djn.f  -1       ,>koncz
bomba     dat.f    >5335  , >8
          end szukaj
