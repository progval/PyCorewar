;redcode
;name Skewer '88
;author Ben Ford
;strategy qscan -> stone
;assert CORESIZE==8000

; Adjusts QS parameters

qint equ 200
dist equ (1388-400)
incr equ -1001
time equ 920

; deliver the payload when the quickscanner
; finds something

found4 add # qint*4, qptr
found2 add # qint*2, @-1
found1 add # qint*1, @-2
found0

qbite cmp @qptr, found4-2
add #4100, qptr
add #3902, qptr ; JMN would save 1 cycle...

qmain mov <qpit, <qptr
qptr mov <qpit, @(qscan + 2*qint)
djn qmain, #7
qpit jmp boot, 15

jmp -58, 1
spl 0, 58
jmp 40, 1
spl -1, -40
jmp -43, 1
spl -1, 43
jmp 29, 1
spl -1, -29
jmp -28, 1
spl -1, 28
jmp 18, 1
spl -1, -18
jmp -13, 1
jmp -1, 13

; quickscan tries to catch enemies before they can boot away

qscan cmp qscan + 2*qint, 3900 + qscan + 2*qint
jmp found0, 0
cmp qscan + 3*qint, 3900 + qscan + 3*qint
jmp found1, 0
cmp qscan + 4*qint, 3900 + qscan + 4*qint
jmp found2, <found1
cmp qscan + 5*qint, 3900 + qscan + 5*qint
jmp found2, 0
cmp qscan + 7*qint, 3900 + qscan + 7*qint
jmp found4, <found2
cmp qscan + 8*qint, 3900 + qscan + 8*qint
jmp found4, <found1
cmp qscan + 9*qint, 3900 + qscan + 9*qint
jmp found4, 0

mov #(qscan + 10*qint) -qptr, qptr

cmp qscan + 10*qint, 3900 + qscan + 10*qint
jmp found0, 0
cmp qscan + 11*qint, 3900 + qscan + 11*qint
jmp found1, 0
cmp qscan + 12*qint, 3900 + qscan + 12*qint
jmp found2, <found1
cmp qscan + 13*qint, 3900 + qscan + 13*qint
jmp found2, 0
cmp qscan + 15*qint, 3900 + qscan + 15*qint
jmp found4, <found2
cmp qscan + 16*qint, 3900 + qscan + 16*qint
jmp found4, <found1
cmp qscan + 17*qint, 3900 + qscan + 17*qint
jmp found4, 0

; ***** DWARF *****

dinc equ 81
dhop equ 5278
dclk equ 1677
dbmb equ (dend+4)
dorg equ (dinc*dclk)+1
djmp equ (ddst+5421)

boot mov ddat, djmp+4
ddst mov @dsrc, djmp
mov <dsrc, <ddst
mov <dsrc, <ddst
mov <dsrc, <ddst
mov <dsrc, <ddst
mov <dsrc, <ddst
jmp @ddst, <ddst

dsrc spl 0, $dend
spl 0, <dhop+1 ; combines with datb to form a gate
dmov mov dbmb, <dorg
mov dbmb, @dmov ; hit by datb to start clear
sub #dinc, dmov
dend djn dmov, <dhop-3
ddat dat <dhop, <dhop

end qscan

