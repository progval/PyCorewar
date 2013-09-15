;redcode
;name Zippo Lighter
;author Franz
;strategy 50%c stone
;assert CORESIZE==8000

step equ 155

sp      spl 0,#step
stone   mov mv,@jump+(step*2)
clrs    mov sp,@stone
        add #step*2,stone
jump    jmp stone,<jump-20
mv      mov -step,<-step 
        djn -1,<-4001

        end sp





