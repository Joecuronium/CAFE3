#include "../../macros.hpp"

#define GET_ACTIVITY(FUNC) (missionNamespace getVariable FUNC)

#define ACTIVITY_SPECTATE "f_fnc_downtimeSpectate"
#define ACTIVITY_REMOTECONTROL "f_fnc_downtimeControl"
#define ACTIVITY_NOTHING "f_fnc_downtimeDoNothing"
#define ACTIVITY_SELECTOR "f_fnc_downtimeActivitySelector"

#define RESPAWN_ALWAYS "respawnAlways"
#define RESPAWN_CONSENTFIRST "respawnWithConsent"

#define DOWNTIME_WAIT_TIME 10
#define DOWNTIME_CONTROL_SIDES [independent, east]

#define IS_UNCONSCIOUS(UNIT)        (UNIT getVariable ["ACE_isUnconscious", false])
#define PLAYER_IS_AWAITING_RESPAWN  (missionNamespace getVariable ["f_var_playerHasBeenKilled", false])
#define PLAYER_IS_DOWN              (IS_UNCONSCIOUS(player) or {!alive player} or {PLAYER_IS_AWAITING_RESPAWN})
#define PLAYER_IS_GHOST             (PLAYER_IS_AWAITING_RESPAWN and {alive player})
#define UNIT_IS_ACTIVE(UNIT)        (!(IS_UNCONSCIOUS(UNIT) or {UNIT getVariable ["f_var_awaitingRespawn", false]}))

#define CLOSE_DOWNTIME_BUTTON _dtButton = findDisplay 12343; if !(isNull _dtButton) then {_dtButton closeDisplay 2;};

#define FADE_OUT "DowntimeFade" cutText ["", "BLACK OUT", 0.3, false];
#define FADE_OUT_WAIT uiSleep 0.3;
#define FADE_IN "DowntimeFade" cutFadeOut 1;
#define FADE_IN_WAIT uiSleep 1;

#define RUNNING_ACTIVITY f_var_runningDowntimeActivity
