;redcode
;name stargate
;author Beppe Bezzi
;assert 1

org stun

gate    dat     stun,kill+10
for 10
	dat     0,0
rof

stun    spl     #kill-gate,kill-gate+10
	mov     *gate,>gate
	djn.f   -1,{gate-kill-15
kill    dat     kill-gate,kill-gate+10
