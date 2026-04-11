// KIV_fnc_inventoryClosed
// Handles inventory closed event, cleans up the preview

params ["_unit", "_container"];

if (_unit != player) exitWith {};

_unit setVariable ["KIV_openingInv", nil];
call KIV_fnc_cleanup;
