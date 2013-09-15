;redcode
;name vampiric rat
;author Jon Newman
;assert 1
;strategy experimental vampiric rat program
;
init      jmp loop,0
blank1    dat #0,#0
blank2    dat #0,#0
target    dat #0,#4103
source    dat #0,#fang
          mov #-1, target
          sub #4, dest
          jmp reset,0
dest      dat #0,#2025
blank3    dat #0,#0
blank4    dat #0,#0
loop      mov @source, <dest
          djn bomb, source
          spl @dest,0
reset     mov #28, source
          sub #276, dest
          jmp 3,0
blank5    dat #0,#0
blank6    dat #0,#0
bomb      mov #0, @target
          sub target, @target
          add #24, @target
          mov fang, <target
          sub #7, target
          jmp loop,0
blank7    dat #0,#0
blank8    dat #0,#0
trap      mov #-32, ttarg
          mov #-7, purge
tloop     mov dest, <ttarg
          spl @purge,0
          jmp @purge,0
fang      spl @1,0
blank9    dat #0,#0
blank10   dat #0,#0
ttarg     dat #0,#target
purge     dat #0,#-7
