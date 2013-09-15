;redcode-94nop
;name TheStarWhoLeadsAcross
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy Mirage-style scanner
;strategy now using Eggbeater's strategy
;strategy v3.0 added a 0,8c prescan
;strategy v3.0 entered 94nop at 19th postition
;strategy v3.1 added a small and fast decoy maker
;strategy to help against those nasty oneshots
;strategy v3.2 optimaxed!
;strategy trying different good randries on the hill...
;strategy this is v3.2.2

step equ 3094
spcl equ 381+1
span equ 11
pstep equ 3020
ini equ ((shoot-1)+pstep)
c equ 113
dc equ (shoot-(c*20))

 org decoy
 dat 0, 0  ;prescan
shoot mov.f #ini, #ini+span
where add.ab #step+1, #(step+1)
fire mov.i stun, >shoot
scan jmz.f where, <where
 slt.b where, #9
 mov.b *-1, shoot
 jmn.b *-2, where
 mov.a #spcl, *-3
 jmp >-2, }fire
stun spl #0, }0
 dat 0, 0
 dat 0, 0  ;prescan
 for 7
 dat 0, 0
 rof
 dat 0, 0  ;prescan
 for 60
 dat 0, 0
 rof
ptop sub.f more, @2
pre sne.f *shoot, @shoot
 sub.f more, shoot
 jmn.f fire, @shoot
 jmz.f ptop, *shoot
 mov.x @-3, @-3
 jmp fire, 0
more dat -pstep, -pstep
 for 6
 dat 0, 0
 rof
decoy nop }dc, >dc+1
 mov {dc+2, <dc+4
 mov <dc+5, {dc+7
 djn.f pre, {dc+9
 end

