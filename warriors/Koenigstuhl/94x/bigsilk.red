;redcode-94x
;name Big Silk Warrior 1.0
;author J.Pohjalainen
;strategy v1.0: trying paper on big hill
;assert CORESIZE==55440
;macro

STEP    equ     16120

warrior
        spl     1,          <-198
        mov     -1,         0
        spl     1,          <-199

paper   spl     @paper,     >STEP
        mov.i   }paper,     >paper
        mov.i   gate,       }27720
        mov.i   gate,       >27720
        mov.i   gate,       >paper
silk    jmp     @silk,      {paper
gate    dat.f   <34117,     <35873

end warrior

