;redcode
;name Checker 5.4
;author Kent Peterson
;assert 1
;6/9/92

opc3    equ     37
opc     equ     33              ;program length, without bomb
opc2    equ     36              ;prog length, with bomb (to copy)
osc     equ     2009            ;9 to sterilize any SPL 0 trail
opp     equ     1998            ;points to positive program for checking
opp2    equ     2000            ;points to positive program for copying
killc   equ     15              ;time to spend sterilizing

startup:mov     <ptr,   <pp     ;COPY!
        mov     <ptr2,  <np
        mov     <ptr,   <pp     ;copy very quickly to 2 other locations
        mov     <ptr2,  <np
        mov     <ptr,   <pp     ;once all 4 copies are made, the
        mov     <ptr2,  <np     ;original (with this loop) gets left
        mov     <ptr,   <pp     ;halfway between two of them as a decoy
        mov     <ptr2,  <np     ;for scanners
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        mov     <ptr,   <pp
        mov     <ptr2,  <np
        djn     startup,2       ;go through the loop once more
        spl     setcopy+3000,0  ;start both up in the copying section,
        jmp     setcopy-1000,#2 ;creating the network quickly
ptr2:   dat     #0,     #opc3

ptr:    dat     #0,     #opc2
nc:     mov     pp,     np      ; copy data
        sub     #4000,  np      ; adjust so points to neg prog
        cmp     @ptr,   <np     ; is neg program different too?
death:  dat     #0,     #0      ; neg program is different, we're wrong
        mov     death,  2040    ; stop any SPL 0 trail
        mov     death,  2000    ; prevent any sterilization
        mov     death,  <pp     ; kill SPL 0 in SPL 0/JMP -1
        mov     death,  2014    ; kill copy loop
        mov     death,  2024    ; kill check loop
        mov     death,  2006    ; kill sterilize loop
        mov     #killc, ptr     ; set up data for complete sterilize
        mov     #osc,   pp      ; catches anything following SPL 0 trail
        mov     death,  <pp     ; sterilize completely
        mov     death,  <pp     ; 3 MOVs means it spends 60 cycles
        mov     death,  <pp     ; sterilizing versus 68 cycles for 2 MOVs
        djn     -3,     ptr     ; and 90 for 1(60 is 66% of 90,88% of 68)
setcopy:mov     #opc2,  ptr     ; after sterilization, copy(set up data)
        mov     #opp2,  pp
copy:   mov     <ptr,   <pp     ;copy
        mov     <ptr,   <pp     ;3 MOVs = spend 48 cycles copying instead
        mov     <ptr,   <pp     ;of 54 or 72(48 is 66% of 72,88% of 54)
        jmn     -3,     ptr
        spl     2001,   0       ;start up copy
pc:     mov     #opc,   ptr     ;begin check, set up data
        mov     #opp,   pp
check:  cmp     @ptr,   <pp     ;check if same
term:   jmp     nc,     #1968   ;something different, check neg prog
        add     #6,     z       ;next bombing target
        jmz     4,      @z      ;something there?
        slt     z,      term    ;have we gone too far?
        mov     death,  z       ;yes, make bombs lethal & reset pointer
bomb:   mov     z,      @z      ;bomb it
        djn     check,  ptr     ;keep checking till whole prog done
        jmp     pc,     0       ;go back and check
z:      spl     0,      #0      ;first bomb, later DAT, used as pointer
pp:     dat     #0,     #3000   ;pointer to pos program
np:     dat     #0,     #-1001  ;pointer to neg program
        end startup
