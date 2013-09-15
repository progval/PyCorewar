;redcode-94nop
;name Willow
;author John Metcalf
;strategy .66c scan, decoy
;assert CORESIZE==8000

ptr: dat   4067,     55

     dat   1,        1
     dat   1,        1
     dat   1,        1

     dat   >0,       0
sb:  spl   #0,       {0
wipe:mov   *sb,      <ptr
     mov   >ptr,     >ptr
     jmn.f wipe,     >ptr
scan:sub.f #-13,     ptr
     jmn.f hit,      @ptr
     jmz.f scan,     *ptr
     mov.x @scan,    @scan
hit: slt.b @scan,    #last+4-ptr
     jmp   wipe,     <ptr
     djn   scan,     #9
last:jmp   scan,     {wipe


boot:mov   ptr,      -3860+ptr
bptr:mov   last,     -3860+last
     for   6
     mov   {bptr,    <bptr
     rof
     spl   @bptr
     for   6
     mov   {bptr,    <bptr
     rof
     dat   1,        1
     for   (MAXLENGTH-CURLINE)/3
     spl   1,        <1
     spl   #1,       }1
     spl   #1,       >1
     rof

     end   boot
