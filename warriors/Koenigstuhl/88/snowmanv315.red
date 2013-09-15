;redcode
;name SNOWMAN v3.15
;author John Metcalf
;assert CORESIZE==8000
mov @6,<5
mov <5,<4
djn $-2,$4
mov $9,$2004
mov $2,$2004
jmp $1003,$1012
djn $-1,<10
sub $8,@3
jmz $-1,@8
slt #-10,$7
mov @0,@6
jmz $-4,$-5
spl $0,<-1001
mov $2,<-2
jmp $-1,<-110
dat <3094,<-3094
jmp $-2103,$3094
end
