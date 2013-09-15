;redcode
;name Mister Bump
;NSFCWT Round 8
;author Derek Ross
;contact rossd@arbroath.win-uk.net
;strategy Written in '88 code.
;strategy Submitted to NSFCWT Round 8: 8th December 1995
;strategy Quickscan with incendiary bombs ...  
;strategy ... followed by SPL/SPL/DAT coreclear.
;assert CORESIZE > 1000
;assert VERSION >= 80

gap     equ MAXLENGTH
gap1st  equ gap*2
overlap equ gap/2
space   equ 6

pp      equ CORESIZE/(gap*3*qq*rr)
qq      equ 4
rr      equ 3

carpet1 spl 0, space
carpet2 mov carpet1, <carpet1

start
first
p       for pp
q       for qq
r       for rr
        cmp (first+(CORESIZE/2)+gap1st+(gap*(r-1))+((q+(p-1)*qq)*rr*gap)), (first+gap1st+(gap*(r-1))+((q+(p-1)*qq)*rr*gap))
        mov #(first+gap1st+(gap*(r-1))+((q+(p-1)*qq)*rr*gap))-1-found, @found
        rof
        rof
        jmn gotcha, found
        rof

boot    mov check-0, <fini+(CORESIZE/4-gap1st)
        mov check-1, <fini+(CORESIZE/4-gap1st)
        mov check-2, <fini+(CORESIZE/4-gap1st)
        mov check-3, <fini+(CORESIZE/4-gap1st)
        mov check-4, <fini+(CORESIZE/4-gap1st)
        spl @fini+(CORESIZE/4-gap1st)
        mov check-5, <fini+(CORESIZE/4-gap1st)
begin   mov check-6, <fini+(CORESIZE/4-gap1st)
kill    dat <(CORESIZE+1)/3, <(CORESIZE+1)*2/3
        spl 0, begin-check
stun    spl 0, begin-check
loop    mov @bomb, <check
bomb    djn loop, <stun
        dat #1, #1
check   dat #1, <first
fini
gotcha  jmn bombit, @found
        add #(CORESIZE/2), found
bombit  add #overlap, found
bomblp  mov carpet2, @found
        mov carpet1, <found
        sub #space, found
        djn bomblp, #((gap+(overlap*2))/space)+1
found   jmp boot, #found

        end start

