;redcode
;name Fast Food v2.1
;author Brant D. Thomsen
;strategy Uses a CMP method similar to QuickFreeze, except
;strategy  uses fangs (JMP to pit) to bomb with.
;strategy When done, falls through to a "dumb" vampire.
;strategy  2.0 : Uses different Vampire
;strategy        Added boot-straping of vampire
;strategy  2.1 : Different imp-spiral protection
;strategy Submitted: @date@
;assert 1

; EQUs for CMP bomber

comp    equ     (281+39)  ; Comparison distance
cdist   equ     (189+26)  ; Core division
sdist   equ     250       ; Distance from start for first comparison

; EQUs for vampire

step    equ     121
dist    equ     4000
init    equ     step
jsep    equ     7
sep     equ     1
wsep    equ     2
wgate   equ     11


mpit    mov     pit+3, pit+dist+3
        mov     pit+2, <mpit
        mov     pit+1, <mpit
        mov     pit, <mpit

top     cmp     top+sdist, top+sdist+comp
        mov     #-data+top+sdist, data
        cmp     top+sdist+cdist*1, top+sdist+cdist*1+comp
        mov     #-data+top+sdist+cdist*1, data
        cmp     top+sdist+cdist*2, top+sdist+cdist*2+comp
        mov     #-data+top+sdist+cdist*2, data
        cmp     top+sdist+cdist*3, top+sdist+cdist*3+comp
        mov     #-data+top+sdist+cdist*3, data
        cmp     top+sdist+cdist*4, top+sdist+cdist*4+comp
        mov     #-data+top+sdist+cdist*4, data
        cmp     top+sdist+cdist*5, top+sdist+cdist*5+comp
        mov     #-data+top+sdist+cdist*5, data
        cmp     top+sdist+cdist*6, top+sdist+cdist*6+comp
        mov     #-data+top+sdist+cdist*6, data
        cmp     top+sdist+cdist*7, top+sdist+cdist*7+comp
        mov     #-data+top+sdist+cdist*7, data
        cmp     top+sdist+cdist*8, top+sdist+cdist*8+comp
        mov     #-data+top+sdist+cdist*8, data
        cmp     top+sdist+cdist*9, top+sdist+cdist*9+comp
        mov     #-data+top+sdist+cdist*9, data
        cmp     top+sdist+cdist*10, top+sdist+cdist*10+comp
        mov     #-data+top+sdist+cdist*10, data
        cmp     top+sdist+cdist*11, top+sdist+cdist*11+comp
        mov     #-data+top+sdist+cdist*11, data
        cmp     top+sdist+cdist*12, top+sdist+cdist*12+comp
        mov     #-data+top+sdist+cdist*12, data
        cmp     top+sdist+cdist*13, top+sdist+cdist*13+comp
        mov     #-data+top+sdist+cdist*13, data
        cmp     top+sdist+cdist*14, top+sdist+cdist*14+comp
        mov     #-data+top+sdist+cdist*14, data
        cmp     top+sdist+cdist*15, top+sdist+cdist*15+comp
        mov     #-data+top+sdist+cdist*15, data

        jmn     done, data      ; Quit early if found something

        cmp     top+sdist+cdist*16, top+sdist+cdist*16+comp
        mov     #-data+top+sdist+cdist*16, data
        cmp     top+sdist+cdist*17, top+sdist+cdist*17+comp
        mov     #-data+top+sdist+cdist*17, data
        cmp     top+sdist+cdist*18, top+sdist+cdist*18+comp
        mov     #-data+top+sdist+cdist*18, data
        cmp     top+sdist+cdist*19, top+sdist+cdist*19+comp
        mov     #-data+top+sdist+cdist*19, data
        cmp     top+sdist+cdist*20, top+sdist+cdist*20+comp
        mov     #-data+top+sdist+cdist*20, data
        cmp     top+sdist+cdist*21, top+sdist+cdist*21+comp
        mov     #-data+top+sdist+cdist*21, data
        cmp     top+sdist+cdist*22, top+sdist+cdist*22+comp
        mov     #-data+top+sdist+cdist*22, data
        cmp     top+sdist+cdist*23, top+sdist+cdist*23+comp
        mov     #-data+top+sdist+cdist*23, data
        cmp     top+sdist+cdist*24, top+sdist+cdist*24+comp
        mov     #-data+top+sdist+cdist*24, data
        cmp     top+sdist+cdist*25, top+sdist+cdist*25+comp
        mov     #-data+top+sdist+cdist*25, data
        cmp     top+sdist+cdist*26, top+sdist+cdist*26+comp
        mov     #-data+top+sdist+cdist*26, data
        cmp     top+sdist+cdist*27, top+sdist+cdist*27+comp
        mov     #-data+top+sdist+cdist*27, data
        cmp     top+sdist+cdist*28, top+sdist+cdist*28+comp
        mov     #-data+top+sdist+cdist*28, data
        cmp     top+sdist+cdist*29, top+sdist+cdist*29+comp
        mov     #-data+top+sdist+cdist*29, data
        cmp     top+sdist+cdist*30, top+sdist+cdist*30+comp
        mov     #-data+top+sdist+cdist*30, data
        cmp     top+sdist+cdist*31, top+sdist+cdist*31+comp
        mov     #-data+top+sdist+cdist*31, data
        cmp     top+sdist+cdist*32, top+sdist+cdist*32+comp
        mov     #-data+top+sdist+cdist*32, data
        cmp     top+sdist+cdist*33, top+sdist+cdist*33+comp
        mov     #-data+top+sdist+cdist*33, data
        cmp     top+sdist+cdist*34, top+sdist+cdist*34+comp
        mov     #-data+top+sdist+cdist*34, data

        jmz     mvamp, data     ; Start Vampire if found nothing.

        ; Put a fang in the A location of the successful scan

done    sub     data, fjump
data    mov     fjump, 0

        ; Put a fang in the B location of the successful scan

        add     #comp, data
        sub     #comp, fjump
        mov     fjump, @data

        ; Top the vampire.
        ; Pit has already been moved

mvamp   mov     vamp+3, pit+dist+vamp-pit-sep+3
        mov     vamp+2, <-1
        mov     vamp+1, <-2
        mov     vamp, <-3

        mov     jump, pit+dist+vamp-pit-sep-1-jsep

mwimp   mov     wimp, pit+dist+vamp-pit-sep-1-wsep

        spl     @mvamp          ; Start the vampire.
        jmp     @mwimp          ; Start wimp

        ; Jump used by the CMP scanner.

fjump   jmp     @-data, #pit+dist-data+1

        ; Wimp is necessary so will still have a process when pit dies.

wimp    jmp     0, <wimp-wgate

jump    jmp     pit-vamp+sep-init, vamp+jsep+init

vamp    spl     0, <vamp-1-wsep-wgate
        mov     @0, @jump-jsep
        sub     pit+sep, @-1
        djn     -2, @jump-jsep

pit     mov     @step, <0-step
        spl     0, <vamp-1-wsep-wgate-sep
        spl     -1, <vamp-1-wsep-wgate-sep
        spl     -2, <vamp-1-wsep-wgate-sep

        end     mpit
