;redcode-94
;name Storm Shelter 5
;author John K W
;strategy Be number 1000! :-)
;strategy Crush Front, Porch Swing... do ok against certain bombers...
;strategy Note how it gets extra speed, but still monitor's for Front's
;strategy "silent" attack.
;assert 1
org start

for 15
spl #module*3777, #module*3177
rof

        dat     0,      0
watch1: dat     200,     -200

for 30
spl #module*3777, #module*3177
rof

start:
wait1   sne.f   }watch1, <watch1 ; scan both ways for bombs
        jmz.a   wait1,   <watch1
        jmn.f   hwatch,  watch1-1
        jmn.f   hitb,    @watch1
hita:   add.ba  watch1,  module-1
        sub.a   watch1,  module-1
        mov.ab  watch1,  watch1
        jmp     copy,    <watch1 ; reset watch1 to the correct spot
hitb:   
copy    mov     module+1, @watch1
        mov     module+0, <watch1
        spl     @watch1,<watch1
        mov     module-1, <watch1
        sub.ab  #15,    watch1
        mov     1,      @watch1 ;stop front's djn stream
djnk    dat     1,      1
hwatch: mov.ab  #-100,  watch1
        jmp copy

        dat     0,      0
module: mov     3, {-2 ;-2*4*5
        jmp     -1

for 20
spl #module*3777, #module*3177
rof

dat 1,1
