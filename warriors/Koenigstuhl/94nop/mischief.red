;redcode-94nop
;name Mischief
;author John Metcalf
;strategy .75c scan -> clear
;assert CORESIZE==8000

        st equ 13
        fi equ 1961
        sWipe equ (sPtr-1)
        gate  equ (attack-2)

sPtr    dat    fi+st,  fi

        for 5
        dat 0,0
        rof

attack  mov    sPtr,   sWipe
wipe    mov    sBmb,   <sWipe
        mov    >sWipe, >sWipe   ; carpet
        jmn.f  wipe,   >sWipe

reset   mov.ba @a,     @a       ; reset

loop    sub    a,      @a
        sne.x  *sPtr,  @sPtr    ; scan
a       sub.x  #-2*st, sPtr
        jmz.f  loop,   @sPtr

        slt    sPtr,   #dBmb+3-sPtr
        jmp    attack
        djn    reset,  #16

sBmb    spl    #0,     {0
clear   mov    dBmb,   >gate
        djn.f  clear,  {gate

dBmb    dat    >1,     2-gate

        end    loop+1

