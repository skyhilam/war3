#ifndef DYCultramsoffIncluded
#define DYCultramsoffIncluded

#include "DYCbase.j"

library DYCultramsoff requires DYCbase

function DYCultramsoff takes unit u returns nothing
    local integer hd=GetHandleId(u)
    call SaveInteger(UDGht,hd,StringHash("ultramsj"),0)
    set u=null
endfunction

endlibrary

 

#endif /// DYCultramsoff