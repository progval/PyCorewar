;redcode-94nop verbose
;assert (CORESIZE==8000)&&(MAXLENGTH>=100)
;name           Disaster Area 1.1
;author         Stefan Foerster
;contact        foerster@a-city.de
;url            http://home.a-city.de/stefan.foerster
;version        1.1
;date           Feb 25, 2001
;strategy       Q^b -> onetime vamp / paper / imp pump

                org     start

; constants
PROGLENGTH      equ     (jumper-bootptr+1)  ; length of complete program
VAMPSTEP        equ     4                   ; step size between vamp jumper
PITCOUNTDOWN    equ     (CORESIZE-1)        ; number of loops of enemy pit
DISTANCE        equ     (MINDISTANCE+400)   ; distance between qscan range and program
ANCHOR          equ     (jumper+DISTANCE)   ; base address of quick scanner
ISTEP           equ     889                 ; step size for imp pump = 8000/9

; silk constants
SPTR0           equ     5029
SPTR1           equ     2301
SPTR2           equ     4299
BOMBPTR         equ     1711

; length of program parts
I_MISC          equ     2                   ; boot ptr + initial split instr
I_PAPER         equ     10                  ; silk paper
I_IPUMP         equ     5                   ; imp pump
I_BOOT2         equ     4                   ; boot (part 2)
I_VAMP          equ     15

; calculate scan step ST
I_PROGRAM       equ     (I_MISC+I_PAPER+I_IPUMP)
NUM_NQSI        equ     (I_MISC+I_PAPER+I_IPUMP+I_BOOT2+I_VAMP)
REP             equ     ((MAXLENGTH-NUM_NQSI)/4) ; num of repeated SNE/SEQ/JMP/MOV instr
ST              equ     ((CORESIZE-MAXLENGTH-2*DISTANCE)/(4*REP-1)) ; search step

; !!! 1+I_PAPER+I_IPUMP == REP !!!

; boot ptr + initial split instruction [I_MISC=2 instr]
bootptr         dat     #ANCHOR+15*ST-1, #I_PROGRAM
progstart       spl     imppump, {-723

; silk replicator [I_PAPER=10 instr]
pstart          spl     1, <-145
                spl     1, <-290
                mov.i   -1, 0
silk            spl     @0, {SPTR0
                mov.i   }-1, >-1
                mov.i   bomb, }BOMBPTR
                mov.i   {silk, <silk1
silk1           spl     @0, >SPTR1
                jmp     silk, {SPTR2
bomb            dat     <2667, <5334

; imp pump [I_IPUMP=5 instr]
imppump         spl     0, }ishoot
ishoot          mov.i   imp, imp
                add.a   #ISTEP, ijump
ijump           jmp     imp-ISTEP-1, {2222
imp             mov.i   #ISTEP, *0

; quick scanner + boot code [REP*4 instr]
start
pp              for     REP
                sne.i   ANCHOR+(4*(REP-pp)+3)*ST, ANCHOR+(4*(REP-pp)+2)*ST
                seq.i   ANCHOR+(4*(REP-pp)+1)*ST, ANCHOR+(4*(REP-pp)+0)*ST
                jmp     found, {ANCHOR+(4*(REP-pp+1)-0)*ST+ST/2
                for     (I_PROGRAM-REP+pp>0)
                mov.i   <bootptr, {bootptr      ; boot a instruction of our program
                rof
                rof

; continue boot, if necessary [I_BOOT2=4 instr]
boot2           jmn.b   -1, bootptr             ; copy missing instructions
                mov.i   }bootptr, >1234         ; just to increment bootptr again
                spl     *bootptr, {-777         ; and split to booted program
                jmp     progstart, {-899        ; start program

; found enemy -> onetime vampire [I_VAMP=15 instr]
found           mul.b   bootptr, #4*ST     ; decode position relative to ANCHOR
                add.b   found, jumper      ; decode position relative to bootptr
nztest          jmn.f   vamp, @jumper      ; jump to vampire if target is non-zero
                sub.ab  #ST, jumper        ; next possible enemy target
                djn.b   nztest, #3         ; test again (with default = left end point)
vamp            sub.ba  jumper, jumper     ; set final jmp address for enemy
vshoot          mov.i   jumper, @jumper    ; shoot vamp jumper
                add.f   vstep, jumper      ; set next jumper
                djn.b   vshoot, #ST/VAMPSTEP    ; and shoot again
                jmp     boot2, {-1101           ; continue boot routine
pit             spl     1                       ; let the enemy split...
                djn.b   pit, #PITCOUNTDOWN      ; until time to die
                mov.i   vstep, pit              ; kill kill kill
vstep           dat     #-VAMPSTEP, #VAMPSTEP   ; increment of vamp jumper
jumper          jmp     pit, ANCHOR-5*ST        ; vamp jumper (b-field = target address)

                end

