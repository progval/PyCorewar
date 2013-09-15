;redcode-94
;name myConfuser
;author Paulsson
;strategy Confuse pspace warriors by being good against all
;strategy types of wariors (except evolv cap type)
;strategy The first myConfuser used a qscan that only got a hit
;strategy 1/3 of the times and used this as a random factor to 
;strategy change between different strategies.
;strategy Now it's a bit of clison type killer + something else.
;strategy Submitted: March 96
;assert CORESIZE > 1

org             start+1
st              equ     17              ;step size
dir             equ     (-1)            ;direction of scan -1 <->
                                        ;backwards

decoy           dat     #dir*150,#dir*150
step            spl     #dir*st*2,dir*st*2

start           add.f   step,ptr                ;scan 80%
                sne.i   *ptr,@ptr
                add.f   step,ptr
ptr             sne.i   mitten+150*dir+dir*st,mitten+150*dir+dir*2*st
nr              djn.b   start,#(8000-500)/st/4  ;might be changed to 
                                                ;jmz.f start,<ptr !
                jmz.f   2,*ptr          ;a or b field hit
                mov.x   ptr,ptr
                jmz.f   killer,<ptr     ;is it a bomb?
                add.f   step,ptr        ;check if it is a decoy
                jmz.f   clear,@ptr      ;no, start cc
                add.f   decoy,ptr       ;yes continue scan
                jmp     start
for 10
                dat.f   0,0
rof
clear           add.ab  #(ptr-cptr-(2+dir*2)*st)-75,ptr ; This is a bit strange
                mov.b   ptr,cptr
                jmp     clear2                  ;start coreclear
for 10
                dat.f   0,0
rof
cptr            dat     0,100
bmb3            dat     #-20,20
bmb2            dat     #-20,20
bmb1
clear2          spl     #-20,20         ; coreclear
                mov.i   @bptr,>cptr
                mov.i   @bptr,>cptr
bptr            djn.b   -2,{bmb1
for 20
                dat.f   0,0     
rof
mitten
killer          jmz.b   clear,nr        ;place killer over bomb
                mov.i   >bootptr,>ptr
                djn.b   -1,#4
                sub.ab  #4,ptr
bootptr         jmp     @ptr,kill

kstep           equ     1028

kill            spl     #kstep,-kstep   ;cannonade style stone
                add.f   -1,1
                mov.i   >0,-2
                djn.f   -2,<-100

                end

