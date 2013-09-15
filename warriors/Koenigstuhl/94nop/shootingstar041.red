;redcode
;name Shooting Star v0.41
;author brx
;strategy i guess it is a boring, conventional oneshot :)
;assert CORESIZE==8000

; thanks to mizcu, fizmo, metcalf, mr lambada (sry ;)) and
; all the others for helping me out with this warrior!

scd	    equ 11
sstep	    equ 22
sstart	    equ 27

gate	    equ 1200

len	    equ 15
bootdist    equ 1185

    org boot

bp	dat #dp, #bootdist
boot	mov }bp, >bp

    for len-1
	mov }bp, >bp
    rof

	jmp bp+bootdist+(comp-dp)

dp      dat #sstep, #sstep

ptr	dat #sb1-ptr, 0
sb2	spl #db1-ptr, #wend-ptr+5
db1	dat #db1-ptr, #wend-ptr

	dat 0, 0

scan    add.f dp, comp
comp    sne sstart, sstart+scd
	add.f dp, comp
	sne *comp, @comp
        djn.f scan, *comp

        mov.ab comp, ptr

sb1     spl #sb2-ptr, #wend-ptr+5
ssd     mov *ptr, >ptr
        mov *ptr, >ptr
        djn.f -2, <-gate+ptr

wend	dat 0, 0

for (MAXLENGTH-CURLINE)/7
    spl #55, 12
    spl -1, #71
    mov -1, {-1
    dat 6, #578
    dat #911, 662
    dat 61, #11
    dat #679, #21
rof

