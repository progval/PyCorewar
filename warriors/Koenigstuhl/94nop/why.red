;redcode-b quiet
;name why
;author bjoern guenzel
;strategy I don't know what kind of bombs my scanner should throw????
;strategy I decided for spl mov xxx xxx xxx jmp
;strategy 0.8c sne scan mod 10, dist 5,djn+inc
;P-class scan,clear
;assert CORESIZE==8000
;release 3.4.96


shift           equ 4000
dist            equ 5
step            equ 2930                        ;mod 10
gate            equ clptr-2*2667
                org first+1
                
clptr           dat -1,bptr+1
                dat 0,0                 ;x
                dat 0,0                 ;x
                dat 0,0                 ;jmp

first           add.f steps,@addptr              
                sne *ptr,@ptr
                add.f steps,@addptr
ptr             sne.i }jptr+step,}jptr+step+dist         
jptr            djn.f first,<gate                       ;hit by spl
                mov.i jmbomb,@ptr               ;hit by mov
addptr          mov.i sbomb,}ptr
                mov.i mvbomb,*ptr
                jmp *jptr,{ptr                  ;could be jmpbomb, but then more vulnerable
                                                ;to }bombing :-(
                dat 0,0                         ;hit by jmp
                dat 0,0                         ;x12
                dat 0,0                         ;x12
b2              dat #b2-bptr,#bptr-clptr
b1              spl #b2-bptr,#bptr-clptr
                dat 0,0                         ;spl
steps           spl #step,>step                 ;
                mov *bptr,>clptr
                djn.f -1,{clptr         
                dat 0,0
                dat 0,0                         ;jmp
bptr            dat #b1,}1                      ;
                dat 0,0                         ;x12
                dat 0,0                         ;x12
                dat 0,0                         ;x12    

                dat 0,0                         ;spl
sbomb           spl #steps-jptr,#2              ;acts as switch to clear, keep
separate                
                dat 0,0                         ;because vulneraple spot
mvbomb  mov -1,>-1                              ;                       
jmbomb          jmp -dist,{1                    


                end 
