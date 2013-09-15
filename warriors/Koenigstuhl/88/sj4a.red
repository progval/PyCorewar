;redcode
;name SJ-4a
;author J.Layland
;strategy  Leprechaun-like SPL-JMP bomber, 2-pass clear, gate
;assert  1
inc    equ (-16*7)        ; mod 16 bomb           
offset equ 24             ; mod 8 overall
b      equ (scan-offset)
loc    equ (b+1+48)
 
bomb dat <-49, #0
 
start add #inc, scan
mov j1, @scan
scan jmz -2, @test+offset
;xbreak
mov scan, @2    ; dec protected
test mov j2, @b
mov s, <b
jmn start, test 
;xbreak
s   spl 0, <-48  
    mov @b, <loc
j2  jmp -1,  0
j1  jmp -offset, -offset
src dat #0

ptr dat #-97

boot
mov ptr, <dst
sub #16, dst

mov <src, <dst
mov <src, <dst
mov <src, <dst
mov <src, <dst
mov <src, <dst

mov <src, <dst
mov <src, <dst
mov <src, <dst
mov <src, <dst
mov <src, <dst

mov <src, <dst

dst spl @0, 2356

sub #69, dst
mov bomb, <dst
 
mov 1, dst

for MAXLENGTH-CURLINE
dat #1,#0
rof

end boot
