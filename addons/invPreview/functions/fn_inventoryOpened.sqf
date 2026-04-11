// KIV_fnc_inventoryOpened
// Handles inventory opened event, creates the preview after display is ready

if (!canSuspend) exitWith {
    _this spawn KIV_fnc_inventoryOpened;
};
params ["_unit", "_container"];

if (_unit != player) exitWith {};

// Prevent rapid double opening
if (_unit getVariable ["KIV_openingInv", false]) exitWith {};
_unit setVariable ["KIV_openingInv", true];

private _timeOut = time + 3;
waitUntil {!isNull (findDisplay 602) || time > _timeOut};
sleep 0.1;
if (isNull (findDisplay 602)) exitWith {};

[] call KIV_fnc_create;
