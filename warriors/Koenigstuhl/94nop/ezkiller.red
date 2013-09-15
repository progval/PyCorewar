;redcode-94
;name EZ killer
;author Stipe Predanic
;assert CORESIZE==8000

add #12,#12
mov splbomb,@-1
jmn -2,-2
mov datbomb,>datbomb
jmn -1,>datbomb
splbomb spl 0,>1
datbomb dat 0,>10
end


