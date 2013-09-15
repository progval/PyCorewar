;redcode
;name Creep
;author B. Cook
; <bpc25@cam.ac.uk>
;strategy 1.5c linear scan/clear
;assert 1

org start

start add.f #1, 1
 sne.f >1, >1
 jmz.f -1, >1
 spl *-1, 1
 mov.i 1, <-1

end
