;redcode-94
;name tvamp
;author John K W
;assert 1
;       VERSION == 80
;strategy true 57%c vampire.  no scanning.
;useful against: nothing I can think of.

S equ 3510
org loop

        dat     30,     30
pit     spl     0
        mov     -2,     >-4
p       jmp     -1,     30
incr    dat     -S*4,   S*4
incr2   dat     S*4,    S*4
stepfang jmp    -S,     S
fang    jmp     pit,    0
loop    add.f   incr,   fang
        mov     fang,   @fang
        add.f   incr2,   stepptr
        mov     stepfang, *stepptr
        mov     stepfang, @stepptr
stepptr mov     fang+S, @fang+S*2
        djn     loop,   #0
        mov     pit-1,  >p
        jmp     -1

        end
