// KIV_fnc_inventoryClosed
// Handles inventory closed event, cleans up the preview

params ["_unit", "_container"];
if (_unit != player) exitWith {};
call KIV_fnc_cleanup;
