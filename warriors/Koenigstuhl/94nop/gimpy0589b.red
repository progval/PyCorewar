;redcode verbose
;author W. Henchy
; <willio@coffeebyte.com>
;name gIMPy v.0.58.9b
;strategy Pull an imp (notice the IMP in it?) and cover the core while
;strategy bombing, too :)
;HISTORY: 0.1    : Just an IMP clone
;         0.3    : Added     ing
;         0.35   : Added some more     ing runs
;         0.4    : Added FOO, & PAPER run from DWARF
;         0.5    : Added some better     ing runs
;         0.54   : Added P-space brainwashing
;         0.58   : Deleted brainwshing, Added better     ing, more DAT
;         0.58.9a: TOTAL REWRITE
;         0.58.9b: Fixed the bug in which gIMPy didn't move
;assert CORESIZE == 8000
       
start:  mov     0,  1
bomb:   dat    #5, #1
        dat    #4, #0
        dat    #6, #2
        dat.f  }63, $4
        dat.f  $0,  $24
        mov.i  #27, >30
        mov.i  >200, $0
