// KIV_fnc_inventoryOpened
// Handles inventory opened event, creates the preview after display is ready

if (!canSuspend) exitWith {
    _this spawn KIV_fnc_inventoryOpened;
};
params ["_unit", "_container"];

if (_unit != player) exitWith {};

private _timeOut = time + 3;
waitUntil {!isNull (findDisplay 602) || time > _timeOut};
if (isNull (findDisplay 602)) exitWith {};

call KIV_fnc_create;
