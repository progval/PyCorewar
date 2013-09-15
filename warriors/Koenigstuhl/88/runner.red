;redcode
;name runner
;KOTH.1  experimental
;author Campbell Fraser
;assert 1
;
;strategy +--------------------------------------------------------------------+
;strategy | Run through memory throwing 'dat' infront and leaving 'dat' behind.|
;strategy | This strategy is no use when no addressing range restriction exists|
;strategy +--------------------------------------------------------------------+

start    spl 1
         jmp 2
         dat #0, #0
         mov Here, Here+5
         mov There, There+5
         mov <Here, <There
         mov <Here, <There
         mov <Here, <There
         dat #0, #0
         dat #0, #0
         dat #0, #0
         dat #0, #0
         dat #0, #0
Here     dat #-5
There    dat #-1
         end start
