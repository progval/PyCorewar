;redcode-nano
;name Zip-warrior
;author Neo
;assert CORESIZE==80
;strategy Self-expanding clear
;better than Booing

head:   spl #2,    5
        mov }head, >head
        mov } 14,  <-30
        mov } 22,  <-12
        spl -2,    <-17
end head
