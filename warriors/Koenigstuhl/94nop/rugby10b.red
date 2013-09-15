;redcode-94b
;name rugby 1.0b
;author John K. Lewis
;strategy 1c bomber
;assert 1

org init

o equ 1
y equ 4
x equ 36
t equ 4
d equ -1501


spl #0,<-10
start   mov >0,*lucky+1
        mov >0,@lucky+1
        djn.f -2,<d
        jmp -3,<d+1

for x
 dat 0,0
rof

init    spl 1
        spl 1

        jmp start


for x
 dat 0,0
rof

lucky dat 0,0

inc     for y
         dat y,inc*1000
        rof
