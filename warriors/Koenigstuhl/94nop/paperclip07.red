;redcode
;name Paper Clip 0.7
;author Ransom L. Smith
;
;strategy| Hey, remember that guy on RGC that took out his "troll" on
;strategy| our criticism? That sort of thing (e. g., splitting processes
;strategy| into enemy code) was my first idea as a beginner, too. only
;strategy| mine, instead of going straight across, was incremented
;strategy| dwarf-style. Anyway, I added a 3-process split to hook on to
;strategy| silk-papers, and a scan.
;
;assert CORESIZE==8000

org ghr

dta     dat 0, 0
ghr     ADD.A #130, trg
chk     seq.i dta, *trg
        slt.a #trg, trg
gb0     jmp ghr, < -20
        spl ghr, <-21
        spl 1,  <-22
        mov -1, <-23
        spl 1, <-24
trg     spl dta, < -25
