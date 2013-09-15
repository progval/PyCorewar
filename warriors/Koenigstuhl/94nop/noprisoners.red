;redcode-94
;name No Prisoners
;author John K W
;strategy boot, scan, stun, clear
;strategy This is essentially B++ with '94 improvements.
;strategy The main problem with this program is the ineffectiveness
;strategy of SPL/JMP bombs... perhaps incendiaries would work better? :/
;strategy I always did like B++... the way it decrements the JMP instruction
;strategy to avoid an extra ADD instruction is just plain nifty.
;assert CORESIZE==8000
step equ 2234
org     boot

for 81
spl #loop*3667, 0
rof

boot    mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
        mov     <bootp, {bootp
bootp   jmp     2000,   jump+2

loop    add     #step,  dest
        jmz     -1,     @dest
        mov     jump,   @dest
dest    mov     split,  <-2
        jmn     loop,   loop
split   spl     #0
        mov     2,      >-10
jump    jmp     -1
        dat     >1,     15
