;redcode-94
;name windmill
;author Calvin Loh
;assert 1

step1   dat     #0,     #4000
step2   dat     #2000,  #6000
bomb1   mov     step1,  *step1
        mov     step1,  @step1
        jmp     scan2
bomb2   mov     step2,  *step2
        mov     step2,  @step2
scan1   cmp     {step1, <step1
        jmp     bomb1
scan2   cmp     {step2, <step2
        jmp     bomb2
        jmp     scan1
        end     scan1
