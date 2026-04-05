// KIV_fnc_stance
// Determines and applies the appropriate stance animation based on equipped weapons

if (isNil "KIV_preview_unit") exitWith {};

private _hasPrimary = primaryWeapon player != "";
private _hasSecondary = secondaryWeapon player != "";
private _hasHandgun = handgunWeapon player != "";
private _stance = call {
    if (_hasPrimary) exitWith {"AidlPercMstpSlowWrflDnon_AI"};
    if (!_hasPrimary && {_hasHandgun}) exitWith {"AidlPercMstpSlowWpstDnon_AI"};
    if (_hasSecondary) exitWith {"AmovPercMstpSrasWlnrDnon_AmovPercMstpSlowWlnrDnon"};
    "AidlPercMstpSnonWnonDnon_AI"
};

KIV_preview_unit switchMove _stance;
