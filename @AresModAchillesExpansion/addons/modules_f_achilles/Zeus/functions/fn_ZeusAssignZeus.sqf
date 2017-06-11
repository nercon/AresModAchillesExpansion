/*
	Author: CreepPork_LV, Kex

	Description:
	 Sets a unit to be a Curator.

  Parameters:
    _this select: 0 - OBJECT - Object that the module was placed upon

  Returns:
    Nothing
*/

#include "\achilles\modules_f_ares\module_header.hpp"

_object = [_logic, false] call Ares_fnc_GetUnitUnderCursor;

if (isNull _object) exitWith {[localize "STR_NO_UNIT_SELECTED"] call Ares_fnc_ShowZeusMessage; playSound "FD_Start_F";};

if (_object getVariable ["isPromoted", false]) exitWith {[localize "STR_UNIT_IS_PROMOTED"] call Ares_fnc_ShowZeusMessage; playSound "FD_Start_F";};

if (!isPlayer _object) exitWith {[localize "STR_NO_PLAYER_SELECTED"] call Ares_fnc_ShowZeusMessage; playSound "FD_Start_F";};

_object setVariable ["isPromoted", true, true];

_curator_logic_group = group (getAssignedCuratorLogic player);

_objectPos = getPos _object;

_moderatorModule = _curator_logic_group createUnit ["ModuleCurator_F", _objectPos, [], 0, ""];

_object assignCurator _moderatorModule;

["You are now a Curator!"] remoteExec ["hint", _object];

#include "\achilles\modules_f_ares\module_footer.hpp"
