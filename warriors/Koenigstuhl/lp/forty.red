;redcode
;name Forty
;author Anton Marsden
;strategy The Machine/Blur '88/Oldtimer++/Die Hard
;assert 1

FOR (MAXCYCLES==80000)&&(MAXPROCESSES==8000) ; '94 extended

  ;The Machine

  ;Length: 12
  
  step EQU 70; mod-10
  gate EQU top

  ptr:  mov.i  inc+1,>4000 ; make a decoy
  top:  mov.i  bomb,>ptr          
  scan: seq.i  2*step,2*step+5 
        mov.ab scan,@top
        sub.f  inc,scan
        jmn.b  top,@top
  inc:  spl.i  #-step,>-step
        mov.i  clr,>gate
  btm:  djn.f  -1,>gate
  clr:  dat.f  <2667,clr-gate+2
        dat 0,0
  bomb: spl.i  #1,#1

  END scan

ROF

FOR MAXCYCLES==80001 ; '88

  ;Blur '88

  ;Length: 10

  step EQU 70

  top:  mov bomb,<ptr
  a:    add inc,scan
  scan: cmp -3*step+5,-3*step
        mov scan,ptr
        jmn top,scan
  bomb  spl 0,<1-step
        mov inc,<bomb-1
        jmp -1,<-1-step
  inc:  dat <-step,<-step
  ptr:  dat #0,#-2*step

  END scan

ROF

FOR MAXPROCESSES==8 ; LP

  ;Oldtimer++

  ;Length: 7

  size    equ (base-ptr)
  off   equ (8*17)
  rel   equ 91
  ptr equ (new-1)
    
    new   add.ab #rel,base
    first   mov.i base,ptr
    loop    mov.i *ptr,<ptr
    djn.a loop,ptr
    spl new,>2667
    jmp @ptr,>2667+20
  base    dat <size,<size+off

  END first

ROF

FOR MAXCYCLES==79999 ; Multi-warrior

  ;Die Hard

  ;Length: 11

  space    equ (4-40*127)
  dv       equ (c0+58)

  s:       spl 1,>-4002            
           spl 1,>-3001
           spl 1,>-2000
  c0       spl   @0,space          
           mov   }c0,>c0
  cs       spl   #0        ,}dv    
           mov   dv        ,}dv+space
  cb       add.a #119      , dv+space
           spl   imp+5334  ,}dv+space
           spl   imp+2667  ,}dv+space
  imp      mov.i #2667 ,*0

  END s

ROF


