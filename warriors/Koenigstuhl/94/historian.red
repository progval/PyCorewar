;redcode-94 verbose
;name the historian
;author bjoern guenzel
;strategy p-space l3 s9 inv
;strategy switch stone with stone/spiral
;release 25.5.96
;assert CORESIZE==8000

;constants for self justice
jstep           equ 3315
jcptr           equ (jsplit-3)
jshift          equ stshift     ;boot distance

;constants for blue x-torch
stshift         equ (-2222)     ;boot distance
gate            equ hit+5001
clptr           equ (steps-3)
sign            equ (-1)        
step4           equ (3364)      
step            equ (sign*step4)
magic           equ (1000)

;constants for spiral launch
istep           equ 2667
spshift         equ (ptr+stshift+imagic) ;magic boot distance
imagic          equ (4875-1451+11+14)

;constants for brain
samplesize      equ 9           ;switch every 9 rounds
critical        equ 3           ;if losses > critical
p_track         equ (321-7)     ;loss + rounds count
p_strategy      equ (456-7)     ;active strategy
p_init          equ 0           ;don't know what is better 
p_factor        equ 20          ;against brainwashing?

; ********* brain *********

;table for track update

                dat p_init+samplesize*p_factor+critical+2,0      ;first round
p_table         dat p_factor+1,0 ;loss -> add one to loss count
                dat p_factor+0,0         ;tie  -> only update round count
                dat p_factor+0,0         ;win  -> only update round count

p_ptr           dat #p_strategy,#p_track        ;p-space pointers

;make new decision

p_switch        sub.ab #p_init+(samplesize)*p_factor,p_set ;make readable
                slt.ab #(critical+1),p_set ;if more than 3 losses, switch
                jmp p_stay,>3000        ;don't change strategy
                
                seq.ab #0,p_decide      ;change strategy
                mov.a #0,p_new          ;!0 = strategy 1
p_new           stp.a #1,p_ptr          ;0 = strategy 2

                ldp.ab p_ptr,p_decide   ;reload strategy
p_stay          stp.ab #p_init+1,p_ptr          ;reset track
                jmp p_erase,>2000                       

;start here

start           ldp.ab #0,p_table       ;load results of previous fight
p_set           ldp.b p_ptr,#0          ;load track
                add.ab @p_table,p_set ;update track
p_decide        ldp.ab p_ptr,#0         ;load strategy

                slt.b p_set,#p_init+(samplesize)*p_factor ;if 9 rounds, new decision
                jmp p_switch,>1000      

                stp.b p_set,p_ptr

p_erase         mov.i #0,p_ptr          ;erase p-ptrs

                jmz.b strategy2,p_decide
                
;boot strategy 1: self justice (anti-clear stone)
                
                mov.f #0,bsource        ;init boot pointer
                mov.a #booptr+stshift-30+jstep,booptr

                mov.i jsplit,*booptr     ;crucial spl           
                mov.i {bsource,<booptr
stlaunch z for 8                        ;jump here to boot blue torch
                mov.i {bsource,<booptr
rof             
                spl @booptr
                mov.i #0,booptr
                dat >2001,>3002

;boot strategy 2: blue candle (0.75c stone + spiral)

strategy2       spl stlaunch,>2001      ;start here
for 8
                mov.i <bsource,{booptr
rof
                spl @booptr,>4003       ;put a second processes into stone!
booptr          jmp spshift,stshift     ;start spiral
                

; ************* blue torch ************
        
steps           spl #2*step,>-step      ;doubles as bomb
loop            add.x steps,ptr         
ptr             mov.i >ptr+magic*step,@hit+step
                mov.i steps,@ptr
hit             djn.f loop, <gate       ;bombed with spl 
                mov.i bomb,>clptr
                djn.f -1,{clptr
bomb            dat #-1,<bomb-clptr+2   ;bomb for clear

; ************ binspiral *************

                spl #-1000,>2000        ;bombed after 15 process
                spl 4,>-1               ;spiral has been created
                spl 2,}j3
j1              jmp imp-1,}0
j2              jmp imp+istep-1,}0
                nop }j1,}j2
j3              jmp imp+2*istep-1,}0
imp             mov.i #istep,istep

; ********* self justice *********
; 0.5c bomber with anti-clear bombs (inspired by Beppe Bezzi)
; spl must be booted to jhit+jstep

jsplit          spl #0,>2660
jptr            mov.i jbomb,*jhit+3*jstep
                mov.i jbomb,@jptr
jhit            add.ab #2*jstep,jptr
                djn.f jptr,<-5000
                mov.i jcb,>jcptr
                djn.f -1,{jcptr
jcb             dat #-1,<jcb-jcptr+20
jbomb           mov.i jstep,1

bsource         dat bomb+1,imp+1        ;bootptr, default boot blue candle
        
for MAXLENGTH-CURLINE
                dat 0,0
rof

                end start

