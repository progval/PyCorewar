;redcode
;name      Terminator716
;author    Aleksey A. Baulin
;(skull@nedra.yaroslavl.su)
;standard  CWS'88
;assert CORESIZE==8000

;strategy  1) The start unit sends around instructions to jump to
;             the snare.
;          2) The main unit throws at core quite a dense net in
;             order to capture opponent's tasks.
;          3) Opponent's tasks being caughted with the net rush
;             to the snare or die.
;          4) Tasks that reach the snare clean the core up with
;             DAT-bombs and destruct themselves.



STEP    equ   (0-716)
STEP2   equ   (2*STEP)
STEP4   equ   (2*STEP2)


ptr     jmp   -3662,      16
   	jmp   -798
   	jmp   2066
   	jmp   -3070
   	jmp   -206
   	jmp   2658
   	jmp   -2478
   	jmp   386
   	jmp   3250
   	jmp   -1886
   	jmp   978
   	jmp   3842
   	jmp   -1294
   	jmp   1570
   	jmp   -3566
   	jmp   -702

m0   	mov   jmp0,      <t0
t0   	mov   <ptr,      <m1+3-STEP-STEP2+1
   	sub   #STEP4-2,   @1
   	djn   m0,      <t0

   	jmp   m1

jmp0   	jmp   STEP2,      STEP2+1

   	dat   #0
   	dat   #0
   	dat   #0

start   spl   m0

st0   	spl   1,      stinger+2

   	mov   <st0,      <m1+3-STEP2
   	djn   @m1+3-STEP2,   <m1+6-STEP2

   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0

stinger mov   <stinger+3,      <stinger+2-STEP2
   	djn   @stinger+2-STEP2,   <stinger+5-STEP2

   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0


m1   	mov   jmp1,      <t
t   	mov   <m1+3+1,   <m1+3+STEP+1
   	add   modi,      @1
   	djn   m1,      <t

   	jmp   m1,      jmp2+1

modi   	dat   #STEP2,      #STEP2+2
jmp1   	jmp   1528,      <STEP+1 ; MOD(-STEP2*29,8000)=1528

jmp2   	jmp   0-STEP,      @0

   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0
   	dat   #0

dat_bomb dat   #0

   	dat   #0

   	mov   dat_bomb,   <m1-11
trap   	spl   -1
   	jmp   -2

   	end   start
