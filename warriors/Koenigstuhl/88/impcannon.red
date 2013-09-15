;redcode
;name Imp Cannon
;strategy The imp cannon fires off an imp every so often.
;assert 1
timer dat #0,#400
;
lup   djn lup,timer
;
fire  mov #400,timer
split spl imp,0
      jmp lup,0
;
imp   mov 0,1

      end split
