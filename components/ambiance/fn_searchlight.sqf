#include "macros.hpp"

SERVER_ONLY;

params ["_light"];

if (_light isEqualType []) then {_light = _light#0};

if (count (crew _light) < 1) exitWith {};


private _sleep = (random [10, 30, 45]);


_lighter = gunner _light;

_lighter action ['SearchLightOn', _light];

private _tgt = [[[(getPos _light), (floor (random 45))+5]]] call BIS_fnc_randomPos;
_tgt set [2,(random [15,20,40])];

_lighter lookAt _tgt;


[f_fnc_searchlight, [_light], _sleep] call CBA_fnc_waitAndExecute;