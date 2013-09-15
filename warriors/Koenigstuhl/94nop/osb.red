;redcode-94b
;name One Step Beyond
;author John Metcalf
;strategy New type of scanner, .5c scan -> d-clear
;strategy bomb used is spl 0, spl -1, spl -2, spl -3, spl -4
;strategy pushed off of the '94b hill age 94, August 1998
;assert CORESIZE==8000
      step equ 4636
die:  mov    bomb,   <ptr
go:   mov    >ptr,   @ptr
ptr:  djn    go,     {1+step
      add.ab <ptr,   <ptr

loop: add    #step,  @go
start:jmz.f  loop,   @ptr

ga:   slt    ptr,    #12
      jmp    die,    <ptr
      djn    loop,   #9

bomb: spl    0,      4
      mov    da,     >ga
      djn.f  -1,     >ga
da:   dat    <2667,  <7

      end start
