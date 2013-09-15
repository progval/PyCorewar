;redcode-94
;name Two Pack
;author John K W
;strategy boot, stone, imp, clear
;strategy Well, this is an interesting little guy.
;strategy Notice these lines:
;strategy        spl     2
;strategy        jmp     @vector,{0
;strategy        jmp     *vector,{0
;strategy They allow the imps to excecute in parallel, which
;strategy seems significantly more durable than Kline's prototype,
;strategy even though it's been taken down to a two-point spiral.
;strategy I haven't even submitted this thing to the Hill yet, but I guess
;strategy I will do that right now, just to see what happens... :-)
;assert 1

org bstone

ptr     equ 2000

gate2   dat <-445, <-446
s       spl #445, <-445
        spl #0, <-446
        mov {445-1, -445+2
        add -3, -1
        djn.f -2, <-2667-500
        mov 33, <-20
go      dat #0, #ptr
bstone  mov {go, <go
        mov {go, <go
        mov {go, <go
        mov {go, <go
        mov {go, <go
        mov {go, <go
        mov gate2, ptr+24
        mov gate2, ptr+24
        spl @go, <-4000

imp_sz  equ     4001
imp2    equ     imp+4000

boot    mov     imp,    imp2
        spl     1,      #0
        spl     1,      #0
        spl     1,      #0
        spl     1,      #0
        spl     2
        jmp     @vector,{0
        jmp     *vector,{0

        jmp     imp2+imp_sz*15, imp+imp_sz*15
        jmp     imp2+imp_sz*14, imp+imp_sz*14
        jmp     imp2+imp_sz*13, imp+imp_sz*13
        jmp     imp2+imp_sz*12, imp+imp_sz*12
        jmp     imp2+imp_sz*11, imp+imp_sz*11
        jmp     imp2+imp_sz*10, imp+imp_sz*10
        jmp     imp2+imp_sz*9,  imp+imp_sz*9
        jmp     imp2+imp_sz*8,  imp+imp_sz*8
        jmp     imp2+imp_sz*7,  imp+imp_sz*7
        jmp     imp2+imp_sz*6,  imp+imp_sz*6
        jmp     imp2+imp_sz*5,  imp+imp_sz*5
        jmp     imp2+imp_sz*4,  imp+imp_sz*4
        jmp     imp2+imp_sz*3,  imp+imp_sz*3
        jmp     imp2+imp_sz*2,  imp+imp_sz*2
        jmp     imp2+imp_sz*1,  imp+imp_sz*1
vector  jmp     imp2,           imp
imp     mov.i   #imp_sz, *0
