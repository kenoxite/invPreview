// KIV_fnc_syncDamage
// Copies damage state from source unit to preview unit

if (isNil "KIV_unit") exitWith {};

KIV_unit setDamage (damage player);

private _hitPoints = getAllHitPointsDamage player;
if (!isNil "_hitPoints") then {
    _hitPoints params ["", "_selections", "_damages"];
    {
        KIV_unit setHit [_x, _damages # _forEachIndex];
    } forEach _selections;
};
