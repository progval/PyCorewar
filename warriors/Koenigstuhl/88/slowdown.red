;redcode
;Name slowdown1
;Author Mike Bleyer
;strategy  Slowdown1's strategy is: bomb with splits,(make 'em slow)
;strategy  bomb with dats, (everyone should be dead by now)
;strategy  start a dwarf (to tie in case someone survived)
;assert 1
start   mov   split,@count
        sub   #6   , count
	jmn   start, count
bomb    mov   count,<count2
        jmn   bomb , count2
	mov      0 , 1
count2  dat     #0 ,#7898
split   spl      0 , 0
count   dat     #0 ,#7896		
        end start
