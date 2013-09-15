;redcode
;name LP88vamp
;author Ilmari Karonen
;strategy 88'ified vamp from "LP and Feelin' Fine" by JKW.
;strategy I was using this as a test opponent, but it does
;strategy better that anything else I could come up with..
;assert 1
; (CORESIZE == 8000) && (MAXPROCESSES==8)
; KOFACOTO 2

;*** All comments (and most code) below are by JKW. ***

step    equ     15
stfang  equ     (stcode-7981+step*3)
sboot   equ     (sneak+1+2541)

        ;org	start

; --The Sneak--
; This is backwards clear which will be booted away
sneak   mov     bomb, <bclear
        jmp     -1, <bclear
        dat     #0,#0
        dat     #0,#0
        dat     #0,#0
bomb    dat     #0,# -11
bclear  dat     #0,# -31


lri
        mov     sneak+0, sboot+0
        mov     sneak+1, sboot+1
        mov     sneak+5, sboot+5
        mov     sneak+6, sboot+6
; 1 process to the sneak
        spl     sboot

; 5 processes to the vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp
        spl     vamp

; 1 process to the forward clear
        jmp     myclear


        for     34
        dat     #0,# 0
        rof

; ---PIT---
pit     spl     1, pclear
        mov     dbomb, <pclear
hit1    jmp     pit, pclear
; ---------

        dat     #0,# 0
        dat     #0,# 0
        dat     #0,# 0
        dat     #0,# 0

hit2    dat     #0,# 0
        dat     #0,# 0
        dat     #0,# 0
pclear  dat     #0,# -50
        dat     #0,# 0

hit3    dat     #0,# 0
        dat     #0,# 0
        dat     #0,# 0
        dat     #0,# 0
jbomb   jmp     0, 0

hit4    dat     #0,# 0


; --Bomber--
stcode
inc     dat     #-step, #step
        dat     #0,#0
vamp    add     inc, fang
pfang   mov     fang, @fang     ; drop fang
;        add     0*jbomb, 0*fang    ; drop jmp bomb
        jmp     vamp, @pfang    ; My memory's hazy about this line
                                ; a jmp vamp, 0 should work exactly the same
        dat     #0,# 0
        dat     #0,# 0
; --Clear--
; works with the same ptr as the pit for a fast clear (max 200% c with enemy)
myclear mov     dbomb, <pclear
        jmp     myclear, pclear

hit5    dat     #0,#0
dbomb   dat     #0,# 50
        dat     #0,# 0
        dat     #0,# 0
fang    jmp     pit-stfang, stfang

	end lri

