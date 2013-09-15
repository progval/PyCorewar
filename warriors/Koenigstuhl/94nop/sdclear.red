;redcode-94
;name S/D Clear
;author David Moore
;assert 1

org start

gate  spl   #-1,  100
s     dat    -1,    7
start mov    *s, >gate
      djn.a  -1,  gate
      djn.a  -2, }s

end

