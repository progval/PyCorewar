;redcode-x2
;name The Truth Is Out There
;author David Moore
;strategy Kill the imp/stone thing and exploit the p-space bug
;assert CORESIZE==55440 
;MAXPROCESSES==10000

dist  equ  3520  ;distance between silk copies
len   equ     6  ;length of silk
imp   equ 34117  ;size of imp
time  equ   120  ;number of times to bomb before leaving scanner

;scanner

top   nop 0, MINDISTANCE
bomb  mov sb, >top                ;bomb whatever we found
      jmn.f bomb, @top
      add.ab #dist-len-len, top   ;go to next silk copy
main  add.ab #len, top
scan  jmz.b main, @top            ;scan for jedimps
      slt.ab #(sb-top)+3, top
      jmp main, 0
      djn bomb, #time             ;quit after enough bomb sessions

;clear

      mov   wash, <-1   ;brainwashing clear
      djn     -1, #-11
      add.b    3,   4   ;anti-imp clear
      mov    *-1, < 3
      jmp     -2,   0
      spl    # 4,  imp+1
      dat      0,   0
wash  stp.ab # 5, # 100
sb    spl    # 0, { 0

end scan 
