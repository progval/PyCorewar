;redcode-94
;name LuckyLuke
;author Philip Thorne
;strategy John Metcalf's Spring/Summer 2002/3 Tournament 
;strategy  Round 5 [Tri-Athelon] Entry #1 Lucky Luke
;strategy  on OPEN-Koenigstuhl on request by author
;strategy
;strategy   One-Shot scanner with S/S/D clear.
;strategy   I'd have preferred to do a real scanner but didn't -
;strategy   so here's a modified version of short-lived 94nop hill 
;strategy   #20 Quincy [I think this version has improved spacing/
;strategy   sizing=smaller]. Will be destroyed by the pspacers.
;
;strategy   R5 benchmark result over 400 rounds~132 [mid-table]
;strategy       http://lcg-www.uia.ac.be/~erikt/comics/luke.html
;
;assert (CORESIZE==8000)

ptr     EQU (sptr-101)

;clean like Geist
bptr:   dat     1,              2+7+(bptr-ptr)
dptr:   spl     #ptr+450,       2+7+(bptr-ptr)
        dat     0,              0
clr:    spl     #125,           }ptr
        mov     *bptr,          >ptr
        mov     *bptr,          >ptr
        djn.f   -2,             }dptr 

    for MAXLENGTH-CURLINE-5-4-1-4   -2
        dat     0,              0
    rof

;find like Quincy
MA      EQU     581
MB      EQU     73

scan:   mul.ab  #MA,            sptr
        jmz.f   scan,           @sptr    ;>sptr is nice with diff contants
sptr:   spl     clr,            MB
        mov.b   sptr,           ptr
        mov.i   jbmb,           @sptr

    for 4
        dat     0,              0
    rof

jbmb:   jmp     #0,             0

for 1

;decoy from HeSCansAlone
tDecoy    equ    sptr+193-9
tStart    mov    <tDecoy+0,{tDecoy+2     ; make a quick-decoy
          mov    <tDecoy+3,{tDecoy+5     ; to foil one-shots
          mov    <tDecoy+6,{tDecoy+8     ; and the occasional q-scan
          djn.f  scan  ,<tDecoy+10
rof

    end tStart
    end scan

