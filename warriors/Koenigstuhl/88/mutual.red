;redcode
;name Mutual-repairing
;author P. Kline
;strategy Mutual-repairing pair. 
;assert CORESIZE==8000

spacing  equ 4000 

start    mov start-2,datzero
         mov #endme-brother+1+spacing,brother
         mov #enddum-dummy+1,dummy         
         mov #enddum-alive+1+spacing,alive
         mov #endme-meptr,meptr
copy1    mov @meptr,<brother
         mov @meptr,<dummy
         mov @meptr,<alive
         djn copy1,meptr
         spl chaffmov
         mov datzero,dead1+spacing
         mov datzero,dead2+spacing
         mov datzero,dead3+spacing
         mov datzero,dead4+spacing
         mov datzero,dead5+spacing
         mov datzero,dead1
         mov datzero,dead2
         mov datzero,dead3
         mov datzero,dead4
         mov datzero,dead5
         jmp restart
chaff1   dat #start-50
chaff2   dat #enddum+22
ferret   dat #0
sniff    dat #0
alive    dat #0
brother  dat #0
dummy    dat #0
meptr    dat #0
                   ;  everything from here is protected by brother
chaffmov mov chaff,@chaff1
         mov chaff,<chaff1
         add #3951,chaff1
         slt #enddum+endme,chaff1
         mov #chaff1,chaff1
         jmp chaffmov
chaff    dat #-30,#-30
datzero  dat #0
plug     mov 0,<0
restart  cmp #4321,alive+spacing   ;  is brother alive?
resrect  spl restart+spacing       ;     no
imalive  mov #4321,alive           ;  i'm alive
         mov #12,alive+spacing     ;  tell brother he's dead
         mov datzero,dead1+spacing
         mov datzero,dead2+spacing
         mov datzero,dead3+spacing
         mov datzero,dead4+spacing
         mov datzero,dead5+spacing
         jmp newcheck
dead1    dat #0
newcheck mov #endme-brother+spacing+1,brother
         mov #enddum-dummy+1,dummy
         mov #endme-meptr,meptr
checkem  mov #4321,alive        ;  i'm still alive
         cmp <brother,<dummy    ;  are brother and dummy in sync?
         jmp action             ;     no
recheck  djn checkem,meptr
         jmp restart
dead2    dat #0
action   cmp @meptr,@brother    ;  is brother ok?
         jmp fixbro             ;     no
fixdum   mov @dummy,sniff       ;     dummy is bad
         mov dummy,ferret
         add #dummy-ferret,ferret
         jmp hunter
dead3    dat #0
fixbro   mov @brother,sniff
         mov plug,@brother      ;  plug any splzero's
         mov #meptr-30-15,brother+spacing  ;  put brother on hold
         mov #meptr-30-16,dummy+spacing
         mov brother,ferret
         add #brother-ferret,ferret
hunter   mov @meptr,@ferret     ;  repair damage
         jmz recheck,sniff      ;  if zero, continue checking
         jmp tracking
dead4    dat #0
tracking add sniff,ferret
         mov @ferret,sniff
         mov datzero,@ferret
         jmn tracking,sniff
         slt #enddum,ferret
         jmp recheck
         slt #meptr+spacing,ferret
         jmp kill
         slt #enddum+spacing,ferret
         jmp recheck
         jmp kill
dead5    dat #0
kill     mov datzero,<ferret
         add #2,ferret
         mov datzero,<ferret
         mov datzero,<ferret
         mov datzero,<ferret
         mov datzero,<ferret
         add #19,ferret
         mov datzero,<ferret
         mov datzero,<ferret
         mov datzero,<ferret
         mov datzero,<ferret
         jmp recheck
endme    dat #0
enddum   equ (endme-meptr+endme+15)
end      start
