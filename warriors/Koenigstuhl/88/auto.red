;redcode verbose
;name Auto v1.0
;author Peter Olcott
;strategy  Dumb jumping bomber, not very effective, but fun to beat
;assert 1

len   dat #0,#15
start mov #14,len    ;reset sequence
      mov #131,cyc
      mov #1001,b1
go    add #7,b1      ;bomb sequence
      mov ddt,@b1
      djn go,cyc
copy  mov <len,<b1   ;copy sequence
      jmn copy,len
      spl 1909
      jmp start      ;jumpes to new code location, this was manually fine
ddt   dat #0,#0      ;tuned for all my fancy algorithms failed miserably.
cyc   dat #0,#131
b1    dat #0,#1001

      end start
