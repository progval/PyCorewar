;redcode-94
;name Dumb_Luck
;author Kevin Brunelle
;assert 1
;strategy This has protection against imps and uses just dumb
;strategy luck as it fires one data statements backwards from it's
;strategy starting point.
;strategy I don't think this will do very well, but I want to see
;strategy just how it stands up among other warriors.

org start

start   mov.i data,  -1
          mov.i data,  <data
           jmp start
data   dat #0,   #-4
