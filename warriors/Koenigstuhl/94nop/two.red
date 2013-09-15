;redcode-94nop
;name  2
;author Chris Stubbs
;strategy I don't know
;assert CORESIZE == 8000
       SPL.B  $     1, <   400
       SPL.B  @     0, }  3620
       SPL.B  $     1, <   400
       SPL.B  @     0, }  3620
       MOV.I  }    -1, >    -1
       MOV.I  $     8, >   113
       SPL.B  @     0, }  1270
       MOV.I  }    -1, >    -1
       MOV.I  $     3, >    -6
       SPL.B  $     1, <   400
       SPL.B  @     0, }  3620
       MOV.I  }    -1, >    -1
       MOV.I  $     8, >   113
       SPL.B  $     1, <   400
       SPL.B  @     0, }  3620
       MOV.I  }    -1, >    -1
       SPL.B  @     0, }  1270
       DJN.B  $     0, <     2
       JMP.B  $    -2, $     0
       MOV.I  }    -1, >    -1
       MOV.I  $     8, >   113
       SPL.B  @     0, }  1270

end
