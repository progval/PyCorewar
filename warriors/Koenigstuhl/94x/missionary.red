;redcode-94x
;name The Missionary
;author Jay Han
;strategy Vampire
;assert CORESIZE==55440

start   equ     -550
step    equ     -545
n       equ     11087
gate    equ     inc-1

        org     bite

inc     dat     step            ,-step
fang    jmp     pit+start       ,-start
loop    add.f   inc             ,fang
bite    mov.i   fang            ,@fang
        djn.b   loop            ,#n
head    spl     0               ,<gate-tail-bomb
kill    mov.i   bomb            ,<pit
bomb    dat.f   <gate-tail      ,<gate-tail
pit     spl     0               ,inc
        mov.i   tail            ,<tail
tail    jmp     pit             ,gate

        end

