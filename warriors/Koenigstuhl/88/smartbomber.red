;redcode verbose
;name Smartbomber
;author Gil Richard
;assert 1
;strategy Does all kinds of stuff...  
;strategy 1) Initiates a CMP scanner which chucks DAT #0's onto anything,
;strategy    that isn't a DAT 0 in increments of 5 spaces,
;strategy 2) And starts dropping bombthrowing routines which throw DAT #0 
;strategy    bombs to areas of memory above it and SPL 0/JMP -1 bombs 
;strategy    to areas below it at increments of 5 spaces.
;strategy 3) All routines are surrounded with a DAT #1234 identifier which,
;strategy    when an offensive routine encounters it, skips ahead the length
;strategy    of the biggest routine, thereby reducing the amount of routine
;strategy    fratricide to 0(hopefully...)
;strategy Here's hoping it doesn't do too much :)
        dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
start   spl     gates
        spl     scan
copyme  mov     ID, @target
        sub     #1, target
        djn     copyme, #5
        mov     #5, -1
copybom mov     @ptr, @target
        sub     #1, target
        djn     copybom, ptr
copyme2 mov     ID, @target
        sub     #1, target
        djn     copyme2, #5
        mov     #5, -1
        add     #11, target
        spl     @target
        add     #750, target
        mov     #18, ptr
        djn     copyme, #12
gates   mov     3, -24
        mov     2, 39
        jmp     gates
target  dat     #1000, #1000
ptr     dat     #18
rangepos        dat     #23
rangeneg        dat     #-7
shrapnel1a      spl     0
shrapnel1b      jmp     -1
shrapnel2       dat     #0
bomb    cmp     @rangepos, -6
        jmp     nukepos
        add     #59, rangepos
nukepos mov     shrapnel1a, @rangepos
        add     #1, rangepos
        mov     shrapnel1b, @rangepos
lookneg cmp     @rangeneg, 7
        jmp     nukeneg
        sub     #63, rangeneg
nukeneg mov     shrapnel2, @rangeneg
        add     #5, rangepos
        sub     #5, rangeneg
        jmp     bomb
proto   dat     #17
scanlen dat     #21
scan    cmp     @proto, @scanlen
        jmp     checkid
next    add     #5, scanlen
        jmp     scan
checkid cmp     ID, @scanlen
        jmp     nukeit
        add     #63, scanlen
        jmp     scan 
nukeit  mov     @proto, @scanlen
        jmp     next
ID      dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
        dat     #1234, #1234
        end     start
