;redcode-94
;name rmt 4 pk
;author P.Kline
;assert CORESIZE == 8000
;strategy Timescape, Timescape, Timescape
;strategy unless opponent is doing same, then HSA

PSTATE EQU 251
STATES EQU (loss_table-win_table)
      dat    0,init_table-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
      mov    0,-1               ; eliminate accidental stp's

w1 EQU Carbonite
w2 EQU HSA
w3 EQU Timescape

state jmp    @0        ,w1

win_table
wa0   spl    #wa0-win_table,w3
wa1   spl    #wa0-win_table,w3
wa2   spl    #wa0-win_table,w3
wa3   spl    #wa0-win_table,w3
wa4   spl    #wa1-win_table,w3
wa5   spl    #wa2-win_table,w3
wa6   spl    #wa3-win_table,w3
wa7   spl    #wa4-win_table,w3
wa8   spl    #wa9-win_table,w2
wa9   spl    #w10-win_table,w2
w10   spl    #w11-win_table,w2
w11   spl    #w10-win_table,w2

loss_table
la0   spl    #wa2-win_table,w3
la1   spl    #wa3-win_table,w3
la2   spl    #wa4-win_table,w3
la3   spl    #wa5-win_table,w3
la4   spl    #wa6-win_table,w3
la5   spl    #wa7-win_table,w3
la6   spl    #wa8-win_table,w2
la7   spl    #wa8-win_table,w2
la8   spl    #wa7-win_table,w3
la9   spl    #wa8-win_table,w2
l10   spl    #wa9-win_table,w2
l11   spl    #w10-win_table,w2

tie_table
ta0   spl    #wa1-win_table,w3
ta1   spl    #wa2-win_table,w3
ta2   spl    #wa3-win_table,w3
ta3   spl    #wa4-win_table,w3
ta4   spl    #wa5-win_table,w3
ta5   spl    #wa6-win_table,w3
ta6   spl    #wa7-win_table,w3
ta7   spl    #wa8-win_table,w2
ta8   spl    #wa9-win_table,w2
ta9   spl    #wa9-win_table,w2
t10   spl    #w10-win_table,w2
t11   spl    #w11-win_table,w2

init_table
      spl    #wa4-win_table,w3
      spl    #wa4-win_table,w3
        
bootdist equ (49+rmtend-dptr)
Carbonite
        mov	}sptr, }dptr
        mov	}sptr, }dptr
        mov	}sptr, }dptr
        mov	}sptr, }dptr
        mov	>sptr, >dptr
        jmp	dptr+bootdist, <-400
dptr	dat	bootdist, bootdist+dbomb-scopy
sptr	dat	scopy, dbomb
dbomb	dat	>-1, >1
;[Timescape (1.0)]

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

Timescape
        spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP
    dat 0,0
    dat 0,0
    dat 0,0
    dat 0,0
scopy
	spl	#0, <-100
	mov	dbomb, tar-197*3500
tar	add	#197, -1		; gets bombed to start coreclear
	djn.f	-2, <-1151

step EQU 9
ptr EQU (bomb-5)
away EQU (rmtend+30) ; not the actual value

bomb: spl    #1,{1
kill: mov    bomb,<ptr
mptr: mov    >ptr,>ptr
      jmn.f  kill,>ptr
a:    add    #step+1,@mptr
scan: jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm:  jmp    a,{kill

HSA
hboot: mov    btm,@dest
N FOR 8
      mov    btm-N,<dest
ROF
      spl    @dest,1
dest: mov    #250,@away
      mov    bomb,<dest
      div.f  #0,dest
rmtend  dat 0,0
        end think
