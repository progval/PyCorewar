;redcode-94/lp
;name Nose-Picker
;author Ryan Coleman
;strategy figure out which environment i'm in (94/lp)
;strategy w/o maxprocesses or p-space
;strategy picker-->limb rending incisors (lp)/minihsa(94)
;strategy i stole the warriors, but the boot code i wrote
;assert CORESIZE==8000

;thanks for running the tourney, it gave me a distraction from my
;paper this semester.. hopefully my redcoding has improved from it.

org lost

lost spl 1,<4000 ;small decoy made
mov -1,0
mov -2,0
mov -3,0 ;split 9 processes if 94, 8 if lp

nop 0, >check    ; change b-field of check
mod.f #1,#1     ;let one thru
check  seq #8, #0 ;b-field will contain 8 if lp, 9 if 94
jmp.a boot, <4000
jmp.a start, <4000

ninetyfourcode jmp.a $0, $0
step    equ     15
stfang  equ     (stcode-7981+step*3)
sboot   equ     (main+2541)



mst     equ     9
ptr     equ     (bomb-5)

away    equ     -6666

bomb    spl    #1,{1
kill    mov    bomb,<ptr
mptr    mov    >ptr,>ptr
        jmn.f  kill,>ptr
a       add    #mst+1,@mptr
scan    jmz.f  a,<ptr
        slt    @mptr,#btm-ptr+3
        djn    kill,@mptr
        djn    a,#16
btm     jmp    a,{kill
hp      dat.f   0,      -1

boot    mov    btm,@dest
for 4
        mov     <hp,<dest
rof
        djn.b   -4,     #2
        spl    @dest,1
dest    mov    #250,@away
        mov    bomb,<dest
        div.f  #0,dest



; --The Sneak--
; This is backwards clear which will be booted away
main    dat     0, 0
sneak   mov     bomb2, <bclear
        jmp     -1, <bclear
        dat     0,0
        dat     0,0
        dat     0,0
bomb2    dat     0, -11
bclear  dat     0, -31


; Begin here
; |
; v
start
; Note the cheese boot.  I didn't use a boot ptr but I'm not too worried
; about it and I also copied some useless dats.  I always release warriors
; with bugs and irrelevancies but can't be bothered to fix 'em.
        mov     sneak+0, sboot+0
        mov     sneak+1, sboot+1
        mov     sneak+2, sboot+2
        mov     sneak+3, sboot+3
        mov     sneak+4, sboot+4
        mov     sneak+5, sboot+5
        mov     sneak+6, sboot+6
; 1 process to the sneak
        spl     sboot

; 5 processes to the vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp

; 1 process to the forward clear
        jmp     myclear


        for     15
        dat     0, 0
        rof


; ---PIT---
pit     spl     1, pclear
        mov     dbomb, >pclear
hit1    jmp     pit, pclear
; ---------


        dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 0

hit2    dat     0, 0
        dat     0, 0
        dat     0, 0
pclear  dat     0, 50
        dat     0, 0

hit3    dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 0
jbomb   jmp     #0, #0

hit4    dat     0, 0


; --Bomber--
stcode
inc     spl     #-step, step
        dat     0,0
vamp    add     inc, fang
pfang   mov     fang, @fang     ; drop fang
        mov     jbomb, *fang    ; drop jmp bomb
        jmp     vamp, @pfang    ; My memory's hazy about this line
                                ; a jmp vamp, 0 should work exactly the same
        dat     0, 0
; --Clear--
; works with the same ptr as the pit for a fast clear (max 200% c with enemy)
myclear mov     dbomb, >pclear
        jmp     myclear, pclear

hit5    dat     0,0
dbomb   dat     0, 50
        dat     0, 0
        dat     0, 0
fang    jmp     pit-stfang, stfang

end
