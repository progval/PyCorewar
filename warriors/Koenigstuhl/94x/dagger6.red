;redcode-94x
;name Dagger v6.0 X
;author Michael Constant
;kill Dagger
;strategy  spl/jmp cmpscanner
;assert CORESIZE==55440

adder   add     full,   scan
scan    cmp.x   -2-386, -2
        slt     #half-scan+386+1, scan
cnt     djn     adder,  #27722
attack  mov     jump,   @scan
        mov     split,  <scan
        add     half,   scan
        jmn     scan,   cnt          ;note scan not adder
split   spl     0,      >-384
        mov     half,   <-2
jump    jmp     -1,     <-386
full    dat     >-772,  >-772
half    dat     >-386,  >1-386
