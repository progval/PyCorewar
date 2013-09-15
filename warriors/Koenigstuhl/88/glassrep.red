;redcode
;name   glass replicant
;strategy replicate, fail to shoot self or copies, and recurse.
;author Pi Qan
;assert 1

start   spl     repl-3, #0
        mov     data6,  data5
stuff   mov     data2,  @data5
        jmp     2,      #0
        dat     #0,     #0
        sub     #54,    data5
        djn     stuff,  data5
        mov     data4,  data2
        jmp     2,      #0
        dat     #0,     #0
repl    mov     data3,  data1
        mov     @data1, <data2
        sub     #1,     data1
        jmp     2,      #0
        dat     #0,     #0
        cmp     #-23,   data1
        jmp     repl+1, #0
        spl     @data2, #0
        jmp     2,      #0
        dat     #0,     #0
special sub     #1870,  data2
        jmp     repl,   #0
data1   dat     #0,     #0
data2   dat     #0,     #0
        dat     #0,     #0
data3   dat     #0,     #last+3
data4   dat     #0,     #-2998
data5   dat     #0,     #0
data6   dat     #0,     #start
last    dat     #0,     #0
