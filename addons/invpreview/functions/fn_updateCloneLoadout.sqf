// KIV_fnc_updateCloneLoadout
// Updates the preview unit's loadout to match the player's current gear

if (isNil "KIV_unit") exitWith {};
KIV_unit setUnitLoadout getUnitLoadout player;
