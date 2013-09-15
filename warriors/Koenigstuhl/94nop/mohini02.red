;redcode-b test
;name Mohini v0.2
;author Ayan Chakrabarti
;strategy Scan + Vamp -> Clear
;strategy Captured processes stunned.
;strategy Fixed a couple of bugs. Does well against papers but
;strategy gets thrashed by scanners and some stones.
;assert CORESIZE == 8000

init    equ kill+100
inscan  equ kill+step
step    equ 3039
trap    equ (ttrap - 100)

;--- The trap which doubles up as scanning pointer (booted away)

ttrap   jmp    pit-init,inscan-trap

;--- Scan

kill     mov.i  trap,>ptr
          add.f  stinc,trap
check    jmz.f  kill,@trap
          slt    #tend-trap,trap
          jmp    kill
          mov.b  trap,ptr
          sub.ab #ptr-trap,ptr
          mov.a  #pit-trap,trap
          sub.ba trap,trap
          jmp kill

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

;--- The pointer at which traps are being dropped. Also used to switch
;    from scan to clear

ptr      jmp    done-check,init

;--- Boot the trap away

boot     mov    ttrap,trap
          jmp    check

;------
for 8
dat 0
rof
;------

;--- The pit

pit      mov    ptr,check               ; Process captured. Switch to clear.

          for 9
          spl     #0,<trap+1
          rof

          jmp    -9,<trap+1
;--- The end :)
tend

end boot

-----------------
Ayan Chakrabarti
" I think I think, therefore I think I am. "


