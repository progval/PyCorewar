;redcode-94
;name Fscan
;author Jay Han
;assert CORESIZE==8000 && MAXLENGTH==100

                org     entry

j               equ     6
n               equ     38
s               equ     (((CORESIZE-(2*MINDISTANCE)-MAXLENGTH)*2)/((2*n)+1))
q               equ     (s/2)
h               equ     (q/2)
a               equ     (head-MINDISTANCE)
l               equ     (q+MAXLENGTH)
k               equ     (l/j+1)

dat0            equ     head-1
head
entry
scan            sne.i   *fscan,         @fscan
                djn.f   scan,           scan
                jmz.a   boot,           @scan
                add.f   scan,           test
test            add.b   scan,           #scan
                sne.i   dat0,           @test
                sub.ab  #q,             test
                add.b   test,           bite
                mov.i   vamp,           >bite
                mov.i   mega,           >bite
                add.b   bite,           ptr
stun            mov.i   bite,           @bite
                add.f   vamp,           bite
                djn.b   stun,           #k

copy            mov.i   >ptrcclear,     <ptr
                djn.b   copy,           #4
ptrcclear       jmp.b   @ptr,           bomb

mega            mov.i   -1,             <-1

adder           add.a   #step,          jumper
bomb            dat.f   <-1,            j+3
                djn.f   -1,             -j-2
                mov.i   2,              >-j
vamp            spl.b   #j,             <-j

bite            jmp.b   -2,             #test+q

scantab         dat.f   0,              scan
m for n
                dat.f   a-(m*s),        a-(m*s)+q
rof
fscan           equ     scantab+n-1

p2              equ     -73+(972*s2)
s2              equ     -74
p1              equ     75+(972*s1)
s1              equ     74

cast            mov.i   <p1,            p2
stone           spl.b   cast,           <cast-4
                add.f   inc,            cast
                djn.f   stone,          <cast-6
inc             dat.f   s1,             s2

boot            mov.i   <ptr1,          {ptr2
                djn.b   boot,           #5
ptr2            spl.b   head+4000

step            equ     2667
launch
imp             mov.i   0,              step
ptr             spl     1,              bite+j+5
ptr1            spl     1,              inc+1
                mov.i   -1,             #0
                spl     adder
jumper          jmp     imp+step

for 23
                dat.f   0,              0
rof

                end
