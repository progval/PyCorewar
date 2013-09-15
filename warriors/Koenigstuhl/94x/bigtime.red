;redcode-94x verbose
;name TimeScapeX (0.1)
;author J. Pohjalainen
;assert CORESIZE==55440
;strategy I'm stuck with replicators! Here is _The Latest_ one!
;strategy \---------------------------\  ----------------------
;strategy / ts1  spl    @ts1,  }STEP1 /  Phoenix/Cell   warrior  
;strategy \      mov.i  }ts1,  >ts1   \  body,  6+ processes to 
;strategy / ts2  spl    @ts2,  }STEP2 /  keep That Thing alive,
;strategy \      mov.i  }ts2,  >ts2   \  two  of  them  working   
;strategy /      mov.i  {ts2,  <ts3   /  together  with  proper  
;strategy \ ts3  jmp    @ts3,  }STEP3 \  constants and you have
;strategy /___________________________/  found >>-> TimeScapeX!   
;strategy \T I M E   T O   E S C A P E\  ----------------------

TSTEP equ 24000
CSTEP equ 19020
NSTEP equ -9714

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP

st for 184
        dat.f   0,              0
rof

warrior

        spl     1,              <-200
        mov.i   -1,             0
        spl     1,              <-300

        spl     tim1,           <-400

tim2    spl     @tim2,          }TSTEP
        mov.i   }tim2,          >tim2
cel2    spl     @cel2,          }CSTEP
        mov.i   }cel2,          >cel2
        mov.i   {cel2,          <ncl2
ncl2    jmp     @ncl2,          >NSTEP

end warrior

