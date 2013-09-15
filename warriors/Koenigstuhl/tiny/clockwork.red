;redcode-94x
;name Clockwork
;author John Metcalf
;strategy .75c scan
;assert CORESIZE==800

        st equ 13
        fi equ 125

sPtr    dat    fi+st,  fi

        for 5
        dat 0,0
        rof

sBmb    spl    #1,     {1
wipe    mov    sBmb,   <sPtr   
        mov    >sPtr,  >sPtr    ; carpet
        jmn.f  wipe,   >sPtr

reset   mov.ba @a,     @a       ; reset

loop    sub    a,      @a      
        sne.x  *sPtr,  @sPtr    ; scan
a       sub.x  #-2*st, sPtr
        jmz.f  loop,   @sPtr

        slt    sPtr,   #last+3-sPtr
        djn    wipe,   @a
        djn    reset,  #13
last    jmp    reset,  {wipe
     
        end    loop+1

