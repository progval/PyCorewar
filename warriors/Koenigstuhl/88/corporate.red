;redcode
;name Corporate Program
;author Jack Twilley
;----
;strategy This program is designed to copy off seven small portions
;strategy of code whose sole purpose is to find something abnormal.
;strategy If they do, then they set a flag in their routine to a 
;strategy non-zero value, and wait until it becomes zero again.  
;strategy The second part of the program scans each of the small 
;strategy portion's flags, and based on the response, bombs a 
;strategy certain portion of core heavily.  Having completed that, 
;strategy then it resumes scanning the other pointers.
;assert CORESIZE==8000
;----
csize     equ 8000
num       equ 7                     ;Number of scanning programs
slen      equ (send-sstart+1)       ;Length of scanning program
dist      equ 1000                  ;(csize/(num+1)) - Distance between the programs
step      equ 5
stepx2    equ step*2
;----
; Scan unit
;----
sstart    add #step,          spoint
snext     jmn scall,          @spoint
spoint    jmp sstart,         #-1           
          dat #0,             #0
scall     add spoint,         send        
          jmn 0,              send
sback     jmp sstart,         0    
send      dat #0,             #0           
;----
; Copy-split unit
;----
cstart    add #dist+slen,     dest
          mov #send-2,        source
cloop     mov <source,        <dest
          cmp #sstart-1,      source
source    jmp cloop,          #source
dest      spl @dest,          sstart
cend      djn cstart,         #num
;----
; Bomb unit
;---- 
bstart    mov #dist-slen-14,  bdist
          mov #num,           bcount
bloop     jmn bkill,          @bdist 
bback     add #dist,          bdist
bcount    djn bloop,          #0
bbomb     jmp bstart,         #stepx2
bkill     mov @bdist,         btemp
          add bdist,          btemp
          add #step,          btemp
burp      mov btemp,          <btemp
          djn burp,           bbomb
          add #stepx2,        bbomb          
bexit     sub @bdist,         @bdist
          jmp bback,          #0
bdist     dat #0,             #0
btemp     dat #0,            #0
;----
          end cstart
