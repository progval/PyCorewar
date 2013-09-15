;redcode-94
;name Russ Post
;author Steve Gunnell
;assert 1

STEP  equ  (386*20+1)
START equ  7442

bptr  equ  head-2

head  slt    #START   ,#tail-(bptr)+5
      mov.a  @hptr   ,bptr
trash mov    *tail    ,}bptr
      mul.a  #STEP    ,@hptr
      jmz.f  trash    ,{head
hptr  jmn.a  @hptr    ,head
      jmp    @hptr    ,}tail
tail  spl    #0        ,}0
      jmp #0, }0
      dat  0, 0

      end   head

