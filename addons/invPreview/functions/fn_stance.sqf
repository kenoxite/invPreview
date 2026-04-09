// KIV_fnc_stance
// Determines and applies the appropriate stance animation based on equipped weapons

if (isNil "KIV_unit") exitWith {};

private _current = currentWeapon player;

private _primary = primaryWeapon player;
private _hasPrimary = _primary != "";

private _secondary = secondaryWeapon player;
private _hasSecondary = _secondary != "";

private _handgun = handgunWeapon player;
private _hasHandgun = _handgun != "";

private _stance = call {
    if (_hasPrimary && {_current == _primary}) exitWith {"AidlPercMstpSlowWrflDnon_AI"};
    if (_hasHandgun && {_current == _handgun}) exitWith {"AidlPercMstpSlowWpstDnon_AI"};
    if (_hasSecondary && {_current == _secondary}) exitWith {"AmovPercMstpSrasWlnrDnon_AmovPercMstpSlowWlnrDnon"};
    "AidlPercMstpSnonWnonDnon_AI"
};

KIV_unit switchMove _stance;
