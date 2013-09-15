;redcode
;name vm5
;author Michal Janeczek
;strategy oneshot with gate
;assert CORESIZE == 8000

; I'm not sure if my paranoid boot is worth even
; a fraction of a point, but surely makes the code messy.
; Here's the 'clean', schematic code of the warrior
; soon after boot.
;
;   sub 2   , p
; p cmp x   , x-s
;   jmp 2*s , 2*s  --+
;   djn -3  , @p     |
;                    |
;   [...]            |
;                    |
;   second pass bomb |
;   dat <-7 , #0     |
;                    |
;   [...]            |
;                    |
; w dat 0   , 2      |
;   mov p   , @3   <-+
;   spl 0   , <-6
;   mov @w  , <c
;   mov @w  , <c
;   djn -2  , <2667-3-6
;
; c dat 0   , 0

s  equ 10   ; step
b  equ 5300 ; boot distance

st mov s4     , <b1
   mov s3     , <b1
b1 mov c2     , @st+b+4
   mov s2     , <b1
   mov s1     , <b1
   mov c6     , <b2
   mov c5     , <b2
   mov c4     , <b2
   mov c3     , <b2
b3 mov #2     , st+b+2*s+1
b2 spl st+b+1 , st+b+2*s+7
   mov c1     , st+b+2*s-5
c1 dat <-7    , #0
c3 spl 0      , <-6
c4 mov @-3    , <4
c5 mov @-4    , <3
c6 djn -2     , <2667-3-6
s1 sub 2      , 1
s2 cmp -s     , -2*s
c2 mov -1-2*s , @3
s3 jmp 2*s    , 2*s
s4 djn -3     , @-2

d01 equ spl 0,1
d02 equ spl 0,#1
d03 equ spl -1,1
d04 equ spl -1,#1
d05 equ spl 0,@1
d06 equ spl -1,@1
for 4
y for 6
for 4
for CURLINE<MAXLENGTH
d&y
rof
rof
rof
rof
