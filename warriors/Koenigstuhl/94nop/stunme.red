;redcode
;name stun me!
;author Berzerker
;<berzerker@ircfightclub.com>
;strat pre-test version 2
;assert 1

glock  mov.i   stun2, <1000
       djn     glock, #400

start   mov.i   stun2, <-400
        djn     start, #400
        

stunt   mov.i   stun, 2000

stump   spl     1999

        add.ab   #100, stunt
        add.a   #100, stump        

        djn.b     stunt,#36
        jmp     lock
stun    jmp     0
stun2   dat     0,0

lock   cmp.b key, #0
key    mov.i  stun2, 6000
       add.ab   #100, key
       djn lock, #200
       jmp impt
kep    add.ab   #100, key
      jmp lock



impt   mov imp, 1000
        spl 999
        add.ab #2000, impt
        add.a  #2000, -2
        djn impt, #3
        jmp glokk
glokk   mov.i   stun3, @1
        djn     glokk, #15
        jmp start
stun3   dat #0,#0
imp     mov 0,1

