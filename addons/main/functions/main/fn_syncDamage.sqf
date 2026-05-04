// KIV_fnc_syncDamage
// Copies damage state from source unit to preview unit

if (isNil "KIV_unit") exitWith {};

private _player = KTWK_player;
KIV_unit setDamage (damage _player);

private _hitPoints = getAllHitPointsDamage _player;
if (!isNil "_hitPoints") then {
    _hitPoints params ["", "_selections", "_damages"];
    {
        KIV_unit setHit [_x, _damages # _forEachIndex];
    } forEach _selections;
};
