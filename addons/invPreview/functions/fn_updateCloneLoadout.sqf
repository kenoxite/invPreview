// KIV_fnc_updateCloneLoadout
// Updates the preview unit's loadout to match the player's current gear

if (isNil "KIV_preview_unit") exitWith {};
KIV_preview_unit setUnitLoadout getUnitLoadout player;
