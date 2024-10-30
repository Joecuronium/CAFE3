#include "macros.hpp"

SERVER_ONLY;

params ["_gun"];

if (_gun isEqualType []) then {_gun = _gun#0}; //check if gun is gun

if (count (crew _gun) < 1) exitWith {}; //exit if gun is uncrewed

if (count (crew _gun) > 1) then {_gun deleteVehicleCrew commander _gun;}; //delete commander, he causes issues

private _sleep = (random [30, 45, 90]);

if (missionNamespace getVariable ["f_var_flakdisabled", false]) exitWith {[f_fnc_flakfire, [_gun], _sleep] call CBA_fnc_waitAndExecute;}; //allow temporary suspension

_gunner = gunner _gun;

[(group _gunner)] call f_fnc_disableAdvancedAI; //force disable Lambs AI

_gunner disableAI "TARGET"; //try to stop the gunner from targeting units

//the following lines are to keep the gunner in the gun unless ahot at. AI in combat will dismount

group _gunner setBehaviourStrong "CARELESS";

_gunner removeAllEventHandlers "Suppressed";

_gunner addEventHandler ["Suppressed", {
	params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
	group _unit setBehaviourStrong "COMBAT";
	_unit enableAI "TARGET";
}];

//have the gun look randomly in the air and fire bursts
private _tgt = [[[(getPos _gun), floor (random 45)]]] call BIS_fnc_randomPos;
_tgt set [2,25];
_gunner lookAt  _tgt;

_tgt = AGLToASL _tgt;

_gunner doSuppressiveFire _tgt;

_gun setVehicleAmmo 1; //stop the gun from running out of ammo

[f_fnc_flakfire, [_gun], _sleep] call CBA_fnc_waitAndExecute; //rinse and repeat


/*depreciated code, left here in case its ever needed as fallback
[_gunner, _tgt, random [5,15,30], random [1,4,4]] call zen_ai_fnc_suppressiveFire;

[{_this#0 setUnitCombatMode "BLUE";}, [_gunner], 20] call CBA_fnc_waitAndExecute;*/

