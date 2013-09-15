;redcode
;name ExtraExtra 2
;author P.Kline
;strategy improved stone (2667/2045)
;strategy with anti-imps and anti-pittrap code
;assert 1
copyf1   dat #cnt+1
copyt1   dat #inc+1000
copyt2   dat #inc+1000+3039  ; this is a reflection (still working on it, Matt)
hide1    spl 0,<-6
hide2    mov 403,<-20
hide3    sub @hide2,<hide2   ; hide2 + hide3 kill pittrappers
hide4    jmp -2,1000         ; 1000 protects from the stone
hide5    dat <-7,#0          ; hide5 + hide1 will eventually make an imp-gate
hide     dat #inc+3354
start    mov hide5,inc+3755  ; put outrigger in a hole in the bombing pattern
         mov hide4,@hide
         mov hide3,<hide
         mov hide2,<hide
         mov hide1,<hide
         mov <copyf1,<copyt1 ; move stone away from decoy
         mov @copyf1,<copyt2 ; to present as small a scan-target as possible
         mov <copyf1,<copyt1
         mov @copyf1,<copyt2
         mov <copyf1,<copyt1
         mov @copyf1,<copyt2
         mov <copyf1,<copyt1
         mov @copyf1,<copyt2
         spl @copyt1
         mov <copyf1,<copyt1
         mov @copyf1,<copyt2
         jmp @hide
inc      dat #2667,#2045     ; 2667 chases down imp-rings
dwarf    mov <100,<cnt+2045
extra    spl dwarf,<-100     ; this structure grows cycles very fast
         add inc,dwarf       ; so even if outrigger is spl-jmp bombed
cnt      djn extra,<extra-100; it has small affect (for a while)
         dat #(0-cnt)*128
         dat #(0-cnt)*128
for MAXLENGTH-CURLINE
         dat #(0-cnt)*128
rof
        end     start
