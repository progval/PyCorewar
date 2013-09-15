;redcode-94x
;name Sniff
;author John Metcalf
;strategy .8c HSA scan
;assert CORESIZE==800

ptr: dat   367,      55

     dat   0,        0
     dat   >0,       0
sb:  spl   #0,       {0

wipe:mov   *sb,      <ptr
     mov   >ptr,     >ptr
     jmn.f wipe,     >ptr

scan:sub.x #-11,     ptr
     sne.f @ptr,     *ptr
     sub   scan,     @scan
     jmn.f hit,      @ptr
     jmz.f scan,     *ptr
     mov.x @scan,    @scan
hit: slt.b @scan,    #last+3-ptr
     jmp   wipe,     <ptr
     djn   scan,     #13
     jmp   scan,     {wipe
last:end   scan+1

