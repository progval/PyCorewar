;redcode
;name VAMP
;author Stefan Roettger
;D-8525 Uttenreuth
;assert 1
;
start    spl  search              ;split program execution to main task
         mov #0,        start     ;initialize pointer to buffer
cbuf     mov #1,       <start     ;build a buffer containing #1
         djn  cbuf,     c         ;is the buffer big enough?
c        dat #41                  ;counter and end for buffer task
search   mov  bomb1,   @p         ;bomb core with bomb1
         add #18,       p         ;skip 18
         mov  bomb2,   @p         ;bomb core with bomb2
         add #23,       p         ;skip 23
         djn  search,  @p         ;run into buffer?
         mov #1,       @p         ;repair damaged buffer
         add #820,      p         ;do not bomb own program
         jmp  search              ;continue bombing
bomb1    spl  0                   ;spl bomb to slow down opponent
bomb2    jmp  -18                 ;jmp bomb to confuse and kill
p        dat #2048
