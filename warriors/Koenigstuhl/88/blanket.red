;redcode
;name vampire program
;author Jon Newman
;assert 1
; experimental vampire program
; written by Jon Newman
;
fang      jmp 16,0
bomb      dat #0,#-22
trap      mov #3000, ttarg
          mov #-16, purge
tloop     mov bomb, <ttarg
          spl @purge,0
          jmp @purge,0
start     mov fang, @target
          sub #16, target
          jmn start, target
          mov #7968, target
          jmp start,0
blank1    dat #0,#0
blank2    dat #0,#0
blank3    dat #0,#0
blank4    dat #0,#0
blank5    dat #0,#0
blank6    dat #0,#0
target    dat #0,#7968
ttarg     dat #0,#3000
purge     dat #0,#-16
end       start
