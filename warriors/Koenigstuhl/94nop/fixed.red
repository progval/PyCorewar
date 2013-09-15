;redcode-94
;name Fixed
;author Ken Espiritu
;strategy qscan -> paper
;assert 1

       org start

gap    equ    (6)
rep    equ    (17)
rep2   equ    (13)
qd     equ    (100)
qs     equ    (-200)
qb     equ    (start-700)
flag   equ    (qbomb-100)
datz   equ    (start-200)

qbomb: dat    }gap,    }-gap
tab:   add.a  table,   table
slow:  add.ab @tab,    fnd
fast:  add.b  *tab,    @slow
which: sne.f  }datz,   @fnd
       add.ab #qd,     fnd
       spl    bmber2,  }qs*13   ; start primary bomber

bmber1:add.b  fnd,     fnd2     ; redundant bomber
loop1: mov.i  qbomb,   @fnd2    ; .5c, forward only
fnd2:  mov.i  qbomb,   >fnd-(gap*rep)/2+1
       add    #2*gap,  fnd2
       djn    loop1,   #rep
       jmn.b  qbomb,   flag     ; check flag

fixed1:spl    1,       }qb+qs*31
       spl    1,       }qb+qs*32
       spl    1,       }qb+qs*33
silk1a:spl    @0,      <131
       mov.i  }silk1a, >silk1a
silk1b:spl    @0,      }7502
       mov.i  }silk1b, >silk1b
silk1c:spl    @0,      }2430
       mov.i  }silk1c, >silk1c
       mov.i  #3555,   }-3190
       mov.i  #1832,   }1398
       mov.i  #-2840,  }570


       dat    }10*qs,  >2*qs    ; can get 21 values from this table
table: dat    >4*qs,   }1*qs    ; and can also use the initial value
       dat    }23*qs,  >3*qs    ; of fnd

start: seq.i  qb+qs*0, qb+qs*0+qd
       jmp    which,   }qb+qd/2
       seq.i  qb+qs*2, qb+qs*2+qd
       jmp    fast,    {tab
       seq.i  qb+qs*13,qb+qs*13+qd
       jmp    fast,    {fast
       seq.i  qb+qs*1, qb+qs*1+qd
       jmp    fast,    }qb+qs*1+qd/2
       seq.i  qb+qs*3, qb+qs*3+qd
       jmp    fast,    }tab

       seq.i  qb+qs*17,qb+qs*17+qd
       jmp    slow,    {fast
       seq.i  qb+qs*7, qb+qs*7+qd
       jmp    slow,    }tab
       seq.i  qb+qs*11,qb+qs*11+qd
       jmp    slow,    <tab
       seq.i  qb+qs*5, qb+qs*5+qd
       jmp    slow,    }qb+qs*5+qd/2
       seq.i  qb+qs*24,qb+qs*24+qd
       jmp    slow,    >tab
       seq.i  qb+qs*4, qb+qs*4+qd
       jmp    >fast,   }qb+qs*4+qd/2
       seq.i  qb+qs*10,qb+qs*10+qd
       jmp    >fast,   <tab
       seq.i  qb+qs*23,qb+qs*23+qd
       jmp    >fast,   >tab
       seq.i  qb+qs*6, qb+qs*6+qd
       jmp    slow,    {tab
       seq.i  qb+qs*12,qb+qs*12+qd
       djn.f  slow,    tab


       seq.i  qb+qs*28,qb+qs*28+qd
       jmp    tab,     >tab
       seq.i  qb+qs*9, qb+qs*9+qd
       jmp    tab,     }qb+qs*9+qd/2
       seq.i  qb+qs*20,qb+qs*20+qd
       djn.f  <fast,   tab
       seq.i  qb+qs*8, qb+qs*8+qd
       jmp    <fast,   }qb+qs*8+qd/2
       seq.i  qb+qs*21,qb+qs*21+qd
       jmp    tab,     {fast
       seq.i  qb+qs*15,qb+qs*15+qd
       jmp    tab,     <tab
       seq.i  qb+qs*27,qb+qs*27+qd
       jmp    <fast,   >tab
       seq.i  qb+qs*16,qb+qs*16+qd
       jmp    tab,     {tab
       seq.i  qb+qs*22,qb+qs*22+qd
       djn.f  tab,     tab
       seq.i  qb+qs*30,qb+qs*30+qd
       jmp    tab,     }tab

fixed2:spl    1,       }qb+qs*31
       spl    1,       }qb+qs*32
       spl    1,       }qb+qs*33
silk2a:spl    @0,      <131
       mov.i  }silk2a, >silk2a
silk2b:spl    @0,      }7502
       mov.i  }silk2b, >silk2b
silk2c:spl    @0,      }2430
       mov.i  }silk2c, >silk2c
       mov.i  #3555,   }-3190
       mov.i  #1832,   }1398
       mov.i  #-2840,  }570

       dat    }1,      >1
       dat    }1,      >1
qincr  dat    }-gap,   >2*gap

bmber2:add.ba fnd,     fnd
loop2: mov.i  qincr,   *fnd     ; primary bomber
       mov.i  qincr,   @fnd     ; .66c, bi-directional
fnd:   mov.i  2*-gap,  }qb
       add    qincr,   fnd
       djn    loop2,   #rep2
       jmp    fixed2,  >flag    ; set flag
       end

