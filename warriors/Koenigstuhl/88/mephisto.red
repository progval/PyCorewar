;redcode
;name MEPHISTO
;author Marco Pontello
;markopo@mbox.vol.it
;assert CORESIZE==8000

Step    Equ     3197

A       Mov     <4095,<-1
B       Djn     -1,-2
Dest1   Dat     #-2048
Dest2   Dat     #(-2048-4096-1)
Start   Mov     B,@Dest1
	Mov     A,<Dest1
	Mov     B,@Dest2
	Mov     A,<Dest2
	Spl     @Dest1
	Spl     @Dest2
	Sub     #Step,Dest1
	Sub     #Step,Dest2
	Jmp     Start
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #0
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1
	Dat     #1

        END     Start

