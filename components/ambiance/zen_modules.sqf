#include "macros.hpp"

#ifdef ENABLE_AMBIANCE_SCRIPTS

call
{
        private _toggle = { 
                        if (missionNamespace getVariable ["f_var_flakdisabled", false]) then {
                                ["Ambient scripts enabled."] call zen_common_fnc_showMessage;
                                missionNamespace setVariable ["f_var_flakdisabled", false, true]
                        } else {
                                 ["Ambient scripts disabled."] call zen_common_fnc_showMessage;
                                missionNamespace setVariable ["f_var_flakdisabled", true, true]
                                };
    };

    [
        "[CAFE3 Ambiance]",
        "Toggle ambient scripts",
        _flak

    ] call zen_custom_modules_fnc_register;
    private _flak = { 
                        if (isNull (_this#1)) then {
                                 ["No object selected."] call zen_common_fnc_showMessage;
                        } else {
                                 [_this#1] remoteExecCall ["f_fnc_flakfire", 2];
                                };
    };

    [
        "[CAFE3 Ambiance]",
        "Ambient AAA",
        _flak

    ] call zen_custom_modules_fnc_register;

    private _arty = { 
                        if (isNull (_this#1)) then {
                                 ["No object selected."] call zen_common_fnc_showMessage;
                        } else {
                                 [_this#1] remoteExecCall ["f_fnc_artyfire", 2];
                                };
    };

    [
        "[CAFE3 Ambiance]",
        "Ambient Artillery",
        _arty

    ] call zen_custom_modules_fnc_register;

     private _light = { 
                        if (isNull (_this#1)) then {
                                 ["No object selected."] call zen_common_fnc_showMessage;
                        } else {
                                 [_this#1] remoteExecCall ["f_fnc_searchlight", 2];
                                };
    };

    [
        "[CAFE3 Ambiance]",
        "Ambient Searchlight",
        _light

    ] call zen_custom_modules_fnc_register;

};

#endif