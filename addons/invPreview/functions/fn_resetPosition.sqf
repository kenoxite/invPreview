// KIV_fnc_resetPosition
// Resets the preview position to the stored default values

if (isNil "KIV_defaultPos") exitWith {};
KIV_defaultPos call KIV_fnc_reposition;
