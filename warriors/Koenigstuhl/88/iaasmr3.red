;redcode
;name IAASMR3
;author Matt Hastings
;strategy Self-splitting Stone bomber with two pass
;strategy core-clear; main-loop-overwriting DJN stream
;strategy resets core-clear location and pointer.
;strategy yeah, I'm working on it.
;assert 1
spl 0,2
dat #0,#12
start mov -1,6-12
mov -3,3+1-28
mov @28,<-28
spl 0,1
mov <1+28,0-28
add -3,@-2
djn -2,<-11
end start
