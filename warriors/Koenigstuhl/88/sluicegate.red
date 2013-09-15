;redcode
;name SLUICEGATE
;author Jon Blow
;assert 1

hit:    dat #0
pad:    dat #0
stomp:  jmp stomp, <hit
flood:  mov imp, @target
        add #12, target
        slt #-20, target
        jmp flood
        add #22, target
        djn flood, sweeps
        jmp imp
target: dat #20
start:  spl stomp
        jmp flood
sweeps: dat #5
imp:    mov 0, 1

        end start
