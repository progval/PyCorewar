;redcode
;name my_first_try
;author Andreas Schamanek
;strategy spl
;assert 1
jmp 2                   ; ueberspringt das folgende dat
dat #0                  ; speichert an dieser Stelle die Zahl 0
add #17, -1             ; addiert (die Zahl) 17 zu Adresse -1 (s.u.)
spl @-2                 ; startet ein 2. Programm an der Stelle 17
jmp -2                  ; springt 2 Anweisungen zurueck
end                     ; markiert das Programmende
