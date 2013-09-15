;redcode
;name Tangle Trap
;author David Moore
;strategy vampire
;assert CORESIZE==8000

; Deadline is here and I don't have a new warrior yet so here's one of my 
; hill warriors. I just hope that he doesn't play a fast replicator.

boot  equ 2532
fdist equ  -15
wdist equ   30
tdist equ  110
vlen  equ    6
wlen  equ    4
tlen  equ    4
vval  equ   15
dval  equ  -45
time  equ  107

      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # vptr + boot + tdist + 35
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # hide2 + 1
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # decoy
      spl      0, # - (vval*40) - (decoy*9)
      jmp      0, < -7
      jmp      0, < -8
decoy dat     #0, # -1

vamp  spl      0,   vamp + fdist
main  mov    @ 0, @ vamp + fdist
      add   incr, @ -1
      add # dval,   1
      djn   main, < -1 + (8*dval)
incr  dat # vval, < -vval

wait  djn      0, # time
      spl      0, < -vval + 1
clean mov wait-wdist-vamp+incr, < wait-wdist-vamp+incr+3
      djn     -1, < 3939

fang  jmp -fdist + tdist - 3 + (2*vval), 4 - (2*vval)

trap  spl      0,   0
      spl     -1,   0
      spl     -1,   0
      djn      0, < trap - tdist + fdist - vval - 8

stomp dat  <2663, < 2663

start
vptr  mov vamp+5,   boot + vlen - 1
      mov vamp+4, < vptr
      mov vamp+3, < vptr
      mov vamp+2, < vptr
      mov vamp+1, < vptr
      mov vamp+0, < vptr
hide1 mov   fang,   vptr + boot + fdist
wptr  mov wait+3,   vptr + boot + wdist + wlen - 1
      mov wait+2, < wptr
      mov wait+1, < wptr
      mov wait+0, < wptr
tptr  mov trap+3,   vptr + boot + tdist + tlen - 1
      mov trap+2, < tptr
      mov trap+1, < tptr
hide2 mov  stomp,   vptr+boot+wdist+clean-wait-vval+4
      mov trap+0, < tptr
      spl vptr + boot, < hide1
      spl vptr + boot + wdist, < tptr
      dat  <vptr, < wptr

end start
