;redcode
;name PacMan v3
;author David Moore
;strategy Bombard them with SPL 0s and DATs,
;strategy then clear the core and try to trap imp spirals.
;assert CORESIZE == 8000

bootp   equ 7711
bootg   equ 7811
bootw   equ   10
bootb   equ   30
ival    equ 1445
dec3    equ 7000
gate    equ   -6
half    equ  -15
timer   equ   50

tbomb   dat    <2667,   <5334
trap    spl     tptr, (locg+bootg-2)
        mov    tbomb,   <trap
tptr    jmp     trap,       0

start   mov  power+4,   <locp
        mov  power+3,   <locp
        mov  power+2,   <locp
        mov  power+1,   <locp
        mov  power+0,   <locp
        mov gobble+2,   <locg
        mov gobble+1,   <locg
        mov gobble+0,   <locg
bptr    mov     bite, (locg+bootg+bootb)
wptr    mov   safety, (locg+bootg+bootw+2)
        mov   safety,   <wptr
        mov     wait,   <wptr
        mov    tjump, (locg+bootg+bootw+gate+1)
        mov    <bptr,    wptr
locp    spl    @locp, bootp+5
locg    spl    @locg, bootg+3
        dat    <locp,   <locg
tjump   jmz (-gate-1-bootw-bootg-locg+trap), (-gate-1-bootw-bootg-locg+tptr)

gobble  mov          bootb, <(bootw+2)
        jmp         gobble, <half
        jmp (gobble+bootw), 0

bite    dat   <2668, #(-bootw-2)

wait    jmp       0,       <gate
safety  jmp (-2-bootw-bootg-locg+trap+1), #(-bootw-1-timer)

power   spl       0,   #(ival+1)
pill    mov   <dec3, <(power+(ival*2))
        mov   power,       @pill
        add    incr,        pill
incr    djn    pill,   <(ival*2)

add # 1, 1
add # 2, 1
add # 3, 1
add # 4, 1
add # 5, 1
add # 6, 1
add # 7, 1
add # 8, 1
add # 9, 1
add #10, 1
add #11, 1
add #12, 1
add #13, 1
add #14, 1
add #15, 1
add #16, 1
add #17, 1
add #18, 1
add #19, 1
add #20, 1
add #21, 1
add #22, 1
add #23, 1
add #24, 1
add #25, 1
add #26, 1
add #27, 1
add #28, 1
add #29, 1
add #30, 1
add #31, 1
add #32, 1
add #33, 1
add #34, 1
add #35, 1
add #36, 1
add #37, 1
add #38, 1
add #39, 1
add #40, 1
add #41, 1
add #42, 1
add #43, 1
add #44, 1
add #45, 1
add #46, 1
add #47, 1
add #48, 1
add #49, 1
add #50, 1
add #51, 1
add #52, 1
add #53, 1
add #54, 1
add #55, 1
add #56, 1
add #57, 1
add #58, 1
add #59, 1
add #60, 1
add #61, 1
add #62, 1
add #63, 1
add #64, 1
add #65, 1
add #66, 1
add #67, 1

end start
