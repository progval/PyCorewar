;redcode
;name Kopi
;author Jonas Hartwig
;strategy Simple paper
;assert CORESIZE == 8000

const equ 805
step  equ 223

lulle dat #0
start mov #6,lulle
kopi  mov @lulle, <dit
      djn kopi, lulle
dit   spl @dit,const
      add #step,dit
      jmp start
end   start

