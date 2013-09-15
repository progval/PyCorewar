;redcode-94t
;name Tiny Spiral
;author Franz
;strategy Good old spiral for the baby hill
;assert CORESIZE==800
step equ 267
launch  SPL 8,          }27
	SPL 4,          }27*2
	SPL 2,          }27*3
	JMP imp,        }27*4
	JMP imp+step,   }27*5
	SPL 2,          }27*6
	JMP imp+(step*2),}27*7
	JMP imp+(step*3),}27*8
	SPL 4,          }27*9
	SPL 2,          }27*10
	JMP imp+(step*4),}27*11
	JMP imp+(step*5),}27*12
	SPL 2,          }27*13
	JMP imp+(step*6),}27*14
	JMP imp+(step*7),}27*15
imp     MOV.I #step,*0
end launch
