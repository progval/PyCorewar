;redcode verbose
;name Tiny v1.2
;author J.Cisek
;strategy creation date 4/19/92
;strategy very small spl 0 bomber/clearer with decoys
;strategy  v1.1 4/20/92 better location
;strategy  v1.2 4/21/92 bombs with spl -1
;assert 1
start   mov trap, 3000
        mov slow-1, 3119
        mov slow, 3119
        mov slow+1, 3119
        spl 3117, #42
        mov clear, 3055
        mov clear+1, 3055
        dat #42

trap    spl -1, #42

clear   mov -2, <-2
        jmp clear, #0

        jmp -60, #0
slow    mov -121, <-122		; gets hit here with a SPL -1
        jmp slow, <-123

        dat #42
;Here's where your decoys go.  Go crazy!

        end start

