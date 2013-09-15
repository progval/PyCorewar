;redcode-94x verbose
;name  Glasswalker V2.0
;author Paul Mumby
;strategy Curently testing only... expect it to suck :)
;strategy I am going to completely rebuild it later... :)
;strategy Silk based Paper, with included stone (anti-imp)
;strategy and a jmz scan too!
;assert   CORESIZE >= 8000 && MAXLENGTH >= 75

start           jmp     rep    
decoy1          for     22                      ;A decoy
                jmp     0,      <0              ;
                rof                             ;

rep             spl     1,      <600            ;\.
                mov     -1,     0               ; \Create 9 procs
                mov     -1,     0               ; /.
                mov     -1,     0               ;/.
silk            spl.a   @5,     155             ;Silk based Copy
                mov.i   }silk,  >silk           ;Silk based Copy
                add     #20,    silk             ;Increment Target
                add     #21,    startpaper       ;Increment Target (2)
                jmp     {silk,  <700            ;Loop/Reset

startpaper      jmp     1,      150             ;Paper marker/pointer
bootscan        spl     scan,   <750            ;Boot the scanner

bomber          add     #92,    btarget         ;Add to bomb target
                mov     bomb,   @btarget        ;BOMBS AWAY!
                jmp     bomber, <800            ;Restart

scan            add     #5,     starget         ;Increment target
                jmz     scan,   @starget        ;Scan
                mov     bomb,   @starget        ;Bomb if found
                jmp     scan,   <850            ;loop

decoy2          for     21                      ;Another decoy
                jmp     0,      <-1             ;
                rof                             ;

bomb            dat     <2667,  <5334           ;Bomb Data (anti-imp)
btarget         dat     #0,     #0              ;Bomb Target variable.
starget         dat     #0,     #0              ;Scan Target variable.
