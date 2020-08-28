function Trig_pick_for_A_Func003C takes nothing returns boolean
    if  GetTriggerUnit() == gg_unit_hvlt_0095 then
        return true
    endif
    if  GetTriggerUnit() == gg_unit_hvlt_0096 then
        return true
    endif
    if  GetTriggerUnit() == gg_unit_hvlt_0097 then
        return true
    endif
    if  GetTriggerUnit() == gg_unit_hvlt_0098 then
        return true
    endif
    if  GetTriggerUnit() == gg_unit_hvlt_0144 then
        return true
    endif
    return false
endfunction

function Trig_pick_for_A_Conditions takes nothing returns boolean
    if ( not ( GetTriggerPlayer() == GetOwningPlayer(GetTriggerUnit()) ) ) then
        return false
    endif
    if ( not Trig_pick_for_A_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_pick_for_A_Func001C takes nothing returns boolean
    if ( not ( udg_pick[GetConvertedPlayerId(GetTriggerPlayer())] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_pick_for_A_Actions takes nothing returns nothing
local integer i = 	GetPlayerId(GetTriggerPlayer()) + 1
    if udg_pick[i] then
		if GetLocalPlayer() == GetTriggerPlayer() then
	        // Use only local code (no net traffic) within this block to avoid desyncs.
	        call ClearSelection()
	        call SelectUnit(udg_pick[i], true)
	    endif
    endif
endfunction

//===========================================================================
function InitTrig_pick_for_A takes nothing returns nothing
local integer i = 0
    set gg_trg_pick_for_A = CreateTrigger(  )
    	//註冊事件
	    loop
		    exitwhen i > 9
	    	call TriggerRegisterPlayerUnitEvent(gg_trg_pick_for_A, Player(i), EVENT_PLAYER_UNIT_SELECTED, null)
			set i = i + 1
		endloop

	call TriggerAddCondition( gg_trg_pick_for_A, Condition( function Trig_pick_for_A_Conditions ) )
	call TriggerAddAction( gg_trg_pick_for_A, function Trig_pick_for_A_Actions )

	//設定單位變數
		//旗子
		set udg_pick_slect[i] =



		//倉庫
		set udg_pick_unit[i]




endfunction


    set udg_A_common_HERO = gg_unit_hvlt_0017
    set udg_A_common_HERO = gg_unit_hvlt_0018
    set udg_A_common_HERO = gg_unit_hvlt_0019
    set udg_A_common_HERO = gg_unit_hvlt_0020
    set udg_A_common_HERO = gg_unit_hvlt_0021
    set udg_A_common_HERO = gg_unit_hvlt_0367
    set udg_A_common_HERO = gg_unit_hvlt_0368
    set udg_A_common_HERO = gg_unit_hvlt_0369
    set udg_A_common_HERO = gg_unit_hvlt_0370
    set udg_A_common_HERO = gg_unit_hvlt_0371








globals
unit array udg_pick_slect
unit array udg_pick_unit
endglobals
