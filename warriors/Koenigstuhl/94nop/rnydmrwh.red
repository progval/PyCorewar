;redcode-94nop
;name     rnydmrwh
;author   rcsim 1.0.6
; <foerster@a-city.de>
;contact  foerster@a-city.de
;url      http://home.a-city.de/stefan.foerster
;date     Sun Feb 11 02:27:42 2001
;version  26.131012
;strategy unknown
;strategy warrior created by evolution
;assert   (CORESIZE==8000) && (MAXLENGTH>=100)
              org    line0070
line0001      spl.b  <0033, {0039
line0002      spl.b  *0021, }0048
line0003      jmp.b  <7973, @0011
line0004      jmz.b  *7990,  0002
line0005      spl.b  {7980,  0019
line0006      mov.i  @7995, {7992
line0007      mov.i  *0046, <7957
line0008      dat.f   7982, *0048
line0009      dat.f   4281, *0033
line0010      jmp.b  {0045, >0022
line0011      jmp.b  #0039, @0026
line0012      mov.i  <7959,  7976
line0013      spl.b  @7986, @7983
line0014      spl.b   7974, *0022
line0015      spl.b  <0023, >7985
line0016      add.f  @7980, @0023
line0017      slt.ab *0019, }0047
line0018      spl.b  >7970, *7951
line0019      spl.b   7968,  7961
line0020      mul.a  *0021, {0036
line0021      jmn.b  *7988, #0034
line0022      jmp.b   7967, >0026
line0023      mov.b   0010,  7999
line0024      sne.ba <0040, *0015
line0025      slt.ab <7978, <7982
line0026      jmn.b   7956,  0022
line0027      spl.b  @0044, }7985
line0028      mov.b  <0044,  7957
line0029      seq.f  @6890, *0009
line0030      sne.ab *0043,  0008
line0031      spl.b   0046,  7964
line0032      seq.a  <0009,  7952
line0033      spl.b  @7975, #7976
line0034      jmz.b  *7974,  0034
line0035      spl.b  *7976, *7999
line0036      spl.b  {7989,  7968
line0037      seq.b  {7996, *7983
line0038      add.x  *0019, }7976
line0039      djn.b  @4182, #0045
line0040      mul.i  }0005, }0001
line0041      jmp.b  *0049, {7999
line0042      jmz.b  *7971, }0008
line0043      mov.x   0040, @0047
line0044      spl.b  {7958, @7969
line0045      jmz.b  @0045, }0039
line0046      sne.ba <0024,  0025
line0047      mov.ab @0005, *7979
line0048      sub.i  {7964, {7964
line0049      add.x  *6501,  7842
line0050      dat.f  *0018, }1994
line0051      jmp.b  *7954, >0038
line0052      mov.f  {0018, @7975
line0053      mov.b   0050,  0036
line0054      mov.f  }4620,  7991
line0055      spl.b  <7996, {0050
line0056      dat.f  @7952, {0027
line0057      mul.x  *3667, #0045
line0058      spl.b  }7971, >0048
line0059      sub.i  *7992, *7957
line0060      jmp.b  {7971, }0032
line0061      spl.b  >7963,  7991
line0062      mov.ba {0031, <7997
line0063      spl.b  #0009,  7991
line0064      spl.b  <7958, >7969
line0065      mov.ab  7963, {7996
line0066      jmp.b  #7984, <0000
line0067      djn.b   0008, @0010
line0068      spl.b  }0030, {4231
line0069      spl.b  }0016, *0039
line0070      add.f  {0015, }0016
line0071      mov.i  @0031, <3779
line0072      mov.ab }7992, @0010
line0073      mov.i   7998, *7981
line0074      mov.i   0000, @7976
line0075      spl.b  #7968, *7978
line0076      mov.i  {7952, >0042
line0077      spl.b   7998, <0008
line0078      djn.b  >7995, <0046
line0079      jmn.b   7960, >7955
line0080      spl.b  {0034, <0031
line0081      mov.i  >7993, *0018
line0082      dat.f   0035, @0023
line0083      dat.f   0010,  2606
line0084      djn.b  <0006,  4146
line0085      sne.f  *0045,  0047
line0086      mov.x  >7955, *0047
line0087      jmp.b  #7964, *0018
line0088      mod.i  }0046, <0049
line0089      mov.f  >7988, *4289
line0090      jmz.b  {0023, *0050
line0091      spl.b  *0026, }0009
line0092      mov.ab  0004,  7969
line0093      mov.i  *1454, *0026
line0094      add.ba {0049, >0040
line0095      seq.f   7978, >7980
line0096      spl.b  <7970, >2781
line0097      spl.b  @0023, <4920
line0098      jmp.b  >7961, *7961
line0099      spl.b  >7964, >7975
line0100      sne.ab  7991, <7956
              end
