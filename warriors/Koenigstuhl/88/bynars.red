;redcode verbose
;name Bynars
;author Pierre Baillargeon
;strategy   v1.0:   Binary bombing (64,32,16,8,4,2,1)
;assert 1

top     sub @ns,    axis        ; change axis changer
axis    sub #32,    kill        ; change pointer axis
inc     sub #64,    kill        ; new position
kill    mov ns,     -1          ; kill other
count   djn inc,    #124        ; number of step
        sub #64,    kill        ; get zero
        add nc,     count       ; reset step count
        add nc,     nc          ; change next step count
        sub @ns,    inc         ; change step size
        djn top,    ns          ; change next step size
        dat #1,     #0
        dat #2,     #0
        dat #4,     #0
        dat #8,     #0
        dat #16,    #0
        dat #32,    #0
nc      dat #0,     #248        ; next count down
ns      dat #0,     #-2         ; next step

        end inc
