;redcode
;name Nightfall
;author David Moore
;strategy a silk replicator for the 88 standard
;assert CORESIZE==8000

aaa equ 3907
bbb equ 3333
ccc equ 6380

length equ 8

boot   spl 1,0
       spl 1,paper+length+aaa
       spl 1,paper+length

       mov <-1, <-2        ; must boot one copy in advance for silk

paper  spl aaa, length+(aaa*2)
       mov <paper+length+aaa, <paper

       mov <length, <1     ; use empty core as pointer to self
       spl      @0,  bbb

inner  mov <length, <1
       spl      @0,  ccc

       mov      #0,  inner+length
       jmp   inner, <inner+1

end boot
