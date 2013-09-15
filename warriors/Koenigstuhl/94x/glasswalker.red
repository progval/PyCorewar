;redcode-94x verbose
;name  Glasswalker
;author Paul Mumby
;strategy Unknown as of yet...
;assert   CORESIZE >= 10000 && MAXLENGTH >= 100

start           jmp     bootstrap               ;Marks beginning of program

bootstrap       spl     replicator              ;Launch the replicator
                spl     bomber                  ;Launch the bomber
                spl     rev_bomber              ;Launch the reverse bomber
                spl     wall                    ;Launch the defensive wall
                dat     #0                      ;end bootstrap

bomber          mov.i   @bombdat, @btarget      ;Bomb the target with a DAT
                add     bombinc, btarget        ;Increment target
                jmp     bomber                  ;Bomb next

rev_bomber      mov.i   @bombdat, @rbtarget     ;Bomb the target with a DAT
                add     revbinc, rbtarget       ;Increment target
                jmp     rev_bomber              ;Bomb next

wall            spl     bwall1                  ;Start the first back wall
                spl     bwall2                  ;Start the second back wall
                spl     fwall1                  ;Start the first front wall
                spl     fwall2                  ;Start the second front wall
                dat     #0

bwall1          mov.i   @bombdat, @bwtarget1    ;Fire a bomb into the wall
                add     #4,      bwtarget1      ;Add 4 to target (for stagger)
                add     #1,      bwcnt1         ;Increment counter
                cmp     bwcnt1,  3              ;Is this 3rd shot?
                jmp     bwallreset1             ;Yes? then reset wall
                jmp     bwall1                  ;No? then continue
bwallreset1     mov     #start-16, bwtarget1    ;Reset wall start target
                mov     #0,      bwcnt1         ;Reset counter
                jmp     bwall1                  ;Continue

bwall2          mov.i   @bombdat, @bwtarget2    ;This wall same as above, but
                sub     #4,      bwtarget2      ;it is staggered, and in 
                add     #1,      bwcnt2         ;the opposite direction.
                cmp     bwcnt2,  3              ;
                jmp     bwallreset2             ;
                jmp     bwall2                  ;
bwallreset2     mov     #start-12, bwtarget2    ;
                mov     #0,      bwcnt2         ;
                jmp     bwall2                  ;

fwall1          mov.i   @bombdat, @fwtarget1    ;Same as first, but on other
                sub     #4,      fwtarget1      ;end of program
                add     #1,      fwcnt1         ;
                cmp     fwcnt1,  3              ;
                jmp     fwallreset1             ;
                jmp     fwall1                  ;
fwallreset1     mov     #endcode+16, fwtarget1  ;
                mov     #0,      fwcnt1         ;
                jmp     fwall1                  ;

fwall2          mov.i   @bombdat, @fwtarget2    ;Same as second but on other
                add     #4,      fwtarget2      ;end of program
                add     #1,      fwcnt2         ;
                cmp     fwcnt2,  3              ;
                jmp     fwallreset2             ;
                jmp     fwall2                  ;
fwallreset2     mov     #endcode+12, fwtarget2  ;
                mov     #0,      fwcnt2         ;
                jmp     fwall2                  ;
                                                
replicator      mov     endcode,     target     ;
                add     toffset, target         ;Find target
                mov     endcode,     length     ;
                sub     start,   length         ;Find Length of program
                mov     start,   source         ;Find source location
copy            mov.i   @source,  @target       ;Copy 1 opcode
                add     #1,      source         ;Increment source
                add     #1,      target         ;Increment Target
                cmp     source,  endcode        ;Are we done?
                jmp     spawn                   ;Yes? then spawn it
                jmp     copy                    ;No? then continue
spawn           spl     target-length           ;Spawn new daughter
                add     #1000,    toffset       ;Increment to next target
                jmp     replicator              ;Restart the replicator

source          equ     0
target          equ     0
length          equ     0
toffset         equ     1000
bombinc         equ     100
revbinc         equ     250
btarget         equ     5000
rbtarget        equ     -5000
bwtarget1       equ     start-16
bwcnt1          equ     0
bwtarget2       equ     start-12
bwcnt2          equ     0
fwtarget1       equ     endcode+16
fwcnt1          equ     0
fwtarget2       equ     endcode+12
fwcnt2          equ     0
bombdat         dat     0
endcode         end     start                   ;Marks end of code
