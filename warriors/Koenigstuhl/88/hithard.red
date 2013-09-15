;redcode
;name hithard
;author Jon Newman
;assert 1
        jmp loop1,0
bomb1   spl 0,0
bomb2   dat #0,#-13
loop1   mov bomb1,@target1
        sub step,target1
        jmn loop1,target1
start2  mov #7700,target1
        sub cnt,step
        djn loop1,cnt
loop2   mov bomb2,<target2
        mov bomb2,<target2
        jmp loop2,0
step    dat #0,#11
cnt     dat #0,#4
target1 dat #0,#7700
target2 dat #0,#-12

        end 
