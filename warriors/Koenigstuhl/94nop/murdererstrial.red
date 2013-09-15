;redcode-94
;name The DAT Murderer's Trial
;author Anonymous
;assert 1
;strategy It initializes and then sweeps about 98% of the core with JMP 0, 0
;strategy bombs then it splits into 5 bombers and an imp-gate. The bombers 
;strategy immediately start DAT 0,0 bombing. 

org start  ; specify execution start

step equ 98  ; for the preprocessor only

jptr    dat 0, 0

jbomb   jmp 0, 0

start   mov jbomb, < jptr
        djn    -1, # (CORESIZE*98)/100  ; calculated by the preprocessor

    i for 5
        spl bomber&i, 0
    rof
        jmp impgate, 0

gate    dat 0,0  ; this will be changed every cycle after bombers are killed

    for 4
        dat 0,0
    rof

impgate jmp 0, > gate  ; this will be the only survivor of bombing

        dat 0,0
datbomb dat 0,0

i for 5
    bomber&i  mov datbomb, step+1
              add #step, -1
	      jmp -2, 0
rof

end
