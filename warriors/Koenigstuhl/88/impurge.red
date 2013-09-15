;redcode
;name Impurge
;author Fredrik Ohrstrom
;assert 1

bomber  mov #26, counter
        add #26, comper
boom    mov bomb, <comper
counter djn boom, #26
adder   sub incr, @boom
comper  cmp 16, 0
        djn bomber, <stopper
stopper djn adder, #245
        spl 0, <-31
        mov 2, <-29
bomb    spl -1, <-31
incr    dat <-32, <-32


        end adder
