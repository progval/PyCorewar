;redcode
;author Simon Wainwright
;name Murky+15
;assert 1
;strategy try 2 bomb the bomber b4 it bombs us. bit of a risky strategy
;strategy but i thought i'd try a different approach 2 paper. besides
;strategy i've not done a silk b4. thanks 2 john 4 helping improve its
;strategy scores by about 15% with his suggestions & also 4 trying 2
;strategy convince me 2 at least pspace it with a paper. (i haven't :-)
 
  mov f  ,f+4000
  mov f+1,f+4001
  mov f+2,f+4002
 
  mov g-1,g+3999
  mov g  ,g+4000
  mov g+1,g+4001
  mov g+2,g+4002
  mov g+3,g+4003
 
  spl f+4000,<g+4001
 
f:spl  #0,<f-19
  mov g-1,<f-19
  djn.f g+2,<f-19
 
    for 16
      dat 0,0
    rof
 
  dat }g+2,}-3
 
g:add #2365,1
  mov <f-19,2368
  djn.f g,{f-19
 
  djn.f g,<f-19
  end

