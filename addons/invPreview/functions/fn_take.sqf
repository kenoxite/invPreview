// KIV_fnc_take
// Handles Take event, updates clone loadout and stance when item is taken

if (isNull (findDisplay 602)) exitWith {};
params ["_unit", "_container", "_item"];
if (_unit != player) exitWith {};
call KIV_fnc_updateCloneLoadout;
call KIV_fnc_stance;
