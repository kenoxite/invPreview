// KIV_fnc_addEventHandlers
// Adds eventhandlers to a unit

params ["_unit"];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

// Remove existing event handlers to avoid duplication
[_unit] call KIV_fnc_removeEventHandlers;   

// Add new handlers
private _invOpened = _unit addEventHandler ["InventoryOpened", KIV_fnc_inventoryOpened];
_unit setVariable ["KIV_EH_preview_invOpened", _invOpened];
private _invClosed = _unit addEventHandler ["InventoryClosed", KIV_fnc_inventoryClosed];
_unit setVariable ["KIV_EH_preview_invClosed", _invClosed];
private _take = _unit addEventHandler ["Take", KIV_fnc_take];
_unit setVariable ["KIV_EH_preview_take", _take];
private _put = _unit addEventHandler ["Put", KIV_fnc_put];
_unit setVariable ["KIV_EH_preview_put", _put];
private _killed = _unit addEventHandler ["Killed", KIV_fnc_cleanup];
_unit setVariable ["KIV_EH_preview_killed", _killed];
