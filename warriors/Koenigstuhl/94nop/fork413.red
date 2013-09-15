;redcode-b
;name Fork 4/13
;author Christoph C. Birk
;assert 1
;strategy booted silk-replicator + some bombs 
;scores 129 Wilkies

STEP1 equ  321                        ; replication step-1
STEP2 equ  3184
STEP3 equ  7800
STEP4 equ  7600
BSTEP equ  51                         ; bombing distance
BOOT  equ  2345                       ; boot distance
BLEN  equ  17                         ; boot length

boot
a for BLEN                            ; (last-start) 
        mov.i   {bptr,<bptr
rof
        spl @bptr                     ; start
        mov #0,bptr                   ; erase boot-pointer
bptr    dat #last,#BOOT

start   spl     1,       <-200        ;\.
        spl     1,       <-300        ; | create 13 processes
        mov.i  -1,       0            ; |
        mov.i  -1,       0            ;/.

proc1   spl     @proc1,  }STEP1
        mov.i   }proc1,  >proc1
        mov.i   <-BSTEP, {BSTEP*4+1
proc2   spl     @proc2,  }STEP2
        mov.i   }proc2,  >proc2
        mov.i   <-BSTEP, {BSTEP*3+1
proc3   spl     @proc3,  }STEP3
        mov.i   }proc3,  >proc3
        mov.i   <-BSTEP, {BSTEP*2+1
proc4   spl     @proc4,  }STEP4
        mov.i   }proc4,  >proc4
        mov.i   <-BSTEP, {BSTEP*1+1

        mov.i   proc1-1, >proc1-1     ; erase myself

last    end boot

