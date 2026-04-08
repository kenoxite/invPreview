// KIV_fnc_syncDamage
// Copies damage state from source unit to preview unit

if (isNil "KIV_preview_unit") exitWith {};

private _damage = damage player;
KIV_preview_unit setDamage _damage;

private _hitPoints = getAllHitPointsDamage player;
if (!isNil "_hitPoints") then {
    _hitPoints params ["", "_selections", "_damages"];
    {
        KIV_preview_unit setHit [_x, _damages # _forEachIndex];
    } forEach _selections;
};
