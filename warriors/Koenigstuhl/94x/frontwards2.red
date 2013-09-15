;redcode-94x verbose
;name  Frontwards v2
;author  Steven Morrell
;strategy  One-shot/two-pass
;assert CORESIZE == 55440
;assert VERSION >= 80

;  (55440-offset) mod 13 = 0                    (align the decoy with the
;                                                warrior)
;  (55440-(first-stream)) mod 26 is in [14,25]  (don't bomb the stationary
;                                                end of the djn stream)
;  (55440-(first-stream)) mod 27 is in [13,0]   (don't bomb the moving end
;                                                of the djn stream)
;  first mod 13 = 1                             (scanner will look at cc+1,
;                                                etc.)
;  (55440-(first-lead instruction)) mod 26 is in [0,12]
;                                               (don't bomb the front of
;                                                the decoy)
;  (55440-(first-lead instruction)+200) mod 26 is in [1,13]
;                                               (don't bomb the back of
;                                                the decoy)

; 55440+909-2224 = 54125 mod 26 = 19
;                        mod 27 = 21
; lead instruction = -159 from cc
; 55440+909+159 = 56508 mod 26 = 10
; 200 mod 26 = 18

step equ 13
offset equ 1009
stream equ (cc-1925)
first equ (cc-offset+100) ;=-909

; stp equ nop

org boot

      stp.b @1,{1
      stp.b @1,}1
      stp.ab *1,{1
for 12
      stp.ab #1,{1
      stp.ab #1,}1
      stp.b #1,{1
      stp.b #1,}1
      stp.ab 1,{1
      stp.ab 1,}1
      stp.b 1,{1
      stp.b 1,}1
      stp.ab @1,{1
      stp.ab @1,}1
      stp.b @1,{1
      stp.b @1,}1
      stp.ab *1,{1
rof

p     dat #first,{first+step
      dat #31,{-1
      dat #31,{-2
      stp.b #31,{-3
cc    spl 31,stream-4264

      stp.ab 1,}1

boot  mov top+5,top+offset+5

for 5
      mov {boot,<boot
rof
boot2 mov cc,cc+offset
for 4
      mov {boot2,<boot2
rof
      jmp x+offset
      
      stp.ab 1,}1
      stp.b 1,{1
      stp.b 1,}1
      stp.ab @1,{1
      stp.ab @1,}1
      stp.b @1,{1
      stp.b @1,}1
      
top   sub x,@x
x     sne *p,@p
      djn.f top,<stream
      spl #0,<p
      mov @1,}p
      djn -1,<cc

      stp.ab 1,}1
      stp.b 1,{1
      stp.b 1,}1
      stp.ab @1,{1
      stp.ab @1,}1
      stp.b @1,{1
      stp.b @1,}1
      stp.ab *1,{1
      stp.ab #1,{1
      stp.ab #1,}1
;      stp.b #1,{1
     
end

