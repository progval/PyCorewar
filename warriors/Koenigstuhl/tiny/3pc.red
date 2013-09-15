;redcode-94nop
;name 3p(c)
;author Sascha Zapf
;strategy Coreclearing Paper's
;strategy paper(paper(paper(clear))) for tiny
;assert CORESIZE==800

;optimax 1234
;optimax work ppp_tiny
;optimax suite fshtiny0.1
;optimax rounds 1 200 400 400

;optimax phase2 fshtiny0.1/clr/T766.RED
;optimax phase2 70
;optimax phase2 0%

;optimax phase3 120
;optimax phase3 0%
;optimax phase3 top15
;optimax phase3 tiny3.lst

;optimax phase4 100%
;optimax phase4 top15

bomb dat   {-1,       }-2

     decoy equ bomb+618

     dgap1 equ 78
     dgap2 equ 251
     dgap3 equ 427
     dgap4 equ 654
     dgap5 equ 424
     dgap6 equ 692
     dgap7 equ 662
     dgap8 equ 607


     mov   bomb,           <decoy+dgap1
     mov   <decoy+dgap1+1, <decoy+dgap2
     mov   <decoy+dgap2+1, <decoy+dgap3
     mov   <decoy+dgap3+1, <decoy+dgap4
     mov   <decoy+dgap4+1, <decoy+dgap5
     mov   <decoy+dgap5+1, <decoy+dgap6
     mov   <decoy+dgap6+1, <decoy+dgap7
     mov   <decoy+dgap7+1, <decoy+dgap8



pgo   spl    2, }508
      spl    1, }103
      spl    1, }122

pAw1 equ 84
pEnd equ cc+1

      mov    {cp,    {pBo1
pBo1  jmp    pEnd+pAw1,}488

;constants for the coreclear paper

nstep1 equ 125
tstep1 equ 38
cstep2 equ 355

cp    spl    @pEnd,  <tstep1
      mov.i  }cp,    >cp
nothB spl    @nothB, <nstep1
      mov.i  }nothB, >nothB
      mov.i  #1,     <1
cc    djn.b    -2,   #cstep2

end bomb+1

