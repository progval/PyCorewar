;redcode
;name Mohini v0.1
;author Ayan Chakrabarti
;strategy Scan + Vamp -> Clear
;strategy Captured processes stunned.
;assert CORESIZE == 8000
;Wilkies Points = 122.92

init    equ kill+100
inscan  equ kill+2*step
step    equ 1226

;--- Scan

kill     mov.i  trap,>ptr
          add.f  stinc,trap
check    jmz.f  kill,@trap
          mov.b  trap,ptr
          sub.ab #1,ptr
          mov.a  #pit-trap,trap
          sub.ba trap,trap
          jmp kill,<-400

stinc    dat    #-1,#step

;------
for     3
         dat     0
rof
;------

;--- Clear (something captured)

ptr2            dat     0,pit-ptr2
                 dat     0,pit-ptr2
                 dat     -10,pit-ptr2
                 dat     -10,pit-ptr2

done            spl     #4000,pit-ptr2
                 mov.i   @2,>ptr2
                 mov.i   @1,>ptr2
                 djn.b   -2,{done

                 dat     0,0
                 dat     0,0


;--- The trap which doubles up as scanning pointer.

trap     jmp    pit-init,inscan

;--- The pointer at which traps are being dropped. Also used to switch
;    from scan to clear

ptr      jmp    done-check,init

;------
for 9
dat 0
rof
;------

;--- The pit

pit      mov    ptr,check               ; Process captured. Switch to clear.

i        for 9
          spl     #0
          rof
          jmp    -9
;--- The end :)

end check

