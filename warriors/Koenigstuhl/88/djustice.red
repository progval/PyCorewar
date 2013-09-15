;redcode verbose
;name Digital Justice
;author Jukka Laajarinne
;assert 1
vah    dat #23,   #23
gotcha slt #26,   reg         
lipas  jmp scan,  #5          
       slt #-11,  reg         
kuti   jmp kill,  #18         
scan   sub vah,   reg
reg    cmp -800,  -790
       jmp gotcha
       jmp scan
kill   mov #18,   kuti
       add #4,    reg
shoot  mov ammo,  <reg
       djn shoot, kuti
       add #14,   reg
       djn scan,  lipas
       mov ammo+1,ammo
       jmp scan
ammo   spl -1, -1
end    scan
