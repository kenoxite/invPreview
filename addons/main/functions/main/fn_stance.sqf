// KIV_fnc_stance
// Determines and applies the appropriate stance animation based on equipped weapons

if (isNil "KIV_unit") exitWith {};

private _player = KTWK_player;
private _current = currentWeapon _player;

private _primary = primaryWeapon _player;
private _hasPrimary = _primary != "";

private _secondary = secondaryWeapon _player;
private _hasSecondary = _secondary != "";

private _handgun = handgunWeapon _player;
private _hasHandgun = _handgun != "";

private _stance = call {
    if (_hasPrimary && {_current == _primary}) exitWith {"AidlPercMstpSlowWrflDnon_AI"};
    if (_hasHandgun && {_current == _handgun}) exitWith {"AidlPercMstpSlowWpstDnon_AI"};
    if (_hasSecondary && {_current == _secondary}) exitWith {"AmovPercMstpSlowWlnrDnon"};
    if (_current isKindOf ["Binocular", configFile >> "CfgWeapons"]) exitWith {"AmovPercMstpSoptWbinDnon"};
    "AidlPercMstpSnonWnonDnon_AI"
};

KIV_unit switchMove _stance;
