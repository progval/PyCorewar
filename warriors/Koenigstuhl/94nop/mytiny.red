;redcode-94
;name myTiny
;author Paulsson
;strategy Carpet bomber, 11'th try.
;strategy Have you ever seen a mod 8 carpet bomber with
;strategy spl/dat coreclear in 8 bytes?
;strategy To bad it get's stuck on decoys and djn strams :-(
;strategy and it's own bombs :-(
;strategy Submitted: 5 November 95     
;assert CORESIZE > 1

org st

st              add.a   #8*3,*b1
                jmz.f   st,*ptr
ptr             mov.ab  #-1,1
                spl             st,0
clear           mov.i   @st,>ptr+1
                jmn.f   clear,@ptr+1
                dat.f   <2667,6
b1              spl             #ptr,6
