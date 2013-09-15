;redcode-94
;name Standing on Giants
;author Robert Hale
;assert CORESIZE == 8000
;strategy  round #6
;strategy  A one shot scanner based heavily on one shot
;strategy  by Philip Kendall 
;strategy  okay it is one shot with a few tweaks
;strategy
;strategy  "If I have seen so far it is because I have stood on 
;strategy  the shoulders of giants"  Isaac Asimov
;strategy  
;optimax clr

step    equ     24
sep     equ     12
stream  equ     (ptr-412)

scan1   equ     (inc+step)
imp     equ     2667
cstart  equ     (last+2-ptr)

ptr     dat.f   bomb1,#0        

;changing the bomb from dat.f   <imp,<(2*imp)
;to dat.f   <imp,<(2*imp) gained 10 points on the average

bomb3   dat.f   <imp,<(2*imp)
inc     dat.f   step,step
bomb2   spl.a   #(bomb3-ptr),cstart
loop    add.f   inc,scan
scan    sne.i   scan1+100,scan1+sep+100
        djn.f   loop,<stream
        mov.ab  scan,ptr
bomb1   spl.a   #(bomb2-ptr),cstart
clear   mov.i   *ptr,>ptr
        mov.i   *ptr,>ptr

; two movs worked better than 1, 3, or 4
last    djn.f   clear,<stream

bdist   equ     1500

for 1
;this boot routine does better then the other why?

boot
i       for     (last-ptr+1)
        mov.i   (ptr+i-1),>bptr
        rof
        spl.a   *bptr,>-1000
        div.f   bptr,bptr
bptr    dat.f   (scan+bdist),(ptr+bdist) 
rof

for 0
;this boot routine does not do better why?

boot	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr

	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr

	  spl.a   @bptr, >-1000
	  mov.i   }bptr, >bptr

	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr

	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr
	  mov.i   }bptr, >bptr

        div.f   bptr,bptr
bptr    dat.f   ptr, bdist
rof

;large decoy
;the decoy seemed to work better then a qscan
i	  for     MAXLENGTH-CURLINE
        spl	    #i*2, <i
	  rof

	  end     boot
