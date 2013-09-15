;redcode
;name Fleas2
;author Kevin Whyte
;<kwhyte@zaphod.uchicago.edu>
;assert 1
start mov <-1,<-1
      jmp start,<-2
begin mov start+1,@target
      mov start,<target
      spl @target,0
      add #199,target
      djn begin,count
      spl start,0
count dat #0,#39
target dat #0,#200
       end begin
;strategy Split all over, bomb core.  That's all.
