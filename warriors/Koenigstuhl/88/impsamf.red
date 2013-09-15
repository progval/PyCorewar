;redcode  
;name ImpsAreMyFriend 1.1
;author James Layland
;contact jlayland@grissom.jpl.nasa.gov
;assert CORESIZE==8000
;strategy stone from P.Kline's Imprimis
;strategy binary imp launch based on W. Mintardjo's Sphinx
;strategy shorter imp spiral a la Night Crawler
;Here's hoping the paper Anders tested on the hill this 
;week wasn't meant for me...
;I didn't have time to figure out how to "stamp" my paper this week.
;Maybe I should have entered the cmp-scanning, 
;light-speed bombing, pit-trapping, replicating 
;imp spiral with the three pass core clear and gate.  
;And it does windows.  Oh well.

offset1 equ 1212        ; constants randomly chosen from thin air
offset2 equ 2551

IMP0    EQU (IMP+offset2)
IMP1    EQU (IMP0+2667)
IMP2    EQU (IMP1+2667)

boot    mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst
        mov <src, <dst

dst     spl @0, src-offset1
        mov IMP, IMP0

;binary launch like (i.e. copied from) Sphinx
launchimps
        SPL 8, <514
        SPL 4, <771
        SPL 2, <1028
        JMP IMP0, <1435
        JMP IMP1, <1542
        SPL 2, <1799
        JMP IMP2, <2056
        JMP IMP0+1, <2313
        SPL 4, <2470
        SPL 2, <2827
        JMP IMP1+1, <3084
        JMP IMP2+1, <3341
        SPL 2, <3598
        JMP IMP0+2, <3855
        JMP IMP1+2, <4112
      
; extra-extra-- Read all about it!
; imp-killing stone from Imprimis, copied intact
; Maybe I can play with constants this weekend, but KOTH says this
; works pretty well... :-)
; and the few variations I tried did _much_ worse.

stone    mov <5630,stone+3044+3
extra    spl -1,<inc-129-1100        ; stone soaks up cycles early
         add inc,stone               ; but kills itself after mod-4 is complete
cnt      djn extra,<inc-129-1100
inc      dat #2667,#3044

src     dat #0

IMP     MOV 0, 2667

decoy
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
        dat <src, #1
 
end boot
