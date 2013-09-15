;redcode-tiny
;name FeeFi
;author Philip Thorne
;strategy Redcoders Frenzy [Round #10 Tri-Tiny] Entry #1/3
;strategy http://de.geocities.com/fizmo_master/cwt.htm
;strategy
;strategy My obligatory One-Shot
;strategy
;strategy 31May03 This version switched to regular rules from R10 for Tiny Hill
;
;assert (CORESIZE==800) 
;       (MAXCYCLES==16000)

STEP    EQU (-288)
GAP     EQU (16)
ADJ     EQU 1

;clean - djn follows behind bomber to avoid slow down
;        unless found something in which case hopefully
;        it's stunned already.
gate:
ptr:    dat.f   scan,           scan+GAP-ADJ
        dat     0,              0               ;31May03
bptr:   dat     (eptr-ptr+3),   1
dptr:   spl     #(eptr-ptr+3),  gate+10
        dat     0,              0               ;31May03
clr:    spl     #125,           <ptr
        mov     @bptr,          }ptr
        mov     @bptr,          }ptr
eptr:   djn.f   -2,             >dptr 
        dat     0,              0               ;31May03
;find
scan:   add.f   incr,           ptr
        sne.i   *ptr,           @ptr
        jmn.f   scan,           <ptr
        spl     clr,            {0
        mov.i   clr,            >ptr
        mov.i   jbmb,           >ptr
        sub.a   #15,            ptr
        dat     0,              0               ;31May03
incr:   dat     #STEP,          #STEP+1
jbmb:   jmp     #0,             0

    end scan

