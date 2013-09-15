;redcode-x verbose
;author Ray Cromwell
;name Threader 2.0
;assert 1

jmp5  jmp 5,0
      dat #0,#0
      dat #0,#0
      dat #0,#0
      dat #0,#0
catch jmp 1
kill  spl -1
count dat #1580,#1580
start sub #5,jmp5
      add #5,jmpn5
      mov jmp5,@jmp5
      mov jmpn5,@jmpn5
      djn start,count
      mov count,kill
      mov count,kill2
      spl imp
loop  mov catch-1,<catch-2
      jmp loop,<catch-2 
imp   mov 0,1
      spl 0
kill2 jmp -1
      dat #0,#0
      dat #0,#0
      dat #0,#0
      dat #0,#0
jmpn5 jmp -5,0
      end start
