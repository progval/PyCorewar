;redcode
;assert CORESIZE==8000
;name Tangle Trap 3
;author David Moore
;strategy .4c pit trapper with error-checking.
;strategy If damaged, then deploy "airbag"

;-------------------------------------------------------------------
; Here's the main code after boot:
;
;     A   add   B,       check
;     B   sub  #-step,   2
;     C   mov  <check,  @D
;     D   mov  <check,  @C - step * time
;     E   jmz   A,       check
;         jmp   clear,   0         ; go to core clear
;
;         ...
;
;         jmp skip + step, skip
; check   jmp trap, 0
;
; There are 7 processes in the loop. They execute in this order:
;
;      CADBECA DBECADB ECADBEC ADBECAD BECADBE ...
;
; Look at that again:
;
;      CADBE CADBE CADBE CADBE CADBE CADBE CADBE ...
;
; Note that there are constant additions (+2) and subtractions (-1)
; to "check". The sum of these changes is zero as long as
; things work properly. When the loop is damaged, the count
; is thrown off, causing line E to read a non-zero value.
; This allows the warrior to leave the crippled code and go
; quickly to the second phase: a core clear.
;-------------------------------------------------------------------
; The pit trap after boot:
;
;     X   spl  0, <2   ; <-- JMP bombs are aimed here
;     Y   spl -1,  0
;     Z   jmn -1, #MAXPROCESSES
;         dat  0,  0
;
; Every new process in the pit lands on X once and only once.
; Line Z is a counter for how many processes remain outside
; of the pit. As soon as the count reaches 0, you can be sure
; that all processes are at Y and Z. Next, they will all go
; to Z and the DAT, with no chance to return to the pit. Checkmate!
;-------------------------------------------------------------------

; vamp numbers

step equ (-49)
skip equ (-18)
time equ 976

; boot distances

dist   equ 5098  ; distance to vamp_A from boot
distCh equ 45    ; distance to check from vamp_A
distT  equ 217   ; distance to trap from vamp_A
distCl equ (-41) ; distance to clear from vamp_A

boot2   mov clBomb, @pCl
        mov fang2, @pF
        mov fang1, <pF
pW      mov wimp, boot+dist+(vamp_C-vamp_A)+skip+step
pT      spl pC, boot+dist+distT+3
pF      spl boot+dist+2, boot+dist+distCh
pV      spl @0, boot+dist+6
        mov <pV,  pF   ; hide boot pointers
        dat <pT, <pW

pC      spl boot+dist+3, boot+dist+distCl+3
pV2     spl @0, boot+dist+1
        mov <pV2,  pC    ; hide boot pointers
        dat <pV2, <boot+dist+3858

boot    spl boot2, <boot+dist+3466
        spl 2,     <boot+dist+1555
        spl 1,     <boot+dist+2290
        mov <source, <pV
        mov <source, <pV
        mov <source, <pC
        mov <source, <pT
        djn @pV2, #3
pCl     djn @pV,  #boot+dist+distCl-4

wimp    jmp 0, <0
clBomb  dat <-8, #-10

fang1   jmp skip + step, skip
fang2   jmp distT-(vamp_C-vamp_A)+(step*time)-skip-step, 2

        spl  0, <2
source  spl -1,  vamp_A + 6
        jmn -1, #MAXPROCESSES

        spl  0, <-7
        mov -5, <-5
        djn -1, <3984

check  equ (vamp_A + distCh)
clear  equ (vamp_A + distCl)

vamp_A  add   vamp_B,  check
vamp_B  sub  #-step,   2
vamp_C  mov  <check,  @vamp_D
vamp_D  mov  <check,  @vamp_C - step * time
vamp_E  jmz   vamp_A,  check
        jmp   clear,   0

end boot

