;redcode-94
;name Grilled Octopus v0.7
;author David Boeren
;assert CORESIZE == 8000
;strategy Aggressive P-warrior
;strategy Death awaits you all, with nasty big pointy teeth!
;strategy     v0.1 Initial Release
;strategy     v0.2 More aggressive, wins are better than ties!
;strategy     v0.5 Totally new pspace techniques, upgraded components
;strategy     v0.7 I'm shrinking!  Multi-boot saves 16 instructions.

step    equ 95
stepb   equ (step*2)
stepz   equ (184*2)                  ; "second chance" step for Fei-Oh
gate    equ (inc-95)

dest0   equ   2200
dest1   equ   3740
dest2   equ  -1278                   ; pmars optimized
range   equ    933                   ; pmars optimized

sid     equ    143                   ; Stage ID
pdata   equ     23                   ; Win/Loss data
Pmod    equ     29

; 5=7859, 7=7801, 8=7772, 10=7685, 13=7598, 16=7511, 20=7385
Pinit   equ   7598                   ; Fei-Oh loss tolerance
Pmorf   equ   7801                   ; Fei-Oh re-stepping tolerance
Pinit2  equ   7772                   ; Paper Shredder loss tolerance

bdist   equ   (sflag+3312)           ; multi-boot distance
fei_oh  equ   mboot+5

        org start
sflag   DAT.F      #sid,   #pdata    ; pspace data pointers
        DAT.F        #0,   +Pinit    ; first round
PRESULT DAT.F        #0,    +Pmod    ; loss
        DAT.F        #0,    -Pmod    ; win
        DAT.F        #0,       #0    ; tie

start   LDP.A        #0,  PRESULT    ; Get results of last round
        SNE.A       #-1,  PRESULT    ; Is it the 1st round?
        STP.A     #1003,    sflag    ;     If so, init stage ID
        LDP.A     sflag,     jtab    ; Load stage ID
        SUB.A     #1003,     jtab    ; Subtract secret number...
        SLT.AB     jtab,       #3    ; Are we brainwashed?
        JMP.B        @0,   nowash    ;     If so, jump to handler
        LDP.BA    sflag,    PTEST    ; Get the current win/loss counter
jtab    JMP.B        @0,   stage1    ; Jump table to correct component
        DAT.F        #0,   stage2
        DAT.F        #0,   stage3

stage1  ADD.AB    PTEST, *PRESULT    ; Update win/loss counter
        STP.B  *PRESULT,    sflag    ; Store updated counter
        MOD.AB    #Pmod, *PRESULT    ; Check the MOD
        SLT.B  *PRESULT,   #Pmorf    ; See if Fei-Oh is losing...
        MOV.A    #stepz,   loop+1    ;     Try a new step
        JMZ.B    fei_oh, *PRESULT
        STP.A     #1004,    sflag    ; Engage stage 2 pspace algorithm
        STP.AB  #Pinit2,    sflag    ; Reset stage 2 loss counter
                                     ; Too many loss
nowash
shred   MOV.A #ptr-boot,     boot    ; Set component boot pointer
        MOV.A        #4,     boff    ; Adjust for starting offset
        JMP.B   mboot+3,       #1    ; Jump to multi-boot routine

ptr     DAT.F       #10,       #5
        DAT.F       #10,       #1
        SPL.B        -1,       #1
scan    ADD.A        #8,      ptr   ; "Ippatsu" one-shot scanner
        JMZ.F      scan,     *ptr
        SPL.B       #10,       #2
clear   MOV.I      @ptr,     }ptr
        DJN.F     clear,    <gate

paper   SPL.B         1,       #0    ;\.
        SPL.B         1,       #0    ;-> generate 8 processes
        SPL.B         1,       #0    ;/.

silk    SPL.B        @0,   {dest0
        MOV.I       }-1,      >-1
silk1   SPL.B        @0,   <dest1
        MOV.I       }-1,      >-1
        MOV.I     ibomb,   }range
        MOV.I    {silk1,   <silk2
silk2   JMP.B        @0,   >dest2
ibomb   DAT.F     <2667,    <5334

inc     SPL.B        #0,    <gate    ; Fei-Oh v0.6
loop    MOV.I      bomb,    @targ
        ADD.AB   #stepb,     targ
targ    MOV.I      bomb, }stepb-1
        DJN.F      loop,    <gate
bomb    DAT.F     #step,       >1

; stage 3 is a switch-on-loss module against pspacers and paper/imps

stage3  SNE.A        #0,  PRESULT    ; check result
lost    ADD.A        #1,    PTEST    ; lost change
        MOD.A        #2,    PTEST    ; secure result
win     STP.AB    PTEST,    sflag
PTEST   JMP.B        @0,   fei_oh
        DAT.F         0,    pboot

stage2  ADD.AB    PTEST, *PRESULT    ; Update win/loss counter
        STP.B  *PRESULT,    sflag    ; Store updated counter
        MOD.AB    #Pmod, *PRESULT    ; if flag is not the right mod:
        JMZ.B     shred, *PRESULT
        STP.A     #1005,    sflag    ; Engage stage 3 pspace algorithm
                                     ; Fall through to backup strategy...
pboot   MOV.A #paper-boot,   boot    ; Set component boot pointer
        MOV.A        #0,     boff    ; Adjust for starting offset
                                     ; Fall through to multi-boot

mboot   MOV.I     }boot,    >boot    ; Multi-boot routine, default to Fei-Oh
for 9
        MOV.I     }boot,    >boot
rof
boot    MOV.I       inc,    bdist    ; fast boot away tail first
        MOV.I         0,    sflag    ; Safety-net for our pspace stuff
boff    SUB.AB       #5,     boot
        SPL.B     @boot,       #1    ; split to main program
        MOV.I         0,     boot    ; obliterate boot pointer
                                     ; fall through and die...

for (MAXLENGTH-CURLINE)
        DAT.F (clear*23),(ptr*91)    ; big decoy to confuse scanners
rof
        END

