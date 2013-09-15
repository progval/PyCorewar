;redcode-nano
;name Iceblade
;author Metcalf/Wainwright
;strategy faster than C clear
;assert CORESIZE==80

gate:   spl   #10,   >62
loop:   mov   }gate, }gate
        mov   bomb,  }gate
        djn.f loop,  }gate
bomb:   dat   5,     {1         ; previously dat 5, }3
end

