;redcode
;name dodgem6
;author Steve Newman
;snewman@cs.stanford.edu)
;strategy Write out a bunch of flag values and wait for the enemy
;strategy to bomb one.  Analyze enemy's bomb location.  Copy a dwarf
;strategy type program to a location that appears safe and transfer
;strategy control to it.  Large size is due to a simple one-shot
;strategy redundancy mechanism that helps resist damage in early stage
;strategy of play.
;assert 1

bomb       EQU (start-60)   ;Presumed to be a DAT 0,0 instruction.

;Write a flag value (77) to 64 well-scattered locations.
start      SUB #248,-15
           MOV #77,<(start-15)
           MOV #77,<(start-15)
           DJN start,#32

;Now repeatedly check the 64 locations until one of them is altered.
search     SUB #248,start
           CMP #77,<start
           JMP hit,<start ;predecrement leaves start pointing to first of
           CMP #77,<start ;     the flag values, as when other CMP fires.
           JMP hit
           DJN search,#0 ;crash after 8000 loops so we don't self-tie

;Buffer so initialization code doesn't act as a target for XTC-type
;searches.
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0

hit        ADD <copyPtr,sum       ;take a checksum of cargo1
           DJN hit,#sumEnd-sum
copyPtr    JMZ cargo1,sumEnd      ;if checksum came to 0, use cargo1
           JMP cargo2             ;otherwise use cargo2

           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0

;Copy the contents of start1...end1 to the bombed location, aligning
;so that dwarf1 goes just before our two flag values (which will be
;obliterated along with the rest of the target area).  Shift forward
;2400 positions (on the assumption that gcd(2400,enemy's bombing
;pattern) >= 4) to deal with programs that start bombing immediately
;behind themselves.
copyOffset EQU (2399+end1-dwarf1)
copyLen    EQU (end1-start1+1)

sum        DAT #122
cargo1     ADD #copyOffset,start
copyLp1    MOV <ptr1,<start
           DJN copyLp1,#copyLen
           JMP @start ;now branch to the copied dwarf

;a buffer zone of 14 zero values to avoid triggering XTC-style bombers
start1     JMP dwarf1
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0

;This is the "dwarf" program that we turn into.
dwarf1     MOV dwarf1+4,<dwarf1+5
           JMP dwarf1,<dwarf1+5

;another length-14 buffer zone
           DAT #0
           DAT #0
           DAT #-41
           DAT #-41
sumEnd     DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
end1       DAT #0
ptr1       DAT #0

;Redundant copy of "cargo".
cargo2     ADD #copyOffset,start
copyLp2    MOV <ptr1+dwarf2-dwarf1,<start
           DJN copyLp2,#copyLen
           JMP @start ;now branch to the copied dwarf

start2     JMP dwarf2
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0
           DAT #0

;This is the "dwarf" program that we turn into.
dwarf2     MOV dwarf2+4,<dwarf2+5
           JMP dwarf2,<dwarf2+5
           DAT #0
           DAT #0
           DAT #-41
           DAT #-41

           END start

