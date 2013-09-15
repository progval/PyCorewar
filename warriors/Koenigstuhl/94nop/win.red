;redcode-94
;name Win!
;author David Moore
;strategy short-interval SNE scanner like Rave/Agony, with spl carpet bombs.
;strategy converts to spl clear, then a 21-point anti-spiral swipe,
;strategy then a continuous dat wipe. added decoy for fun.
;assert CORESIZE==8000

step   equ 848   ; scan pattern (848 = 16 * 53)
apart  equ 8     ; difference between the two scan pointers
time   equ 482   ; number of scanned pairs
length equ 13    ; spl carpet length
temp   equ 17    ; best offset for minimum gap length in spiral clear

       add.f kill, scan
scan   sne (2+apart)+((time+temp)*step), 2+((time+temp)*step)
count  djn -2, #time             ; scan until time runs out

       mov.b  scan,  dest
mute   sub.b  stun,  @2
       mov     *-1, <dest        ; carpet bomber, core clear
       djn      -1,  #0

       jmn  count, count         ; still scanning?

       djn.f <0, {-1             ; switch between modes of operation

       spl #(kill-mute), -382    ; 2nd pass bomb (spiral swipe)
stun   spl #(kill-mute), -length ; 1st pass bomb, carpet bomb
kill   dat #-step, -step         ; 3rd pass bomb

dest   dat 0,0   ; carpet/clear pointer

for (MAXLENGTH-CURLINE-7)
  dat 0,0
rof

blur   equ 6000 ; decoy location

decoy  mov bait, <scan+blur+0
       mov <scan+blur+1, <scan+blur+3
       mov {scan+blur+4, {scan+blur+6
       mov {scan+blur+7, {scan+blur+9
       jmp scan, <scan+blur+10
bait   dat {1, <1

end decoy

