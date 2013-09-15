;redcode-b
;author Compudemon
;name Best of the best
;strategy win win win
;strategy tried lots of differnt programs
;strategy tried pspacers 5 different components
;strategy tried every strategy
;strategy because i added so many things and remove almost
;strategy as many i may have a copy of someones code but
;strategy but i dont remember names of programer or program
;strategy at least i tried to make an original program
;assert 1

spt     equ     (last+300)
gate1   equ     (stone-3)

org scan

pval    DAT.F   $0,     $0                   ; will points to the Dat
scan    JMZ.F   scan,   >spt    ; linear bomb-scan
        SUB.AB  #2,     spt     ; Try 2, 3 and 4
cloop   MOV.I   >bptr,  >spt
        DJN.B   cloop,  #5
        SUB.AB  #3,     spt
bptr    JMP.B   @spt,   #gat
gat     DAT.F   #0,     #5
bomb    DAT.F   >2667,  #5      
        SPL.B   #0,     >gat+2667
dloop   MOV.I   bomb,   >gat    ; anti-imping dirty core-clear
dl      DJN.F   dloop,  >gat    ; Thank you Bjoern.
stone   SPL.B   #95,    >-95
last    MOV.I   zgate,   }gate1
zgate    DAT.F  zgate-gate1+2,   >gate1
end
