#include "macros.hpp"

SERVER_ONLY;

params ["_gun"];

if (_gun isEqualType []) then {_gun = _gun#0};

if (count (crew _gun) < 1) exitWith {};

if (count (crew _gun) > 1) then {_gun deleteVehicleCrew commander _gun;};

private _sleep = (random [30, 45, 90]);

if (missionNamespace getVariable ["dday_var_flakdisabled", false]) exitWith {[f_fnc_artyfire, [_gun], _sleep] call CBA_fnc_waitAndExecute;};

_gunner = gunner _gun;

group _gunner setBehaviourStrong "CARELESS";

private _tgt = _gun modelToWorld [(random [-15,0,15]), 45,30];

_gunner lookAt _tgt;

_gunner removeAllEventHandlers "FiredMan";

_gunner addEventHandler ["FiredMan",

{params ["_unit", "", "", "", "", "", "_projectile", ""];  

[
	{deleteVehicle (_this#0); },
	[_projectile],
	10
] call CBA_fnc_waitAndExecute;

}]; //remove the arty shell after a certain amount of time, its delayed for immersion reasons

_gunner removeAllEventHandlers "Suppressed";

_gunner addEventHandler ["Suppressed", {
	params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
	group _unit setBehaviourStrong "COMBAT";
}];

[
	{[_this#0] call zen_common_fnc_fireWeapon;},
	[_gunner],
	(15 - (random 5))
] call CBA_fnc_waitAndExecute;

_gun setVehicleAmmo 1;



[f_fnc_artyfire, [_gun], _sleep] call CBA_fnc_waitAndExecute;