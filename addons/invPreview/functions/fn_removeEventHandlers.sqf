// KIV_fnc_removeEventHandlers
// Removes eventhandlers from a unit

params ["_unit"];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

// Remove existing handlers if present
private _invOpened = _unit getVariable ["KIV_EH_preview_invOpened", -1];
if (_invOpened >= 0) then {
    _unit removeEventHandler ["InventoryOpened", _invOpened];
    _unit setVariable ["KIV_EH_preview_invOpened", nil];
};

private _invClosed = _unit getVariable ["KIV_EH_preview_invClosed", -1];
if (_invClosed >= 0) then {
    _unit removeEventHandler ["InventoryClosed", _invClosed];
    _unit setVariable ["KIV_EH_preview_invClosed", nil];
};

private _take = _unit getVariable ["KIV_EH_preview_take", -1];
if (_take >= 0) then {
    _unit removeEventHandler ["Take", _take];
    _unit setVariable ["KIV_EH_preview_take", nil];
};

private _put = _unit getVariable ["KIV_EH_preview_put", -1];
if (_put >= 0) then {
    _unit removeEventHandler ["Put", _put];
    _unit setVariable ["KIV_EH_preview_put", nil];
};

private _killed = _unit getVariable ["KIV_EH_preview_killed", -1];
if (_killed >= 0) then {
    _unit removeEventHandler ["Killed", _killed];
    _unit setVariable ["KIV_EH_preview_killed", nil];
};

private _weaponChanged = _unit getVariable ["KIV_EH_preview_weaponChanged", -1];
if (_weaponChanged >= 0) then {
    _unit removeEventHandler ["Killed", _weaponChanged];
    _unit setVariable ["KIV_EH_preview_weaponChanged", nil];
};

private _dammaged = _unit getVariable ["KIV_EH_preview_dammaged", -1];
if (_dammaged != -1) then {
    _unit removeEventHandler ["Dammaged", _dammaged];
    _unit setVariable ["KIV_EH_preview_dammaged", nil];
};
